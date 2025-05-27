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

        if ($text -match '\*\s*([0-9]+)\s*-\s*([0-9]+)') {
            $id1 = $matches[1]
            $id2 = $matches[2]

            # TestItem 1-3: nếu không tìm thấy thì để trống, nếu là None thì ghi "None"
            $testItem1 = if ($text -match 'TestItem\s*1\s*:\s*(.+)') { $matches[1].Trim() } else { "" }
            $testItem2 = if ($text -match 'TestItem\s*2\s*:\s*(.+)') { $matches[1].Trim() } else { "" }
            $testItem3 = if ($text -match 'TestItem\s*3\s*:\s*(.+)') { $matches[1].Trim() } else { "" }

           # Expect: lấy nhiều dòng và đảm bảo xuống dòng trong Excel
$expect = ""
if ($text -match "(?ms)\*\s*Expect\s*:\s*(.*)") {
    $lines = $matches[1] -split "`r?`n"
    $expectLines = @()
    foreach ($line in $lines) {
        $trimmed = ($line -replace '^\s*\*\s*', '').Trim()
        if ($trimmed -match '^\*?\s*(TestItem|[0-9]+\s*-\s*[0-9]+|$)') { break }
        if ($trimmed -ne "") { $expectLines += $trimmed }
    }
    if ($expectLines.Count -gt 0) {
        $expect = '"' + ($expectLines -join "`r`n") + '"'
    }
}


            # Tạo dòng với đúng số tab (Expect nằm cột O)
            $line = @(
                "", "",          # A-B
                $id1,            # C
                $id2,            # D
                "", "",          # E-F
                $testItem1,      # G
                $testItem2,      # H
                $testItem3,      # I
                "", "", "", "", "", # J-N
                $expect          # O
            ) -join "`t"

            $results += $line
        }
    }

    if ($results.Count -gt 0) {
        Set-Content -Path $outputFile -Value $results -Encoding UTF8
        Write-Host "✅ Đã xuất: $inputFile → $outputFile"
    } else {
        Write-Host "⚠️ Không tìm thấy nội dung hợp lệ: $inputFile"
    }
}
