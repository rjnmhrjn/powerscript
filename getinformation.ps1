#Powershell script to get computer information

$TargetComp=Read-Host -Prompt "Enter the Name of the computer you want to change the name of "
#$Credential=Get-Credential
$ComputerInfo = Get-WmiObject Win32_ComputerSystem -computername $TargetComp
$ComputerInfo
$OSInfo= Get-WmiObject -Class Win32_OperatingSystem -computername $TargetComp
$OSInfo.Caption
$CPUInfo= Get-WmiObject Win32_Processor -computername $TargetComp | Select-Object Name
$CPUInfo
$MemInfo= GWMI Win32_PhysicalMemory -computername $TargetComp | Select BankLabel,Capacity,Speed
$MemInfo