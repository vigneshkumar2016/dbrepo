#
#Script for Finding out the files which are missed to generate in a Folder
#Script by VIGNESHKUMAR VENUGOPAL
#

#Declaring the varibles for getting the count

$folder_path_ge= "G:\PSFTP_ROOT\finprod\PCS_DATA\GE"
$folder_path_crb= "G:\PSFTP_ROOT\finprod\PCS_DATA\GE\CRB"
$folder_path_elm= "G:\PSFTP_ROOT\elmprod"
$folder_path_hcm ="G:\PSFTP_ROOT\hcmprod\PCS_ONB"
$folder_path_metlife ="G:\PSFTP_ROOT\finprod\PCS_DATA\METLIFE"

$Output_file_ge= "E:\powershell_xml_checker_output\Out_GE.txt"
$Output_file_crb= "E:\powershell_xml_checker_output\Out_CRB.txt"
$Output_file_elm= "E:\powershell_xml_checker_output\Out_ELM.txt"
$Output_file_hcm= "E:\powershell_xml_checker_output\Out_HCM.txt"
$Output_file_metlife= "E:\powershell_xml_checker_output\Out_METLIFE.txt"

$Compare_Actual_file_ge= "E:\powershell_xml_checker_output\Actual_File_ge.txt"
$Compare_Actual_file_crb= "E:\powershell_xml_checker_output\Actual_File_crb.txt"
$Compare_Actual_file_elm= "E:\powershell_xml_checker_output\Actual_File_elm.txt"
$Compare_Actual_file_hcm= "E:\powershell_xml_checker_output\Actual_File_hcm.txt"
$Compare_Actual_file_metlife= "E:\powershell_xml_checker_output\Actual_File_Metlife.txt"

#Generating the File Contents in folders to a Text File for Comparision

Get-ChildItem -Path $folder_path_ge -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.CreationTime -eq (Get-Date)}|Select-Object FullName|Export-CSV $Compare_Actual_file_ge -Force
$data_ge= Get-Content $Compare_Actual_file_ge

Get-ChildItem -Path $folder_path_crb -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.CreationTime -eq (Get-Date)}|Select-Object FullName|Export-CSV $Compare_Actual_file_crb -Force
$data_crb= Get-Content $Compare_Actual_file_crb

Get-ChildItem -Path $folder_path_elm -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.CreationTime -eq (Get-Date)}|Select-Object FullName|Export-CSV $Compare_Actual_file_elm -Force
$data_elm= Get-Content $Compare_Actual_file_elm

