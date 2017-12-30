###############################################################################
# infoAfter.ps1
# Pulls system info & writes to a file for comparison after migration to new Datacenter is completed.
# Also disables firewall settings per customer request.
###############################################################################
# Created: 2017.12.30 by Chris F. Williams
# Updated: 
###############################################################################
# To Do List:
# 1. 
###############################################################################

Get-NetIPAddress | Select-Object InterfaceAlias,IPv4Address |Export-Csv C:\migration_checklist\New_IP.csv -NoTypeInformation
Get-Service | Select-Object DisplayName,Status,StartType |Sort-Object status -Descending |Export-Csv C:\migration_checklist\services_post-migration.csv -NoTypeInformation
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
