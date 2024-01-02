# CopyByMonth <https://github.com/ahera1/CopyByMonth>
# by ahera

# ----------------------------------------------------------------

# Load settings file
$settings = Join-Path $PSScriptRoot "settings.ps1"
. $settings

# ----------------------------------------------------------------
$files = Get-ChildItem -Path $source -Recurse -File

foreach ($file in $files) {
    $year = $file.CreationTime.Year
    $month = $file.CreationTime.Month.ToString("00")

    $folder = "$destination\$destination_prefix$year\$year$month"

    if (-not (Test-Path $folder)) {
        New-Item -Path $folder -ItemType Directory
    }

    $filename = "$folder\$($file.Name)"

    # Not overwrite if a copy destination exists
    if (-not (Test-Path $filename)) {
        Copy-Item -Path $file.FullName -Destination $folder
    }
}
# ----------------------------------------------------------------
