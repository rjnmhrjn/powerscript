# Uses Quest Active Roles 
# Free to download http://www.quest.com/powershell/activeroles-server.aspx 
# 
# Special Thanks to Mladen Milunovic for his comments that improved the Script! 
# 
# List all computers that have been 
# Inactive in "Active Directory"(Boy THERE'S a play on words!) 
# for a specified Number of Days 
#  
# New version exports the Data to a CSV file and removes limit 
# on number of Computers listed (default is 1000) 
#  
$COMPAREDATE=GET-DATE 
# 
# DO NOT RUN THIS IN PRODUCTION. TEST IT FIRST and use it as 
# a REFERENCE tool.   AUTO PURGING OF COMPUTER ACCOUNTS is 
# DANGEROUS and SILLY. 
# 
# But this little query might help you weed out accounts 
# of potentially dead systems in Active Directory 
#  
# 
# Number of Days to see if account has been active 
# Within 
# 
$NumberDays=90 
# 
$CSVFileLocation='C:\TEMP\OldComps.CSV' 
# 
# 
GET-ADCOMPUTER -SizeLimit 0 -IncludedProperties LastLogonTimeStamp | where { ($CompareDate-$_.LastLogonTimeStamp).Days -gt $NumberDays } | Select-Object Name, LastLogonTimeStamp, OSName, ParentContainerDN | Sort-Object ModificationDate, Name | Export-CSV $CSVFileLocation 
# 
# 