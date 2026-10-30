# Learnings – Typit

> Datierte Einzeiler im Format `JJJJ-MM-TT – <Erkenntnis oder Regel> – <Anlass>`.
> Vorschläge für die Werkstatt selbst mit `[Werkstatt]` markieren. Sie werden in Phase 7
> in einer eigenen Session im Werkstatt-Ordner geprüft, nie in der App-Session umgesetzt.

2026-10-30 – [Werkstatt] winget-ID der winapp CLI lautet exakt `Microsoft.WinAppCli`; mit `-e` und der Schreibweise `Microsoft.winappcli` schlägt `winget show/install` fehl – Phase 0, Schnellcheck.
2026-10-30 – [Werkstatt] `{{PROJEKTORDNER}}` per `sed` ersetzen zerstört Backslashes (`\U`, `\a`, `\t` werden als Befehle gelesen); Ersetzung mit Python oder escaptem Pfad vornehmen – Phase 1.3.
2026-10-30 – [Werkstatt] Die Vorlage `winui-navview` setzt `Version="*"`; bei zentraler Paketverwaltung scheitert der automatische Restore, die Lock-Files bleiben leer. Feste Versionen von nuget.org eintragen (ADR-0003) – Phase 1.4.
2026-10-30 – [Werkstatt] Das WinUI-Plugin empfiehlt `winapp run` statt `dotnet run` und den Analyzer `Microsoft.Windows.SDK.BuildTools.WinUIAnalyzer`; beides in Phase 1 aufnehmen. Nach dem Schließen des Fensters lief `Typit.exe` weiter und musste beendet werden – Phase 1.5.
2026-10-30 – [Werkstatt] Mit der Claude-Desktop-App fehlt die CLI `claude` (für Plugin- und MCP-Befehle); Installation und PATH-Eintrag in Phase 0 vorsehen. Der Werkstatt-Ordner enthielt eine identische verschachtelte Kopie `app-werkstatt\app-werkstatt\` – Phase 0.
2026-10-30 – [Werkstatt] Die Vorlage `winui-navview` setzt ReadyToRun und Trimming für Release in der `.csproj`; mit Lock-Files und `--locked-mode` scheitert dann der CI-Build (NETSDK1094/NU1004). Abschnitt in Phase 1 entfernen, in Phase 6 bewusst entscheiden (ADR-0004). Lokal vor dem ersten Push immer die exakte CI-Befehlsfolge in Release prüfen – Phase 1.9.
