param([string] $file=$(throw "Please specify a filename."))|Read-host "Enter the File name" $file|
(get-command $file).Definition