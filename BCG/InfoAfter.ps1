Get-NetIPAddress | Select-Object InterfaceAlias,IPv4Address |Export-Csv C:\migration_checklist\New_IP.csv -NoTypeInformation
Get-Service | Select-Object DisplayName,Status,StartType |Sort-Object status -Descending |Export-Csv C:\migration_checklist\services_post-migration.csv -NoTypeInformation
