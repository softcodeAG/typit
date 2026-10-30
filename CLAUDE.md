# Typit – Projektregeln für Claude

Dieses Projekt folgt der App-Werkstatt (Version 1.1.0). Das Verfahren steht im
Skill `app-werkstatt`; lade ihn für jede Phase. André ist Auftraggeber, kein Entwickler:
erst erklären, dann tun, Nachweise zeigen.

## Sessionstart
Führe `git branch --show-current` aus und lies `docs/PROJEKT-STATUS.md`. Sonst nichts.
Antworte in höchstens fünf Zeilen mit Stand und genau einem nächsten Schritt.

## Stack
- .NET 10 (LTS), C#, WinUI 3 / Windows App SDK 2.x, MVVM mit CommunityToolkit.Mvvm
- `src/Typit.Core` – Logik und ViewModels, UI-frei und testbar
- `src/Typit` – WinUI-Oberfläche, nur Darstellung und Bindung
- `tests/Typit.Core.Tests` – Unit-Tests

## Befehle
- Bauen: `dotnet build -warnaserror`
- Testen: `dotnet test`
- Starten: `dotnet run --project src/Typit` (danach App schließen, sonst blockiert sie Builds)
- UI prüfen: `winapp ui` (Optionen mit `--help`)

## Regeln
- Nie auf `main` arbeiten. Branches: `feat/I-xx-…`, `fix/I-xx-…`, `docs/…`, `chore/…`, `release/vX.Y.Z`. Abschluss immer per PR; mergen macht André.
- Commits: Conventional Commits auf Englisch mit Bezug, z. B. `feat(I-03): add expense list (F-02)`.
- Nur WinUI-3-APIs (`Microsoft.UI.Xaml`). Bei Unsicherheit Microsoft-Learn-MCP oder `@winui-dev` fragen, nicht aus dem Gedächtnis.
- Keine Logik in Code-Behind-Dateien.
- Neue NuGet-Pakete nur nach Rückfrage; Versionen nur in `Directory.Packages.props`, danach `dotnet restore`.
- Warnungen beheben, nicht unterdrücken. Ausnahmen nur mit ADR.
- Tests nie löschen oder abschwächen, damit etwas grün wird.
- Keine Secrets, Zertifikate oder echten personenbezogenen Daten im Repo.
- Entscheidungen, die man später hinterfragen könnte, als ADR in `docs/adr/`. ADRs werden nie gelöscht, nur ersetzt.
- Doku auf Deutsch; Code, Bezeichner und Commits auf Englisch.

## Beim Kompaktieren immer erhalten
Aktuelle Phase, Inkrement-ID, Branch, geänderte Dateien, offene Review-Befunde, nächster Schritt.
