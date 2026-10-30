# ADR-0004: Publish-Optimierungen erst in Phase 6 festlegen

- **Status:** akzeptiert
- **Datum:** 2026-10-30
- **Entschieden von:** André
- **Konfidenz:** hoch
- **Bezug:** Phase 1 (erster CI-Lauf)

## Kontext
Die WinUI-Vorlage `winui-navview` setzt in `Typit.csproj` für alle Konfigurationen außer `Debug`
`PublishReadyToRun=True` und `PublishTrimmed=True`. Dadurch hängen die Paketabhängigkeiten von
der Konfiguration ab: In `Release` kommen ein Runtime-Paket und `Microsoft.NET.ILLink.Tasks` hinzu.
Der erste CI-Lauf auf `main` (Run 41044101246, 2026-10-30) scheiterte mit NETSDK1094, weil
`dotnet restore --locked-mode` ohne Konfiguration und der Build in `Release` lief. Ein Restore mit
`Configuration=Release` scheitert wiederum am Lock-File (NU1004). Beides lokal nachgestellt.

## Optionen (höchstens drei)
| Option | Vorteile | Nachteile | Aufwand |
|---|---|---|---|
| Publish-Einstellungen aus der `.csproj` entfernen (gewählt) | Build hängt nicht von der Konfiguration ab, ein Lock-File passt für Debug und Release | Optimierungen müssen in Phase 6 bewusst wieder gesetzt werden | gering |
| Einstellungen für alle Konfigurationen einschalten | Lock-File einheitlich | Trimming-Analyse auch im Alltag, langsamere Builds, Risiko von Fehlalarmen | mittel |
| CI auf `Debug` umstellen | kleinste Änderung | CI prüft nicht die Konfiguration, die ausgeliefert wird | gering |

## Entscheidung
Der Abschnitt „Publish Properties“ (ReadyToRun, Trimming) wird aus `src/Typit/Typit.csproj`
entfernt. Ob und wie die App beim Paketieren optimiert wird (ReadyToRun, Trimming, Native AOT),
wird in Phase 6 mit eigener ADR entschieden und nur für den Publish-Vorgang gesetzt.

## Begründung
- Fehler lokal nachgestellt und Lösung lokal mit der exakten CI-Befehlsfolge geprüft (Restore `--locked-mode`, Build `Release -warnaserror`, Tests): grün, Lock-Files unverändert (2026-10-30).
- Das WinUI-Plugin (`winui-packaging`) behandelt Optimierungen wie Native AOT als Teil der Paketierung, nicht des Alltagsbuilds (gelesen 2026-10-30).

## Konsequenzen
- Normale Builds sind in Debug und Release reproduzierbar mit denselben Paketen.
- Phase 6 muss die Optimierungen aktiv entscheiden; Hinweis steht in `docs/LEARNINGS.md`.

## Das würde mich umstimmen
- Ein Werkzeug der Paketierung (z. B. `winapp pack`) setzt die Einstellungen zwingend in der `.csproj` voraus.
