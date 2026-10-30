# ADR-0003: WinUI-Analyzer und feste Paketversionen

- **Status:** akzeptiert
- **Datum:** 2026-10-30
- **Entschieden von:** André
- **Konfidenz:** hoch
- **Bezug:** Phase 1

## Kontext
1. Das offizielle WinUI-Plugin von Microsoft (`winui@win-dev-skills` 0.7.1, Skill
   `winui-dev-workflow`) empfiehlt für jede App das Analyzer-Paket
   `Microsoft.Windows.SDK.BuildTools.WinUIAnalyzer`. Es meldet typische WinUI-Laufzeitfehler schon
   beim Bauen. ADR-0001 hat es nicht vorab freigegeben.
2. Die WinUI-Vorlage `winui-navview` (WinUI-Vorlagen, Stand 2026-10-30) setzt ihre drei Pakete mit
   `Version="*"` (immer die neueste). Das widerspricht reproduzierbaren Builds.

## Optionen (höchstens drei)
| Option | Vorteile | Nachteile | Aufwand |
|---|---|---|---|
| Analyzer aufnehmen (gewählt) | WinUI-Fehler fallen beim Build auf statt beim Start | ein Paket mehr, das Dependabot aktuell hält | gering |
| Ohne Analyzer | ein Paket weniger | Laufzeitfehler erst beim Starten der App sichtbar | keiner |

## Entscheidung
- `Microsoft.Windows.SDK.BuildTools.WinUIAnalyzer` 0.7.1 wird im App-Projekt mit `PrivateAssets="all"` eingebunden (nur Build-Zeit, wird nicht ausgeliefert).
- Die `*`-Versionen der Vorlage werden durch feste Versionen in `Directory.Packages.props` ersetzt (neueste stabile auf nuget.org am 2026-10-30): Microsoft.WindowsAppSDK 2.6.4, Microsoft.Windows.SDK.BuildTools 10.0.28000.2957, Microsoft.Windows.SDK.BuildTools.WinApp 0.7.1.

## Begründung
- Empfehlung im Skill `winui-dev-workflow` des Microsoft-Plugins, gelesen am 2026-10-30.
- Versionen per nuget.org-API geprüft am 2026-10-30.
- Freigabe des Analyzers durch André am 2026-10-30.

## Konsequenzen
- Analyzer-Befunde gelten wie Warnungen als Fehler (`TreatWarningsAsErrors`) und werden behoben, nicht unterdrückt.
- Updates kommen über Dependabot-PRs und werden wie jeder andere PR geprüft.

## Das würde mich umstimmen
- Der Analyzer meldet wiederholt Fehlalarme, die sich nur durch Unterdrücken lösen lassen.
- Microsoft integriert die Prüfungen direkt ins Windows App SDK.