Get-ChildItem -Path $folder_path_hcm -recurse -include @("*.xml") -Exclude@("*.bat") | Select-Object FullName, CreationTime, @{Name="SIMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.CreationTime -eq (Get-Date)}|Select-Object FullName|Export-CSV $Compare_Actual_file_hcm -Force
$data_hcm= Get-Content $Compare_Actual_file_hcm

Get-ChildItem -Path $folder_path_metlife -recurse -include @("*.xml") -Exclude@("*.bat*") | Select-Object FullName, CreationTime, @{Name="SIMB";Expression={$_.Length/1024}}, @{Name="Age";Expression={(((Get-Date) - $_.CreationTime).Days)}}|? {$_.CreationTime -eq (Get-Date)}|Select-Object FullName|Export-CSV $Compare_Actual_file_metlife -Force
$data_metlife= Get-Content $Compare_Actual_file_metlife


#Checking the File in Folder GE for XMLs that are missing
Clear-host
$List_array_ge = ("COMPETENCIES","COMPETENCY_TBL","PCS_ACTEFFRT_VW","PCS_BILL_LVL_VW","PCS_CUSTBLAD_VW","PCS_CUSTINFO_VW","PCS_CUSTSHAD_VW","PCS_DESG_MST_VW","PCS_EMPADDTL_VW","PCS_EMP_DTL_VW","PCS_GE_CUST_TBL","PCS_GE_DTL_VW","PCS_GE_INV_TBL","PCS_GE_PRJ_VW","PCS_GE_PROJ_TBL","PCS_GE_UNMT_TBL","PCS_LOC_MST_VW","PCS_MAIN_ACT_VW","PCS_NGE_ALOC_VW","PCS_PER_DATA_VW","PCS_PRJEFFRT_VW","PCS_PRJ_EFRT_VW","PCS_PRJ_INF_TBL","PCS_REGION_VW","PCS_RS_ALLOC_VW","PCS_SERV_MST_VW","PCS_SUBSBU_VW","PCS_SUB_ACTS_VW","PCS_TM_SHEET_VW")
Write-host "-------------------------------------"
Write-Host "Status of Missing Files"
Write-host "-------------------------------------"
Write-host "Path GE:" $folder_path_ge
Write-host "-------------------------------------"
for($i=0;$i -le $List_array_ge.Length-1;$i++)
{
 if($data_ge -like "*.xml*" -contains $List_array_ge){} Else {}
}
for($i=0;$i -le $List_array.Length;$i++)
{
    Write-Host $List_array_ge[$i]
}
Write-Host "---------------------------------------"
Write-Host "Count of Missing File is " $i
Write-Host "---------------------------------------"


#Checking the File in Folder CRB for XMLs that are missing
$List_array_crb = ("COMPETENCIES","COMPETENCY_TBL","PCS_ACTEFFRT_VW","PCS_BILL_LVL_VW","PCS_CUSTBLAD_VW","PCS_CUSTINFO_VW","PCS_CUSTSHAD_VW","PCS_DESG_MST_VW","PCS_EMPADDTL_VW","PCS_EMP_DTL_VW","PCS_GE_CUST_TBL","PCS_GE_DTL_VW","PCS_GE_INV_TBL","PCS_GE_PRJ_VW","PCS_GE_PROJ_TBL","PCS_GE_UNMT_TBL","PCS_LOC_MST_VW","PCS_MAIN_ACT_VW","PCS_NGE_ALOC_VW","PCS_PER_DATA_VW","PCS_PRJEFFRT_VW","PCS_PRJ_EFRT_VW","PCS_PRJ_INF_TBL","PCS_REGION_VW","PCS_RS_ALLOC_VW","PCS_SERV_MST_VW","PCS_SUBSBU_VW","PCS_SUB_ACTS_VW","PCS_TM_SHEET_VW")
Write-host "-------------------------------------"
Write-Host "Status of Missing Files"
Write-host "-------------------------------------"
Write-host "Path CRB:" $folder_path_crb
Write-host "-------------------------------------"
for($j=0;$j -le $List_array_crb.Length;$j++)
{
 if($data_crb -like "*.xml*" -contains $List_array_crb){} Else {}
}
for($j=0;$j -le $List_array_crb.Length;$j++)
{
    Write-Host $List_array_crb[$j]
}
Write-Host "---------------------------------------"
Write-Host "Count of Missing File is " $j
Write-Host "---------------------------------------"


#Checking the File in Folder ELM for XMLs that are missing
$List_array_elm = ("PCS_GE_GDC_VW","PCS_REF_AWR")
Write-host "-------------------------------------"
Write-Host "Status of Missing Files"
Write-host "-------------------------------------"
Write-host "Path ELM:" $folder_path_elm
Write-host "-------------------------------------"
for($k=0;$k -le $List_array_elm.Length-1;$k++)
{
 if($data_elm -like "*.xml*" -contains $List_array_elm){} Else {}
}
for($k=0;$k -le $List_array_elm.Length;$k++)
{
    Write-Host $List_array_elm[$k]
}
Write-Host "---------------------------------------"
Write-Host "Count of Missing File is " $k
Write-Host "---------------------------------------"


#Checking the File in Folder HCM for XMLs that are missing
$List_array_hcm = ("PCS_OFB_XL_REC","PCS_ONB_VISA_VW","PCS_ONB_XL_REC")
Write-host "-------------------------------------"
Write-Host "Status of Missing Files"
Write-host "-------------------------------------"
Write-host "Path HCM:" $folder_path_hcm
Write-host "-------------------------------------"
for($l=0;$l -le $List_array_hcm.Length-1;$l++)
{
 if($data_hcm -like "*.xml*" -contains $List_array_hcm){} Else {}
}
for($l=0;$l -le $List_array_hcm.Length;$l++)
{
    Write-Host $List_array_hcm[$l]
}
Write-Host "---------------------------------------"
Write-Host "Count of Missing File is " $l
Write-Host "---------------------------------------"


#Checking the File in Folder METLIFE for XMLs that are missing
$List_array_metlife = ("PCS_OFB_XL_REC","PCS_ONB_VISA_VW","PCS_ONB_XL_REC")
Write-host "-------------------------------------"
Write-Host "Status of Missing Files"
Write-host "-------------------------------------"
Write-host "Path METLIFE:" $folder_path_metlife
Write-host "-------------------------------------"
for($m=0;$m -le $List_array_metlife.Length-1;$m++)
{
 if($data_metlife -like "*.xml*" -contains $List_array_metlife){} Else {}
}
for($m=0;$m -le $List_array_metlife.Length;$m++)
{
    Write-Host $List_array_metlife[$m]
}
Write-Host "---------------------------------------"
Write-Host "Count of Missing File is " $m
Write-Host "---------------------------------------"