function Get-PublicHolidays {
    $Holidays = @()
    $URI = "https://data.gov.au/data/api/3/action/datastore_search?resource_id="
    $ResourceID = '2dee10ef-2d0c-44a0-a66b-eb8ce59d9110'
    $Results = (Invoke-RestMethod -Uri "$($URI)$($ResourceID)" -Method Get).Result
    $NSWResults = $Results.records | Where-Object {($_.Jurisdiction -eq "nsw")}
    $holidays = foreach ($Holiday in $NSWResults){
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