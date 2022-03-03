function Get-PublicHolidays {
    param (
        [Parameter()]
        [string]
        $Jurisdiction = "nsw",
        [Parameter()]
        [string]
        $ResourceID = '33673aca-0857-42e5-b8f0-9981b4755686'
    )
    $Holidays = @()
    $URI = "https://data.gov.au/data/api/3/action/datastore_search?resource_id="
    $Results = (Invoke-RestMethod -Uri "$($URI)$($ResourceID)" -Method Get).Result
    $JurisdictionResults = $Results.records | Where-Object {($_.Jurisdiction -eq $Jurisdiction)}
    $holidays = foreach ($Holiday in $JurisdictionResults){
        $HolidayDate = ([datetime]::ParseExact($Holiday.Date, 'yyyyMMdd', $null)).toshortdatestring()
        $HolidayEndDate = ([datetime]::ParseExact($Holiday.Date, 'yyyyMMdd', $null))
        $HolidayEndDateString = ($HolidayEndDate.AddDays(1)).ToShortDateString()
        [PSCustomObject]@{
            StartDate = $HolidayDate
            EndDate = $HolidayEndDateString
            Name = $Holiday.'Holiday Name'
        }

    }
    return $Holidays
}