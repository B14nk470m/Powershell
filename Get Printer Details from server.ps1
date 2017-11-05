$printserver = Read-Host -prompt 'Input Print server name'
Get-WMIObject -class Win32_Printer -computer $printserver | Select Name,DriverName,PortName | Export-CSV -path 'C:tsg\printers.csv'