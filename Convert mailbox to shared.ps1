#Convert mailbox to shared mailbox
$identity = Read-Host -Prompt 'Input the UPN of the user'
Get-Mailbox -identity $identity | set-mailbox -type “Shared”