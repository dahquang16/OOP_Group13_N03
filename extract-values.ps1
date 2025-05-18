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

        if ($text -match '\*\s*([0-9]+)\s*-\s*([0-9]+)\s*:\s*(.*)') {
            $id1 = $matches[1]
            $id2 = $matches[2]
            $desc = $matches[3].Trim()

            function Extract-Section {
                param (
                    [string]$label
                )
                $pattern = "(?ms)^\s*\*\s*$label\s*:([\s\S]*?)(^\s*\*\s*(Input|PreCondition|Expect|$)|\Z)"
                if ($text -match $pattern) {
                    $block = $matches[1]
                    $clean = ($block -split "`r?`n" | ForEach-Object {
                        ($_ -replace '^\s*\*\s*', '').Trim()
                    }) -join "`r`n"
                    return "`"$clean`""
                }
                return ""
            }

            $preCond = Extract-Section -label "PreCondition"
            $expect = Extract-Section -label "Expect"

            # Format dòng dữ liệu
            $line = "`t`t$id1`t$id2`t`t$desc`t$preCond" + ("`t" * 8) + "$expect"
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
