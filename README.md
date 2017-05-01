# PSConfEU_ConvertTo-Ics

Inspired by [link](http://www.powertheshell.com/agendacompetition/)

## Installation
'Find-Module ConvertTo-Ics | Install-Module'
(Works out of box with PowerShell 5.0 e.g. Windows 10)


## Examples 
### Output selected events (select and click OK bottom right)
`PS C:\temp> (iwr powershell.love -UseB).Content.SubString(1) | ConvertFrom-Json | %{$_} | ogv -PassThru | ConvertTo-Ics | Set-Content -Path c:\temp\FirstTest.ics -Encoding Default`

### Output first 3 events
`PS C:\temp> (iwr powershell.love -UseB).Content.SubString(1) | ConvertFrom-Json | %{$_} | select -First 3 | ConvertTo-Ics | Set-Content -Path c:\temp\SecondTest.ics -Encoding Default`

### Output All events
`PS C:\temp> (iwr powershell.love -UseB).Content.SubString(1) | ConvertFrom-Json | %{$_} | ConvertTo-Ics | Set-Content -Path c:\temp\ThirdTest.ics -Encoding Default`
Outputs all events to ThirdTest.ics

It's testing and not 100% complient with https://icalendar.org/validator.html But Outlook seems to be ok with the .ics created. 




Ideas are more than welcome :) 
