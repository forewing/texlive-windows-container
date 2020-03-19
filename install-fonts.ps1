$FONTS = 0x14
$Path = ".\fonts-to-be-installed"
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$Fontdir = Get-ChildItem $Path
foreach ($File in $Fontdir) {
    if (!($file.name -match "pfb$")) {
        $try = $true
        $installedFonts = @(Get-ChildItem c:\windows\fonts | Where-Object { $_.PSIsContainer -eq $false } | Select-Object basename)
        $name = $File.baseName

        foreach ($font in $installedFonts) {
            $font = $font -replace "_", ""
            $name = $name -replace "_", ""
            if ($font -match $name) {
                $try = $false
            }
        }
        if ($try) {
            $objFolder.CopyHere($File.fullname)
        }
    }
}

Write-Output "Step 1 of 4: Stopping the Windows Font Cache Service"

$svc = Get-Service fontcache

Stop-Service fontcache

$svc.WaitForStatus('Stopped')

Write-Output "Step 2 of 4: Starting the Windows Font Cache Service"

Start-Service fontcache

$svc.WaitForStatus('Running')

#Grab only the user cache files

$fontCacheFiles = Get-ChildItem "C:\Windows\ServiceProfiles\LocalService\AppData\Local\" -Filter "FontCache-S-*.dat"

#delete all the files that can be deleted. Many of the files will be locked if users are still connected, so it's best to skip over them.

$totalFileSizeDeleted = 0
$totalFilesDeleted = 0
$totalErrorFiles = 0

Write-Output "Step 3 of 4: Deleting FontCache-S-*.dat files."

foreach ($file in $fontCacheFiles) {
	try {
		$ErrorActionPreference = "Stop";
		$fileSize = $file.length;
		Remove-Item $file.fullname -Force;
		$totalFileSizeDeleted += $fileSize;
		$totalFilesDeleted++;
	}
	catch {
		Write-Output "Error deleting $file because it is in use by another process."
		$totalErrorFiles++;
	}
	finally {
		$ErrorActionPreference = "Continue";
	}
}

#Empty the recycle bin to clear additional space.

Write-Output "Step 4 of 4: Emptying Recycle Bin."

$recycleBin = (New-Object -ComObject Shell.Application).NameSpace(0xa)
$recycleBin.items() | ForEach-Object { Remove-Item $_.path -force -recurse }

Write-Output "Total Files Deleted: $totalFilesDeleted. Total Space Freed: $totalFileSizeDeleted. Total Files Not Deleted: $totalErrorFiles."