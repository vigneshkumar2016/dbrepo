$Date= Get-Date
Write-Host "------------------------------------------------------------"
Write-Host " FILES GENERATED UNDER FINPROD FOLDER FOR" $Date
Write-Host "------------------------------------------------------------"
Write-Host "DETAILS OF FILES GENERATED TODAY UNDER FOLDER GE"
Write-Host "------------------------------------------------------------"
Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\GE" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEINMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|ft
Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\GE" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEINMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|Measure-Object FullName|Select Count
$file_count_ge=(Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\GE\" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEINMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|Measure-Object Ful).Count
Write-Host "Count of Files Generated are" $fie_count_ge 
Write-Host "*************************************************************"
Write-Host "------------------------------------------------------------"
Write-Host "DETAILS OF FILES GENERATED TODAY UNDER FOLDER CRB"
Write-Host "------------------------------------------------------------"
Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\GE\CRB" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|ft
$file_count_crb=(Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\GE\CRB\" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEINMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|Measure-Object FullName).Count
Write-Host "Count of Files Generated are" $fie_count_crb 
Write-Host "*************************************************************"
Write-Host "DETAILS OF FILES GENERATED TODAY UNDER FOLDER METLIFE"
Write-Host "------------------------------------------------------------"
Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\METLIFE\" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|ft
$file_count_met=(Get-ChildItem -Path "G:\PSFTP_ROOT\finprod\PCS_DATA\METLIFE\" -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIZEINMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.Age -eq 0}|Select-Object FullName, CreationTime|Measure-Object FullName).Count
Write-Host "Count of Files Generated are" $fie_count_met 
Write-Host "*************************************************************"
