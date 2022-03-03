# PSPublicHolidays
Gets a list of Australia Public Holidays from the [Australian Public Holidays Dates Machine Readable Dataset](https://data.gov.au/dataset/ds-dga-b1bc6077-dadd-4f61-9f8c-002ab2cdff10).

Not my original code, updated to work with current API

## Example

    PS C:\Users\andrewcole\working\PSPublicHolidays> Import-Module .\publicholidays.ps1
    PS C:\Users\andrewcole\working\PSPublicHolidays> Get-PublicHolidays -Jurisdiction act
    
    StartDate  EndDate    Name
    ---------  -------    ----
    1/01/2021  2/01/2021  New Year's Day
    26/01/2021 27/01/2021 Australia Day
    8/03/2021  9/03/2021  Canberra Day
    2/04/2021  3/04/2021  Good Friday
    3/04/2021  4/04/2021  Easter Saturday
    4/04/2021  5/04/2021  Easter Sunday
    5/04/2021  6/04/2021  Easter Monday
    -- snip --
    8/04/2023  9/04/2023  Easter Saturday
    9/04/2023  10/04/2023 Easter Sunday
    10/04/2023 11/04/2023 Easter Monday
    25/04/2023 26/04/2023 Anzac Day
    5/06/2023  6/06/2023  Western Australia Day
    25/09/2023 26/09/2023 Queen's Birthday
    25/12/2023 26/12/2023 Christmas Day
    26/12/2023 27/12/2023 Boxing Day
