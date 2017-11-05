New-ReceiveConnector -Name "Application Anonymous Relay" -Usage Custom -PermissionGroups AnonymousUsers -Bindings 192.168.16.2:25 -RemoteIpRanges 192.168.16.3 
#Change name of what the conncetor needs to be called, set the binding to the IP of the exchange server nad set the remote IP range to ip needed or 192.168.16.0/24
Get-ReceiveConnector "Application Anonymous Relay" | Add-ADPermission -User "NT AUTHORITY\ANONYMOUS LOGON" -ExtendedRights "Ms-Exch-SMTP-Accept-Any-Recipient" 
#Change the "ReceiveConnector" to the name set in the previous step