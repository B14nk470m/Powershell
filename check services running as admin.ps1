#This will add the AD modules
Import-Module activedirectory
#This will Query AD for and servers 
Get-ADComputer -Filter { OperatingSystem -Like '*Windows Server*' } -Properties OperatingSystem | Select Name, OperatingSystem | Format-Table -AutoSize
#Create a file in the TSG folder with the computer names called computers.txt
#Below sets the computer varible
$computers = Get-Content -Path C:\Computers.txt #Change this to a folder with write permissions
Get-WmiObject win32_service -cn $computers |where-object {$_.startname -eq "$($env:userdomain)\administrator"}| Format-Table __Server,displayname, startname