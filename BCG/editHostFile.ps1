###############################################################################
# editHostFile.ps1
# Uses regular expressions to delete specific entries from the "C:\Windows\System32\Drivers\etc\hosts" file
###############################################################################
# Created: 2017.12.30 by Chris F. Williams
# Updated: 
###############################################################################
# To Do List:
# 1. 
###############################################################################

Write-Host "Modifying DNS host file for..." -ForegroundColor Yellow
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.10\s+binbap1bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.11\s+bim1s010bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.12\s+bim2s010bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.13\s+bim1s020bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.14\s+bim1s030bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.15\s+bim2s020bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*164.22.247.16\s+bim2s030bka',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*160.118.160.24\s+tsadm311',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*160.118.160.21\s+tsadm121',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
(Get-Content "$($env:windir)\system32\Drivers\etc\hosts")  -replace ('^\s*160.118.160.23\s+tsadm221',' ') |
Out-File "$($env:windir)\system32\Drivers\etc\hosts" -Force
