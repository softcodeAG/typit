# ADR-0001: Technologie – .NET 10, C#, WinUI 3

- **Status:** akzeptiert
- **Datum:** 2026-10-30
- **Entschieden von:** André (Vorgabe der App-Werkstatt 1.1.0)
- **Konfidenz:** hoch
- **Bezug:** alle

## Kontext
Windows-Desktop-App, entwickelt mit Claude Code durch einen Nicht-Entwickler. Lange
Wartbarkeit und nachvollziehbare Entwicklung sind wichtiger als maximale Plattformbreite.

## Entscheidung
- .NET 10 (LTS), C#, WinUI 3 über das Windows App SDK 2.x, MVVM mit CommunityToolkit.Mvvm.
- Aufteilung: `Typit.Core` (Logik und ViewModels, UI-frei, testbar), `Typit` (WinUI-Oberfläche), `Typit.Core.Tests` (Unit-Tests).
- Vorab freigegebene Pakete: Microsoft.WindowsAppSDK und die übrigen von der WinUI-Vorlage gesetzten Pakete, CommunityToolkit.Mvvm, die Pakete der Testvorlage. Alle anderen Pakete nur nach Rückfrage.

## Optionen
| Option | Vorteile | Nachteile | Aufwand |
|---|---|---|---|
| WinUI 3 (gewählt) | aktuelles natives Windows-UI, offizielle KI-Hilfen von Microsoft für Claude Code | nur Windows | mittel |
| WPF | sehr ausgereift, viele Beispiele | ältere Technik; sinnvoll vor allem für bestehende WPF-Apps | mittel |
| Avalonia | auch macOS und Linux | anderer Werkzeugstapel, keine Microsoft-Hilfen | mittel |

## Begründung
- .NET 10 ist LTS mit Support bis 14.11.2028 (dotnet.microsoft.com, Support Policy, Stand Oktober 2026).
- Windows App SDK 2.0 ist seit April 2026 stabil und folgt semantischer Versionierung; inkompatible Änderungen nur in Major-Versionen.
- Microsoft stellt für Claude Code ein WinUI-Plugin (`winui@win-dev-skills`) und den Microsoft-Learn-MCP-Server bereit. Das senkt das Risiko veralteter APIs (learn.microsoft.com, Stand Juli 2026).
- Ein UI-freier Core macht die Logik ohne Oberfläche testbar.

## Konsequenzen
- Die App läuft unter Windows 10 (ab 1809) und Windows 11, nicht auf anderen Systemen.
- Spätestens 2028 Upgrade auf die nächste LTS-Version (.NET 12, erwartet November 2027) einplanen.

## Das würde mich umstimmen
- Die App muss auch auf macOS, Linux oder Mobilgeräten laufen.
- Microsoft stellt die Weiterentwicklung von WinUI ein.
