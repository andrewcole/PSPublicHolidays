function Get-PublicHolidays {
    [CmdletBinding()]
    param (
    [ValidateSet("act","nsw","nt","qld","sa","tas","vic","wa")]
    [Parameter()]
        [string]
        $Jurisdiction = "nsw",
        [Parameter()]
        [string]
        $ResourceID = '33673aca-0857-42e5-b8f0-9981b4755686'
    )
    $URI = "/api/3/action/datastore_search?resource_id=$($ResourceID)"
    do {
        $Results = (Invoke-RestMethod -Uri "https://data.gov.au$($URI)" -Method Get).Result
        $JurisdictionResults = $Results.records | Where-Object {($_.Jurisdiction -eq $Jurisdiction)}
        foreach ($Holiday in $JurisdictionResults){
            $HolidayDate = ([datetime]::ParseExact($Holiday.Date, 'yyyyMMdd', $null)).toshortdatestring()
            $HolidayEndDate = ([datetime]::ParseExact($Holiday.Date, 'yyyyMMdd', $null))
            $HolidayEndDateString = ($HolidayEndDate.AddDays(1)).ToShortDateString()
            [PSCustomObject]@{
                StartDate = $HolidayDate
                EndDate = $HolidayEndDateString
                Name = $Holiday.'Holiday Name'
            }
        }
        $URI = $Results._links.next
    } while ($Results.records.length -gt 0)
}