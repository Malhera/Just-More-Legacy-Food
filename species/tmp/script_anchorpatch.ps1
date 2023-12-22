# Assuming the script is in the same directory as the files
$directory = Get-Location
$objectExtension = ".species"
$patchExtension = ".patch"
$binFileName = "script_anchorpatch_data.bin"
$PS1file = "script_anchorpatch.ps1"
$ExecutionPolicyBypass = "epb.txt"

# Replace the content of all .object.patch files with the content of the defined .bin file
$binFilePath = Join-Path $directory $binFileName
$replaceContent = Get-Content $binFilePath -Raw
Get-ChildItem -Path $directory -Filter "*$objectExtension$patchExtension" -File -Recurse | ForEach-Object {
    $replaceContent | Set-Content $_.FullName -Force
}
