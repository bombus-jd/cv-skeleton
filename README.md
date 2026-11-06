# Lebenslauf-Vorlage (Deutsch und Englisch)

Mit dieser Vorlage erstellst du einen einseitigen Lebenslauf als PDF, auf Deutsch und auf Englisch. Du trägst deine Daten einmal in eine Datei ein und wählst dann die Sprache. Git brauchst du dafür nicht.

## Welche Methode passt zu dir?

| | Methode 1: Nur die Datei | Methode 2: Terminal | Methode 3: Overleaf |
|---|---|---|---|
| **Geeignet für** | alle, die offline arbeiten und kein Terminal nutzen möchten | alle, die ein paar Befehle eintippen möchten | Einsteiger und alle, die nichts installieren möchten |
| **Du brauchst** | LaTeX auf dem Rechner | LaTeX auf dem Rechner | einen Browser und ein kostenloses Konto |
| **Ergebnis** | ein PDF pro Durchlauf, die Sprache stellst du von Hand um | beide PDFs mit einem Befehl, automatisch benannt | ein PDF pro Durchlauf, die Sprache stellst du von Hand um |
| **Systeme** | macOS und Windows | macOS und Linux | alle |

Unsicher? Nimm **Methode 3**.

## Vorbereitung für Methode 1 und 2: LaTeX installieren

LaTeX ist das Programm, das aus der Textdatei das PDF erzeugt. Du installierst es nur einmal. Für Methode 3 brauchst du das nicht:

