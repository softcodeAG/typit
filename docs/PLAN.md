# PLAN – Typit

- **Grundlage:** SPEC Version <x.y>, freigegeben am <JJJJ-MM-TT>
- **Status:** Entwurf | freigegeben am <JJJJ-MM-TT> durch André

## Architektur in fünf Sätzen
<…>

## Entscheidungen
| ADR | Thema | Entscheidung |
|---|---|---|
| ADR-0001 | Technologie | .NET 10, C#, WinUI 3, MVVM |
| ADR-0002 | Repo-Sichtbarkeit | <…> |

## Inkremente

### I-01 Grundgerüst (Walking Skeleton)
- **Ziel:** App startet mit den echten Seiten aus der SPEC, Einstellungsseite mit Hell/Dunkel, Fehlerbehandlung als Grundlage, erster echter Test im Core, lokales MSIX-Testpaket mit `winapp pack`.
- **Deckt:** –
- **Abnahme:** App startet aus dem installierten Testpaket; Navigation zeigt alle geplanten Seiten; Hell/Dunkel umschaltbar; CI grün.
- **Tests:** <automatisch> · <manuell>
- **Abhängigkeiten:** –
- **Größe:** S | M
- **Status:** offen | in Arbeit | erledigt (PR #<n>)

### I-02 <Titel>
- **Ziel:**
- **Deckt:** F-xx
- **Abnahme:**
- **Tests:**
- **Abhängigkeiten:**
- **Größe:**
- **Status:**

## Rückverfolgbarkeit
| F-ID | Inkrement(e) | Test(s) |
|---|---|---|

## Teststrategie
- **Unit-Tests (Pflicht):** Logik und ViewModels im Core
- **UI-Prüfung:** <welche Abläufe mit `winapp ui`>
- **Manuelle Abnahme:** siehe `docs/ABNAHME.md`

## Release-Schnitt
| Version | Nach Inkrement | Zweck |
|---|---|---|
| v0.1.0 | I-0x | Test durch André |
| v1.0.0 | I-0y | alle Muss-Anforderungen |
