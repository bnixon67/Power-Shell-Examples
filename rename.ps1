# Simple version
# you will need to adjust the regexp and the replace string to match what you what to do
$regexp='(?<YYYY>[0-9]{4})(?<MM>[0-9]{2})(?<DD>[0-9]{2})_OTHER_TEXT.pdf'
Get-ChildItem | Where-Object { $_.Name -match $regexp } | Rename-Item -NewName { $_.Name -replace $regexp, '${YYYY}-${MM}-${DD} UPDATED TEXT.pdf' }

# Complex version, which allows some more control and displays the actions
# You can comment out the Rename-Item action to test what will occur
$regexp='^Statement_(?<MM>[0-9]{2})-(?<DD>[0-9]{2})-(?<YYYY>[0-9]{4}).pdf'

Get-ChildItem | Where-Object { $_.Name -match $regexp } | ForEach {
  $YYYY = $Matches.YYYY
  $MM   = $Matches.MM
  $DD   = $Matches.DD

  $NewName = "$YYYY-$MM-$DD VENDOR.pdf"

  Write-Host $_.Name, "->", $NewName

  $_ | Rename-Item -NewName $NewName
}

$regexp='^VisaAnnualSummary_(?<YYYY>[0-9]{4}).pdf'

Get-ChildItem | Where-Object { $_.Name -match $regexp } | ForEach {
  $YYYY = $Matches.YYYY

  $NewName = "$YYYY-12-31 VENDOR Annual Summary.pdf"

  Write-Host $_.Name, "->", $NewName

  $_ | Rename-Item -NewName $NewName
}