- **macOS:** [MacTeX](https://www.tug.org/mactex/), der Editor TeXShop ist dabei
- **Windows:** [MiKTeX](https://miktex.org/download), der Editor TeXworks ist dabei

## Methode 1: Nur die Datei

1. Öffne [`skeleton-cv.tex`](skeleton-cv.tex) und klicke rechts über dem Text auf **Download raw file**.
2. Lege die Datei in einen eigenen Ordner, zum Beispiel `Lebenslauf`.
3. Öffne die Datei in TeXShop oder TeXworks.
4. Trage deine Daten ein, siehe [Daten eintragen](#daten-eintragen).
5. Erzeuge das PDF: In TeXShop klickst du auf **Setzen** oder **Typeset** (oder drückst Cmd+Shift+L), in TeXworks auf den grünen Pfeil. Das PDF liegt danach neben der `.tex`-Datei.

**Für die andere Sprache:** Ändere weit oben in der Datei die Zeile `\newif\ifgerman \germantrue` zu `\newif\ifgerman \germanfalse` und erzeuge das PDF erneut. Benenne das erste PDF vorher um, sonst wird es überschrieben.

## Methode 2: Terminal

1. Lade den Ordner als [ZIP-Datei](https://github.com/bombus-jd/cv-skeleton/archive/refs/heads/main.zip) herunter und entpacke ihn.
2. Öffne das Terminal, tippe `cd` und ein Leerzeichen, ziehe den entpackten Ordner ins Fenster und drücke Enter.
3. Lege deine eigene Datei an:
   ```bash
   make init
   ```
   Wird `make` nicht gefunden, führe auf dem Mac `xcode-select --install` aus und versuche es erneut.
4. Öffne die neue Datei `cv.tex` in einem Editor und trage deine Daten ein, siehe [Daten eintragen](#daten-eintragen).
5. Erzeuge beide PDFs:
   ```bash
   make
   ```

Die PDFs liegen danach im Ordner `output`, zum Beispiel als `Mueller_Anna_de.pdf` und `Mueller_Anna_en.pdf`.

**Unter Windows:** Diese Methode läuft dort nicht direkt, weil `make` und einige Unix-Befehle fehlen. Nimm Methode 1 oder 3.

## Methode 3: Overleaf

[Overleaf](https://www.overleaf.com) ist ein LaTeX-Editor im Browser. Du musst nichts installieren. Beachte: Deine Daten und dein Foto liegen dabei auf den Servern von Overleaf.

1. Erstelle ein kostenloses Konto bei Overleaf und melde dich an.
2. Klicke auf **New project** und dann auf **Blank project**. Gib einen Namen ein, zum Beispiel `Lebenslauf`.
3. Öffne hier auf GitHub [`skeleton-cv.tex`](skeleton-cv.tex) und klicke rechts über dem Text auf **Copy raw file**.
4. Lösche in Overleaf den gesamten Text in `main.tex` und füge den kopierten Text ein.
5. Klicke auf **Recompile**. Rechts erscheint die Vorschau.
6. Trage deine Daten ein, siehe [Daten eintragen](#daten-eintragen), und klicke danach wieder auf **Recompile**.
7. Lade das PDF über das Download-Symbol neben **Recompile** herunter.

**Für die andere Sprache:** Ändere weit oben in der Datei die Zeile `\newif\ifgerman \germantrue` zu `\newif\ifgerman \germanfalse` und klicke auf **Recompile**.

**Foto:** Lege links in der Dateiliste über **New folder** den Ordner `pictures` an und lade dein Foto über **Upload** als `photo.jpg` dort hinein. Zeigt Overleaf eine Zeitüberschreitung, verkleinere das Foto.

## Daten eintragen

Ändere nur die Texte, nicht die Befehle davor. Am besten erzeugst du zwischendurch immer wieder das PDF, dann siehst du sofort, was sich ändert.

| Was | So sieht es aus | Hinweis |
|---|---|---|
| **Name** | `\newcommand{\cvfirstname}{Anna}` | steht ganz oben, ebenso `\cvlastname` |
| **Text in zwei Sprachen** | `\lang{Kochen}{Cooking}` | erst Deutsch, dann Englisch |
| **Kenntnisse** | `\skillrow{Python}{3}{2}` | 3 grüne und 2 graue Punkte |
| **Stelle oder Studium** | `\cventry{Zeitraum}{Titel}{Stichpunkte}` | zum Kopieren liegen Beispiele in der Datei |

**Foto hinzufügen (freiwillig):** Lege neben der `.tex`-Datei einen Ordner `pictures` an, falls es ihn noch nicht gibt, und speichere dein Foto dort als `photo.jpg`. Ohne Foto erscheint ein gestrichelter Platzhalter. Den Bildausschnitt stellst du im Abschnitt `Photo` über `trim` ein.

## Farbe ändern

Die Farben stehen im Abschnitt `Colors` weit oben in der Datei. Ersetze dort nur den sechsstelligen Farbcode:

```latex
\definecolor{sidebar}{HTML}{0F6C74}   % linker Balken
\definecolor{cvgreen}{HTML}{2BAF6A}   % Punkte bei den Kenntnissen
```

Für den linken Balken eignen sich dunkle Farben, weil die Schrift darauf weiß ist. Beispiele sind `1F3A5F` (Dunkelblau), `2F3640` (Anthrazit) und `7A1F3D` (Bordeaux). Weitere Codes findest du, wenn du im Internet nach „HTML Color Picker“ suchst. Danach erzeugst du das PDF wie gewohnt neu.

## Wenn etwas nicht klappt

| Problem | Lösung |
|---|---|
| Fehlermeldung `Misplaced alignment tab character &` | Schreibe das Zeichen als `\&` |
| Text verschwindet nach einem `%` | Schreibe das Zeichen als `\%` |
| Der Lebenslauf hat zwei Seiten | Kürze Texte oder entferne Einträge |
| Eine Zeile soll nicht erscheinen | Setze ein `%` an ihren Anfang |
| Ein Paket fehlt | Installiere das vollständige MacTeX, nicht BasicTeX. Bei MiKTeX bestätigst du die Nachfrage zur Paketinstallation |

## Für Fortgeschrittene

| Befehl | Wirkung |
|---|---|
| `make` | baut beide Sprachen |
| `make de` / `make en` | baut nur eine Sprache |
| `make init` | legt `cv.tex` an, überschreibt aber keine vorhandene Datei |
| `make clean` | löscht die Hilfsdateien in `output/` |
| `make SRC=skeleton-cv.tex` | baut die Vorlage, auch wenn es eine `cv.tex` gibt |

- Umlaute im Namen schreibst du direkt (`Müller`), nicht als `M\"uller`. Im Dateinamen wird daraus `Mueller`.
- Arbeitest du mit Git, erfasst es nur die Vorlage, `README.md`, `Makefile` und die leeren Ordner. `cv.tex`, Fotos und PDFs bleiben lokal.
