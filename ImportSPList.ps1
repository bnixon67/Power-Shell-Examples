# Setup steps below
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# Install-Module -Name SharePointPnPPowerShellOnline -Scope CurrentUser

$credentials = Get-Credential -Message “Please Enter SharePoint Online credentials”

$site =”https://TENANT.sharepoint.com/sites/SITE”

Connect-PnPOnline -Url $site -Credentials $credentials

$data = Import-CSV "PATH TO CSV FILE"

# must use internal (not disdplay) name for the SharePoint fields
# edit column in SharePoint and look at the value of Field in the URL

foreach ($item in $data) {
 Add-PnPListItem -List "LIST" -Values @{
 "ColIntName1"= $item.'Field1';
 "ColIntName2"= $item.'Field2';
 "ColIntName3"= $item.'Field3'
 }
}
