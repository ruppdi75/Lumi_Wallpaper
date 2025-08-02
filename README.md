# AnduinOS Wallpaper Installation Script

Dieses Skript automatisiert die Installation eines systemweiten Hintergrundbildes in AnduinOS.

## Verwendung

### Einfache Verwendung (mit Standardwerten):
```bash
./install-wallpaper.sh
```
Dies verwendet das Standardbild: `/home/lumi/Downloads/LumiOS_Wallpaper_v2_3840x2160.png`

### Mit eigenem Bild:
```bash
./install-wallpaper.sh /pfad/zu/ihrem/bild.png
```

### Mit eigenem Bild und Namen:
```bash
./install-wallpaper.sh /pfad/zu/ihrem/bild.png MeinHintergrundbild "Mein schönes Hintergrundbild"
```

## Parameter

1. **Quellbild** (optional): Pfad zum Hintergrundbild
2. **Dateiname** (optional): Name für die Datei im System (ohne .png)
3. **Anzeigename** (optional): Name, der in den Einstellungen angezeigt wird

## Was das Skript macht

1. **Kopiert das Bild** nach `/usr/share/backgrounds/`
2. **Erstellt eine XML-Konfiguration** in `/usr/share/gnome-background-properties/`
3. **Setzt die richtigen Berechtigungen** für beide Dateien
4. **Überprüft** die Eingaben auf Gültigkeit

## Nach der Installation

1. Schließen Sie die Einstellungs-App, falls geöffnet
2. Öffnen Sie Einstellungen > Darstellung > Hintergrund
3. Ihr neues Hintergrundbild sollte in der Liste erscheinen
4. Falls nicht sichtbar, melden Sie sich ab und wieder an

## Beispiele

```bash
# Standard LumiOS Wallpaper installieren
./install-wallpaper.sh

# Eigenes Bild installieren
./install-wallpaper.sh ~/Bilder/mein-hintergrund.jpg

# Mit eigenem Namen
./install-wallpaper.sh ~/Bilder/landschaft.png Landschaft "Schöne Landschaft"
```

## Fehlerbehebung

- Das Skript benötigt `sudo`-Rechte für die Installation
- Führen Sie das Skript NICHT als root aus
- Stellen Sie sicher, dass die Bilddatei existiert und ein gültiges Bildformat hat
