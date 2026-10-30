# Projekt-Status – Typit

> Wird nach jedem abgeschlossenen Schritt **überschrieben**, nicht ergänzt. Höchstens eine Bildschirmseite.

- **Werkstatt-Version:** 1.1.0
- **Zuletzt aktualisiert:** 2026-10-30
- **Aktuelle Phase:** 1 – Projekt anlegen (fast abgeschlossen)
- **Branch:** main (nur bis die Schutzregeln aktiv sind)
- **Letztes Release:** –

## Wo stehen wir
Skelett kopiert, Lösung `Typit.slnx` mit drei Projekten baut ohne Warnungen, 2 Tests grün,
André hat das App-Fenster gesehen. Qualitätstor `verify.ps1` direkt getestet (0/2/0).
Microsoft-Learn-MCP in `.mcp.json`. ADR-0002 (öffentliches Repo) und ADR-0003 (WinUI-Analyzer,
feste Paketversionen) angelegt. Repo `softcodeAG/typit` und Schutzregeln folgen mit diesem Commit.

## Inkremente
| ID | Titel | Status |
|---|---|---|
| – | folgt in Phase 3 | – |

## Hot List (höchstens drei)
- Repo öffentlich (ADR-0002): keine echten Sprachaufnahmen, Transkripte oder Secrets ins Repo.

## Offene Fragen und Annahmen
- Zweck laut André (2026-10-30): systemweites Diktieren per gedrückter Tastenkombination in jedes Textfeld, Bereinigung von Füllwörtern („ähm“) ohne LLM. Später evtl. Aufgaben/Notizen an To-do- bzw. Notiz-App übergeben. Details im Interview (Phase 2).
- Annahme: Git-Anzeigename „softcodeAG“; lässt sich jederzeit ändern.

## Nächster Schritt (genau einer)
1.11 Hook-Verkabelung in einer neuen Session prüfen, dann Phase 2 (Interview & SPEC).

## Handoff
Wenn du weitermachst, starte hier: in der Claude-App eine neue Session im Ordner
`C:\Users\info\Claude Code\apps\typit` öffnen → `/app-werkstatt weiter`.
Den Projekteinstellungen und dem MCP-Server aus `.mcp.json` beim ersten Start vertrauen.
