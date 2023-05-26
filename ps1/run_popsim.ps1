# Run popsim

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

& Write-Output "Data path: $arg1"
& Write-Output "Output path: $arg2"

& conda activate popsim

$parentDir = Split-Path -Parent $PSScriptRoot

$runPopsimPath = Join-Path $parentDir "/runpopsim.py"
$path1 = Join-Path $parentDir $arg1
$path2 = Join-Path $parentDir $arg2

& Write-Output "runPopsimPath: $runPopsimPath"
& Write-Output "path1: $path1"
& Write-Output "path2: $path2"

if (python $runPopsimPath --config configs_popsim --data $path1 --output $path2) {
    exit 1
}