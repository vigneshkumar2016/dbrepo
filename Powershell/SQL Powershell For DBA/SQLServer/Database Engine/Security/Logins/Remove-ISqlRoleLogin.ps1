<#
	.SYNOPSIS
		Remove-ISqlRoleLogin
	.DESCRIPTION
		Remove Login from a Database Role in all Databases excluding System DBs
	.PARAMETER serverInstance
		SQL Server instance
	.PARAMETER login
		Login to remove from role
	.PARAMETER dbrole
		Database role 
	.EXAMPLE
		.\Remove-ISqlRoleLogin -serverInstance MyServer\SQL2012 -login mydomain\jsmith -role db_backoperator
	.INPUTS
	.OUTPUTS
	.NOTES
	.LINK
#>

param (
	[string]$serverInstance = "$(Read-Host 'Server Instance' [e.g. Server01\SQL2012])",
	[string]$login = "$(Read-Host 'Login' [e.g. mydomain\jsmith])",
	[string]$dbrole = "$(Read-Host 'Database role' [e.g. db_backupoperator])"
)

begin {
	[void][System.Reflection.Assembly]::LoadWithPartialName( 'Microsoft.SqlServer.SMO')
}
process {
	try {
		# Connect to the instance using SMO
		$server = new-object Microsoft.SqlServer.Management.Smo.Server $serverInstance

		$messages = @()

		If ($server -eq $null) {
			Throw "$serverInstance is not a valid Server Instance"
		}

		# Get the defined login - if it doesn't exist it's an error
		$log = $server.Logins[$login]
		if ($log -eq $null) {
			Throw "$login is not a valid SQL Server Login on $serverInstance."
		}

		foreach ($db in $server.Databases) {
			# Do not add to system databases
			If ($db.IsSystemObject -eq $false) {
				$dbname = $db.Name
				$logname = $log.Name

				# Check to see if the login is a user in this database
				$usr = $db.Users[$logname]
				if ($usr -eq $null) {
					$messages += "$logname is not a valid SQL Server Login on $serverInstance in $db"
				} else {
					# Get the role - if it doesn't exist in the database it's an error
					$role = $db.Roles[$dbrole]
					if ($role -eq $null) {
						$messages += "$dbrole is not a valid SQL Server Role on $serverInstance in $db"
					} else {
						# Check to see if the user is a member of the role
						if ($usr.IsMember($dbrole) -eq $True) {
							# Not a member, so add that role
							$cnStr = "Data Source=$serverInstance;Integrated Security=SSPI;Initial Catalog=$dbname"
							$cn = new-object System.data.SqlClient.SqlConnection $cnStr
							$cn.Open()
							$query = "EXEC sp_droprolemember @rolename = N'$dbrole', @membername = N'$logname'"
							$cmd = new-object System.Data.SqlClient.SqlCommand $query, $cn
							$cmd.ExecuteNonQuery() | out-null
							$cn.Close()
							$messages += "Login $logname dropped from $dbrole in $dbname."
						}
					}
				}
			}
		}
		
		Write-Output $messages 

	}
	catch [Exception] {
		Write-Error $Error[0]
		$err = $_.Exception
		while ( $err.InnerException ) {
			$err = $err.InnerException
			Write-Output $err.Message
		}
	}
}