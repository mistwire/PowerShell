$GC = Get-Credential
Connect-VIServer 192.168.1.14 -Credential $GC -SaveCredentials
$vms = @(Import-CSV "C:\Users\chris\Documents\GitHub\PowerShell\BCG\NewVMs.csv")
#$GC1 = $Host.UI.PromptForCredential("Please enter credentials", "Enter Guest credentials for VM", "Administrator", "")


foreach ($vm in $vms){
$VMName = $vm.Name
$VMUSER = $vm.VMuser 
$VMPASS = $vm.VMpass 
$IP = $vm.IP
$SNM = $vm.SubnetMask
$GW = $vm.Gateway
$DNS1 = $vm.DNS1
$DNS2 = $vm.DNS2
$WINS1 = $vm.WINS1
$WINS2 = $vm.WINS2
$Network = $vm.Network
$Template = $vm.Template
 
DO {(Get-VMGuest $VMName).HostName}
while (((Get-VMGuest $VMName).HostName) -Ne "$VMName")

'''
Get-VM $VMName | Update-Tools

DO {
$VMTool = Get-VM $VMName
$VMTool | Select -ExpandProperty ExtensionData | Select -ExpandProperty guest
$VMToolStatus = $VMTool.ExtensionData.Guest.ToolsRunningStatus
Write-host "Checking that VMWare Tools are running on"$VMName -ForegroundColor Yellow
Sleep -Seconds 5
Write-host "Still checking for VMWare Tools on"$VMName -ForegroundColor Yellow
}
While ($VMToolStatus -ne "guestToolsRunning")
Write-Host "VMWare tools are now running on"$VMName -ForegroundColor Green
 '''
$Network = Invoke-VMScript -VM $VMName -ScriptType Powershell -ScriptText "(gwmi Win32_NetworkAdapter -filter 'netconnectionid is not null').netconnectionid" -GuestUser $VMUSER -GuestPassword $VMPASS
$NetworkName = $Network.ScriptOutput
$NetworkName = $Networkname.trim()

Write-Host "Setting IP address for $VMname..." -ForegroundColor Yellow
$netsh = "c:\windows\system32\netsh.exe interface ip set address ""$NetworkName"" static $IP $SNM $GW"
$netsh2 = "c:\windows\system32\netsh.exe interface ip set dnsservers ""$NetworkName"" static $DNS1"
$netsh3 = "c:\windows\system32\netsh.exe interface ip add dnsservers ""$NetworkName"" $DNS2"
#$netsh4 = "c:\windows\system32\netsh.exe interface ip set winsservers ""$NetworkName"" static $WINS1"
#$netsh5 = "c:\windows\system32\netsh.exe interface ip add winsservers ""$NetworkName"" $WINS2"
Invoke-VMScript -VM $VMname -GuestUser $VMUSER -GuestPassword $VMPASS -ScriptType bat -ScriptText $netsh
Invoke-VMScript -VM $VMname -GuestUser $VMUSER -GuestPassword $VMPASS -ScriptType bat -ScriptText $netsh2
Invoke-VMScript -VM $VMname -GuestUser $VMUSER -GuestPassword $VMPASS -ScriptType bat -ScriptText $netsh3
#Invoke-VMScript -VM $VMname -GuestUser $VMUSER -GuestPassword $VMPASS -ScriptType bat -ScriptText $netsh4
#Invoke-VMScript -VM $VMname -GuestUser $VMUSER -GuestPassword $VMPASS -ScriptType bat -ScriptText $netsh5
Write-Host "Setting IP address completed." -ForegroundColor Green
}
