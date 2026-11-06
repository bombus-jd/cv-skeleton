# CV-Vorlage (Deutsch und Englisch)

Eine LaTeX-Vorlage für einen einseitigen Lebenslauf. Aus einer Datei entstehen zwei PDFs, eines auf Deutsch und eines auf Englisch.

## Voraussetzungen

Eine LaTeX-Distribution mit `latexmk` und `pdflatex`, zum Beispiel TeX Live oder MacTeX, sowie `make`.

## Eigenen Lebenslauf erstellen

1. `make init` kopiert `skeleton-cv.tex` nach `cv.tex`. Diese Datei bleibt privat und kommt nicht nach Git.
2. Trage oben in `cv.tex` Vorname und Nachname ein und setze den Pfad zum Foto, zum Beispiel `pictures/photo.jpg`. Fehlt das Foto, wird ein Platzhalter gezeichnet.
3. Trage deine Daten in `cv.tex` ein. Übersetzte Texte stehen in `\lang{deutsch}{english}`, alles andere erscheint in beiden Sprachen gleich.
4. `make` erzeugt `output/Nachname_Vorname_de.pdf` und `output/Nachname_Vorname_en.pdf`.

## Ohne Terminal

Es geht auch ohne `make`: Öffne `skeleton-cv.tex` in deinem LaTeX-Editor und starte dort den Build. Das Tastenkürzel hängt vom Editor ab, in TeXShop ist es etwa Cmd+Shift+L. Die Sprache wählst du oben in der Datei mit `\germantrue` oder `\germanfalse`. Das PDF heißt dann wie die `.tex`-Datei und liegt daneben, die automatischen Dateinamen gibt es nur mit `make`.

## Befehle

| Befehl | Wirkung |
|---|---|
| `make` | baut beide Sprachen |
| `make de` | baut nur die deutsche Fassung |
| `make en` | baut nur die englische Fassung |
| `make init` | legt `cv.tex` an, überschreibt aber keine vorhandene Datei |
| `make clean` | löscht die Hilfsdateien in `output/` |
| `make SRC=skeleton-cv.tex` | baut die Vorlage, auch wenn es eine `cv.tex` gibt |

## Hinweise

- Schreibe den Namen in den beiden Zeilen oben direkt mit Umlauten (`Müller`), nicht als `M\"uller`. Im Dateinamen wird daraus `Mueller`.
- Git erfasst nur die Vorlage, `README.md`, `Makefile` und die leeren Ordner. `cv.tex`, Fotos und PDFs bleiben lokal.
