#Changes the name of the domain joined computer you enter.  Prompts for admin credentials- include the domain name when you put credentials in.

#Prompts for whether or not you want to restart the renamed computer imeadiately- changes do not take effect until restart.

$TargetComp=Read-Host -Prompt "Enter the Name of the computer you want to change the name of "
$Credential=Get-Credential
$ComputerName= GWMI Win32_ComputerSystem -computername $TargetComp -Authentication 6
Write-Host "Computer Name to be renamed is " $ComputerName
$NewName = Read-Host -Prompt "Please Enter the new Computer Name to use "
$Go=Read-Host -prompt "Proceed with computer name change? (Y / N)"
If(($Go-eq"Y")-or($Go-eq"y"))
{
$ComputerName.Rename($NewName,$Credential.GetNetworkCredential().Password,$Credential.Username)
}
$Reboot=Read-host -Prompt "Do you want to restart the computer? (Y / N)"
If(($Reboot-eq"Y")-or($Reboot-eq"y"))
{
restart-computer -computername $TargetComp
}