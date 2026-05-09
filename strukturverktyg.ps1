# Funktion som skapar mappar
function Skapa-Mapp {
    param (
        [string]$MappNamn
    )

    New-Item -ItemType Directory -Path $MappNamn -ErrorAction Stop
}

try {

    # Fråga användaren efter namn
    $namn = Read-Host "Ange namn på huvudmappen"

    # Skapa huvudmappen
    Skapa-Mapp $namn

    # Skapa undermappar
    Skapa-Mapp "$namn/logs"
    Skapa-Mapp "$namn/scripts"
    Skapa-Mapp "$namn/temp"

    # Datum till loggfil
    $datum = Get-Date -Format "yyyy-MM-dd"

    # Sökväg till loggfil
    $loggFil = "$namn/logs/log-$datum.txt"

    # Skriv till loggfil
    Add-Content -Path $loggFil -Value "Struktur skapad: $(Get-Date)"

    Write-Host "Strukturen skapades korrekt!"

}
catch {

    Write-Host "Fel uppstod:"
    Write-Host $_.Exception.Message

}