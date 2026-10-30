# Projekt-Status – Typit

> Wird nach jedem abgeschlossenen Schritt **überschrieben**, nicht ergänzt. Höchstens eine Bildschirmseite.

- **Werkstatt-Version:** 1.1.0
- **Zuletzt aktualisiert:** 2026-10-30
- **Aktuelle Phase:** 2 – Interview & SPEC (begonnen)
- **Branch:** docs/spec
- **Letztes Release:** –

## Wo stehen wir
Phase 1 abgeschlossen und von André freigegeben (2026-10-30): Repo `softcodeAG/typit`
öffentlich (ADR-0002), CI grün, Rulesets `main-schutz` und `release-tags-schutz` aktiv,
Stop-Hook in neuer Session geprüft (blockiert bei Build-Fehler, lässt sauberen Stand durch).
Phase 2 läuft: Auftragsklärung (2.1) an André übergeben.

## Inkremente
| ID | Titel | Status |
|---|---|---|
| – | folgt in Phase 3 | – |

## Hot List (höchstens drei)
- Repo öffentlich (ADR-0002): keine echten Sprachaufnahmen, Transkripte oder Secrets ins Repo.
- Fünf Dependabot-PRs offen (#1, #2, #4, #5, #6), CI rot, weil vor dem CI-Fix gestartet. Nicht mergen, gesondert prüfen.

## Offene Fragen und Annahmen
- Zweck laut André (2026-10-30): systemweites Diktieren per gedrückter Tastenkombination in jedes Textfeld, Bereinigung von Füllwörtern („ähm“) ohne LLM. Später evtl. Aufgaben/Notizen an To-do- bzw. Notiz-App übergeben.
- Annahme: Git-Anzeigename „softcodeAG“; lässt sich jederzeit ändern.

## Nächster Schritt (genau einer)
2.1 Auftragsklärung: Andrés Antworten auf die drei kritischen Rückfragen und Annahmen einarbeiten, dann Interview in Runden (2.2).

## Handoff
Wenn du weitermachst, starte hier: Session im Ordner `C:\Users\info\Claude Code\apps\typit`
öffnen → `/app-werkstatt weiter`. Branch `docs/spec`.
