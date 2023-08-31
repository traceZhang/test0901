#Creating a New Folder

New-Item -Path 'C:\' -Name 'NewFolder' -ItemType 'directory'

#This script uses the New-Item cmdlet to create a new folder. The -Path parameter specifies where the folder will be created (in this case, in the C:\ directory). The -Name parameter gives the name of the new folder, and the -ItemType parameter specifies that the item being created is a directory (folder).

#Listing All Files in a Directory
Get-ChildItem -Path 'C:\SomeFolder'

#Creating a Scheduled Task
$action = New-ScheduledTaskAction -Execute "notepad.exe"
$trigger = New-ScheduledTaskTrigger -Daily -At 12pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "OpenNotepad" -Description "Opens Notepad every day at noon"

#To cancel or delete the scheduled task
Unregister-ScheduledTask -TaskName "OpenNotepad" -Confirm:$false

#Renaming Multiple Files
Get-ChildItem -Filter "*.txt" | Rename-Item -NewName {$_.Name -replace '.txt','.bak'}

#Deleting Files Older Than X Days
Get-ChildItem -Path "C:\Temp" -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | Remove-Item

#This script gets a recursive list of all items in the C:\Temp directory, then filters this list for items where the LastWriteTime is more than 30 days ago, and finally removes each item that fits these criteria.

#Downloading a File from the Internet
Invoke-WebRequest -Uri "http://www.google.com" -OutFile "C:\Temp\google.html"

#Downloading an Image File
Invoke-WebRequest -Uri "http://example.com/image.jpg" -OutFile "C:\Temp\image.jpg"

#System Administration Scripts
#Creating a new user
New-LocalUser -Name "NewUser" -Password (ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force)

#Getting system information
Get-ComputerInfo -Property "OsName", "OsVersion", "CsTotalPhysicalMemory", "CsNumberOfProcessors"

#Listing all running processes
Get-Process

#Network Scripts
#Pinging a host
Test-Connection -ComputerName www.google.com

#Getting the IP address of a host
Resolve-DnsName -Name www.google.com

#Opening a network connection
Test-NetConnection -ComputerName www.google.com -Port 80

#Active Directory Scripts
#Creating a new AD user
New-ADUser -Name "NewUser" -GivenName "New" -Surname "User" -SamAccountName "NewUser" -UserPrincipalName "NewUser@yourdomain.com"

#Getting a list of all AD users
Get-ADUser -Filter '*'

#Adding a user to an AD group
Add-ADGroupMember -Identity "GroupName" -Members "UserName"

#Database Scripts
#Querying a SQL Server database
Invoke-Sqlcmd -ServerInstance "ServerName" -Database "DatabaseName" -Query "SELECT * FROM TableName"

#Backing up a SQL Server database
Backup-SqlDatabase -ServerInstance "ServerName" -Database "DatabaseName" -BackupFile "Path\to\backup.bak"

#Restoring a SQL Server database
Restore-SqlDatabase -ServerInstance "ServerName" -Database "DatabaseName" -BackupFile "Path\to\backup.bak"

#Cloud Services Scripts
#Creating a new virtual machine in Azure
New-AzVm -ResourceGroupName "ResourceGroupName" -Name "VMName" -Location "West US" -Credential (Get-Credential)

#Starting an AWS EC2 instance
Start-EC2Instance -InstanceId "InstanceId"

#Creating a new storage bucket in Google Cloud
New-GcsBucket -Name "BucketName" -Location "US"

#Web Scraping Scripts
#Downloading a web page
Invoke-WebRequest -Uri "http://www.google.com" -OutFile "google.html"

#Parsing HTML from a web page
(Invoke-WebRequest -Uri "http://www.google.com").Links

#Submitting a form on a webpage
$Form = Invoke-WebRequest -Uri "http://example.com/formpage" -SessionVariable SV
$Form.Forms[0].Fields["field_name"] = "field_value"
Invoke-WebRequest -Uri ("http://example.com" + $Form.Forms[0].Action) -WebSession $SV -Method POST -Body $Form.Forms[0].Fields

#Testing Scripts
#Running a Pester test
Invoke-Pester -Script "tests.ps1"

#Testing a network connection
Test-NetConnection -ComputerName www.google.com

#Testing a SQL query
try {
    Invoke-Sqlcmd -ServerInstance "ServerName" -Query "SELECT * FROM TableName"
    Write-Output "Query successful"
} catch {
    Write-Output "Query failed: $_"
}

#Scheduled Task Scripts
#Creating a scheduled task
$Action = New-ScheduledTaskAction -Execute "notepad.exe"
$Trigger = New-ScheduledTaskTrigger -Daily -At 12pm
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "OpenNotepad" -Description "Opens Notepad every day at noon"

#Listing all scheduled tasks
Get-ScheduledTask

#Deleting a scheduled task
Unregister-ScheduledTask -TaskName "TaskName" -Confirm:$false
