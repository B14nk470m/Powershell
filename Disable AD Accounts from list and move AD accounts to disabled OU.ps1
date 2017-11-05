Disable AD Accounts from list and move AD accounts to disabled ou
Import-Module activedirectory

$CSV = Read-Host -Prompt 'Input the path to the CSV file with the samAccountName colum'
$list = Import-CSV $CSV
forEach ($item in $list) {
$samAccountName = $item.samAccountName
Disable-ADAccount -Identity $samAccountName
}
$targetOU = Read-Host -Prompt 'Input the OU to move the disabled users to eg. OU=Users,OU=Disabled,DC=example,DC=local'
forEach ($item in $list) {
   Get-ADUser -Identity $item.samAccountName| Move-ADObject -TargetPath '$targetOU'
}