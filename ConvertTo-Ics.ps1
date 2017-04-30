# Jonas 
function ConvertTo-Ics 
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  ConfirmImpact='Medium')]

    Param
    (
        # Start Time of event
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [Alias("StartTime")]
        [datetime]
        $DTStart,

        # End Time of event
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [Alias("EndTime")]
        [datetime]
        $DTEnd,

        # Summary / subject of event
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [Alias("Title")]
        [string]
        $Summary,

        # Location of event
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [Alias("Room")]
        [string]
        $Location,

        # Description of event
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true)]       
        [string]
        $Description,

        # Reminder Number of minutes
        [Parameter(Mandatory=$false)]
        [int]
        $Reminder
    )

    Begin
    {
        $DTBegin = "{0:yyyyMMddTHHmmss}" -f $DTStart
"BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//PowerShell/handcal//NONSGML v1.0//EN
BEGIN:VTIMEZONE
TZID:Romance Standard Time
BEGIN:STANDARD
DTSTART:$DTBegin
RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10
TZOFFSETFROM:+0200
TZOFFSETTO:+0100
END:STANDARD
BEGIN:DAYLIGHT
DTSTART:16010325T020000
RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=3
TZOFFSETFROM:+0100
TZOFFSETTO:+0200
END:DAYLIGHT" | Write-Output
    }
    Process
    {

        $DTStart = "{0:yyyyMMddTHHmmss}" -f $DTStart
        $DTEnd = "{0:yyyyMMddTHHmmss}" -f $DTEnd

"BEGIN:VEVENT
UID:201704170T172345Z-AF23B2@psconf.eu
DTSTAMP:201704170T172345Z
DTSTART:$DTStart
DTEND:$DTEnd
SEQUENCE:1
SUMMARY:$Summary
LOCATION:$Location
DESCRIPTION:$Description
BEGIN:VALARM
TRIGGER:-PT15M
ACTION:DISPLAY
DESCRIPTION:Reminder
END:VALARM
END:VEVENT" | Write-Output


    }
    End
    {
        "END:VCALENDAR" | Write-Output
    }


}