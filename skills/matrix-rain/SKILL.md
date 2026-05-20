---
name: matrix-rain
description: 'Generate a Matrix-style green code rain animation in the terminal using PowerShell. Use when asked to create a terminal animation, Matrix rain effect, falling code effect, hacker screen, or console screensaver. Covers phrases like "Matrix rain", "falling green text", "code rain animation", "terminal screensaver", "hacker terminal effect".'
---

# Matrix Rain

A PowerShell script that renders the iconic Matrix "falling code" animation directly in the terminal.

## When to Use

- User wants a Matrix-style terminal animation
- User asks for a "hacker screen" or falling code effect
- User wants a terminal screensaver or visual demo
- User asks for green rain text animation in the console

## What It Does

- Renders columns of random characters falling down the terminal
- Uses bright white heads with dark green trails that fade to black
- Randomizes speed, tail length, and characters for organic variation
- Fills the entire terminal window
- Restores terminal state on exit (Ctrl+C)

## Procedure

1. Copy [matrix-rain.ps1](./scripts/matrix-rain.ps1) to the user's project or run it directly
2. Execute with PowerShell:

```powershell
pwsh ./matrix-rain.ps1
```

Or on Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\matrix-rain.ps1
```

3. Press `Ctrl+C` to stop the animation

## Requirements

- PowerShell 5.1+ (Windows) or PowerShell 7+ (macOS/Linux)
- A terminal that supports ANSI colors

## Customization

The script can be modified to adjust:

| Parameter | Location | Default | Description |
|-----------|----------|---------|-------------|
| Character set | `$charCodes` | Alphanumeric + symbols | Characters used in the rain streams |
| Speed range | `Speed` property | 1–3 | Tick delay per column (lower = faster) |
| Tail length | `Tail` property | 6–20 | Number of trailing characters per stream |
| Frame delay | `Start-Sleep` | 35ms | Milliseconds between frame updates |
