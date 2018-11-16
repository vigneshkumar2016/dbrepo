$CompStat = Get-WmiObject win32_computersystem;
$Localhst = $CompStat.Name;
$Computer = [ADSI]('WinNT://'+$localhst+',computer');
$group = [ADSI]('WinNT://'+$Localhst+'/Remote Desktop Users,group');
$Members = @($group.psbase.Invoke("Members"));
$Members | ForEach-Object {$MemberNames += $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null);}|
Write-Host $MemberNames