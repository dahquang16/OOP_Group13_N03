$inputFolder = "D:\powersell"
$outputFolder = "D:\filetxt"

# Tạo thư mục output nếu chưa tồn tại
if (-not (Test-Path $outputFolder)) {
    New-Item -Path $outputFolder -ItemType Directory | Out-Null
}

# Duyệt toàn bộ file .java
Get-ChildItem -Path $inputFolder -Filter *.java -Recurse | ForEach-Object {
    $inputFile = $_.FullName
    $fileName = $_.BaseName
    $outputFile = Join-Path $outputFolder "$fileName.txt"

    $content = Get-Content $inputFile -Raw
    $commentBlocks = [regex]::Matches($content, '/\*\*(.*?)\*/', 'Singleline')

    $results = @()

    foreach ($block in $commentBlocks) {
        $text = $block.Groups[1].Value

        # Match dòng: * 11 - 1
        if ($text -match '\*\s*([0-9]+)\s*-\s*([0-9]+)') {
            $id1 = $matches[1]
            $id2 = $matches[2]

            # Tìm TestItem 1:
            $desc = ""
            if ($text -match 'TestItem\s*1\s*:\s*(.+)') {
                $desc = $matches[1].Trim()
                if ($desc -eq "None") { $desc = "" }
            }

            # Tìm Expect:
            $expect = ""
            if ($text -match "(?ms)\*\s*Expect\s*:\s*(.*?)($|\n\s*\*\s*$|\*/)") {
                $rawExpect = $matches[1]
                $expectLines = ($rawExpect -split "`r?`n" | ForEach-Object {
                    ($_ -replace '^\s*\*\s*', '').Trim()
                }) | Where-Object { $_ -ne "None" -and $_ -ne "" }

                if ($expectLines.Count -gt 0) {
                    $expect = '"' + ($expectLines -join "`r`n") + '"'
                }
            }

            # Gộp dòng dữ liệu theo format
            $line = "`t`t$id1`t$id2`t`t$desc" + ("`t" * 9) + "$expect"
            $results += $line
        }
    }

    if ($results.Count -gt 0) {
        Set-Content -Path $outputFile -Value $results -Encoding UTF8
        Write-Host "✅ da xuat: $inputFile → $outputFile"
    } else {
        Write-Host "⚠️ khong tim thay noi dung hop le: $inputFile"
    }
}
