#winstaller.ps1
[CmdletBinding()]

#parameter array to hold the input files
param (
    [Parameter(Mandatory)]
    [String[]]
    $InputFiles = @(),

    [Parameter(Mandatory)]
    [string]
    $TargetDirectory,

    [Parameter()]
    [char]
    $DirectoryMode
)

#First lets check if the directory exists
if(-Not ( Test-Path -Path $TargetDirectory)) {
    #if it doesn't, lets make it
    Write-Debug -Message "here uwu"
    mkdir $TargetDirectory
}


if ($DirectoryMode -eq 'd') {
    #we gonna use directory mode
    foreach ($dir in $InputFiles) {
        Copy-Item ($dir + "\*") -Destination $TargetDirectory -Recurse
    }
}
else {
    #lets use file mode
    foreach ($file in $InputFiles) {
        Copy-Item $file -Destination $TargetDirectory
    }
}

#add the new file to the path, but only if it's not already there 
if ( -Not (Select-String -InputObject $env:Path -Pattern $TargetDirectory -SimpleMatch -Quiet) ) {
    #set the path to the current path + target directory, change it for the entire machine. 
    [System.Environment]::SetEnvironmentVariable("PATH", $env:Path + "$TargetDirectory", [System.EnvironmentVariableTarget]::Machine)
}   

