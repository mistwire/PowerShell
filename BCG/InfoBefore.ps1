###############################################################################
# infoAfter.ps1
# Creates new folder & Pulls system info & writes to a file for comparison after migration to new Datacenter is completed.
# Brings up DNS hosts file for reveiw
# Brings up KMS settings for review
# Brings up network settings to save clicks & time
###############################################################################
# Created: 2017.12.30 by Chris F. Williams
# Updated: 
###############################################################################
# To Do List:
# 1. 
###############################################################################

md c:\migration_checklist
Get-Service | Select-Object DisplayName,Status,StartType |Sort-Object status -Descending |Export-Csv C:\migration_checklist\services_pre-migration.csv -NoTypeInformation
notepad C:\Windows\System32\drivers\etc\hosts
C:\Windows\System32\slmgr.vbs -dli
ncpa.cpl


