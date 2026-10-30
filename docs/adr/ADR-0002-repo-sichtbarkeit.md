# ADR-0002: Repo-Sichtbarkeit – öffentlich mit GitHub Free

- **Status:** akzeptiert
- **Datum:** 2026-10-30
- **Entschieden von:** André
- **Konfidenz:** hoch
- **Bezug:** Phase 0 und 1 (Arbeitsplatz, Projekt anlegen)

## Kontext
Die Revisionssicherheit der Werkstatt stützt sich auf GitHub-Schutzregeln (Rulesets): Änderungen
an `main` nur per Pull Request, grüne CI, signierte Commits, keine Force-Pushes. Rulesets gibt es
für private Repos erst ab GitHub Pro, mit GitHub Free nur für öffentliche Repos. Das Konto für
Typit ist `softcodeAG`.

## Optionen (höchstens drei)
| Option | Vorteile | Nachteile | Aufwand |
|---|---|---|---|
| GitHub Pro, privat | Code bleibt privat, Schutzregeln greifen | laufende Kosten (ca. 4 $/Monat) | gering |
| GitHub Free, öffentlich (gewählt) | kostenlos, volle Schutzregeln | Quellcode und Doku für alle lesbar | gering |
| GitHub Free, privat, ohne Regeln | kostenlos, privat | `main` technisch ungeschützt, Revisionssicherheit nur per Disziplin | gering |

## Entscheidung
Das Repo `softcodeAG/typit` wird öffentlich auf GitHub Free angelegt. Die Rulesets aus
`.github/rulesets/` werden aktiviert.

## Begründung
- Entscheidung von André am 2026-10-30 in Phase 0.
- Schutzregeln für private Repos setzen GitHub Pro, Team oder Enterprise voraus (GitHub Docs, „About rulesets“, Stand Oktober 2026).

## Konsequenzen
- Alles im Repo ist öffentlich: Code, SPEC, PLAN, ADRs, Learnings. Secrets, Zertifikate, Zugangsdaten und echte personenbezogene Daten dürfen nie ins Repo; die `.gitignore` schließt Zertifikatsdateien aus.
- Typit verarbeitet Sprache. Echte Sprachaufnahmen oder Transkripte gehören weder in Tests noch in die Doku; Testdaten werden künstlich erzeugt.
- Öffentliche Repos erhalten kostenlos Dependabot-Warnungen und CI-Minuten.

## Das würde mich umstimmen
- Typit soll kommerziell vertrieben werden und der Code ist schützenswert.
- In SPEC oder PLAN sollen vertrauliche Kunden- oder Geschäftsinformationen stehen.
Dann: GitHub Pro abschließen und Repo auf privat stellen (Rulesets bleiben erhalten), neue ADR.
