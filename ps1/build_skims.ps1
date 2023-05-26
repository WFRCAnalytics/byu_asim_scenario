# Build skims

if (Test-Path $HOME\Documents\WindowsPowerShell\profile.ps1) {
    Write-Output "Found profile.ps1. Will use this."
    . $HOME\Documents\WindowsPowerShell\profile.ps1
} else {
    Write-Output "ERROR: No profile.ps1 found in home directory ($HOME\Documents\WindowsPowerShell\). Conda will not work."
    Write-Output "Run 'conda init powershell' to add the required entry to profile.ps1, then re-run."
    exit 1
}

$arg1 = $args[0]
$arg2 = $args[1]
$arg3 = $args[2]

& Write-Output "Manifest path: $arg1"
& Write-Output "Data path: $arg2"
& Write-Output "Skims omx output path: $arg3"

& conda activate ASIM_DEV

$parentDir = Split-Path -Parent $PSScriptRoot

$buildOmxPath = Join-Path $parentDir "/py/build_omx.py"
$path1 = Join-Path $parentDir $arg1
$path2 = Join-Path $parentDir $arg2
$path3 = Join-Path $parentDir $arg3

if (python $buildOmxPath $path1 $path2 $path3) {
    exit 1
}
