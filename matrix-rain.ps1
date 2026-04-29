# Matrix-style green code rain for PowerShell
# Run with: .\matrix-rain.ps1

$rawUi = $Host.UI.RawUI
$rawUi.BackgroundColor = 'Black'
$rawUi.ForegroundColor = 'Green'
Clear-Host

$width = $rawUi.WindowSize.Width
$height = $rawUi.WindowSize.Height

# Random characters used by the rain streams.
$charCodes = (48..57) + (65..90) + (97..122) + @(33, 35, 36, 37, 38, 42, 43, 45, 61)

$columns = for ($x = 0; $x -lt $width; $x++) {
    [PSCustomObject]@{
        X     = $x
        Y     = Get-Random -Minimum 0 -Maximum $height
        Speed = Get-Random -Minimum 1 -Maximum 4
        Tick  = Get-Random -Minimum 0 -Maximum 4
        Tail  = Get-Random -Minimum 6 -Maximum 20
    }
}

[Console]::CursorVisible = $false

try {
    while ($true) {
        foreach ($col in $columns) {
            $col.Tick--
            if ($col.Tick -gt 0) {
                continue
            }

            $col.Tick = $col.Speed

            $headY = $col.Y
            $trailY = ($headY - 1 + $height) % $height
            $eraseY = ($headY - $col.Tail + $height) % $height

            # Erase the oldest character in this stream.
            [Console]::SetCursorPosition($col.X, $eraseY)
            [Console]::ForegroundColor = [ConsoleColor]::Black
            [Console]::Write(' ')

            # Draw trailing character.
            [Console]::SetCursorPosition($col.X, $trailY)
            [Console]::ForegroundColor = [ConsoleColor]::DarkGreen
            [Console]::Write([char]($charCodes | Get-Random))

            # Draw bright head character.
            [Console]::SetCursorPosition($col.X, $headY)
            [Console]::ForegroundColor = [ConsoleColor]::White
            [Console]::Write([char]($charCodes | Get-Random))

            $col.Y = ($col.Y + 1) % $height

            # Occasionally randomize tail length for a less uniform effect.
            if ((Get-Random -Minimum 0 -Maximum 20) -eq 0) {
                $col.Tail = Get-Random -Minimum 6 -Maximum 20
            }
        }

        Start-Sleep -Milliseconds 35
    }
}
finally {
    [Console]::CursorVisible = $true
    [Console]::ForegroundColor = [ConsoleColor]::Green
    [Console]::BackgroundColor = [ConsoleColor]::Black
    Clear-Host
}
