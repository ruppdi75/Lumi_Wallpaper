#!/bin/bash

# Lumi Wallpaper Installation Script
# This script automates the process of installing a system-wide wallpaper
# Compatible with GNOME-based Linux distributions

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script should not be run as root. It will use sudo when needed."
    exit 1
fi

# Default values
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_SOURCE="$SCRIPT_DIR/lumi-wallpaper.png"
DEFAULT_NAME="Lumi-Wallpaper"
DEFAULT_DISPLAY_NAME="Lumi Cat Wallpaper"

# Get input parameters or use defaults
SOURCE_IMAGE="${1:-$DEFAULT_SOURCE}"
WALLPAPER_NAME="${2:-$DEFAULT_NAME}"
DISPLAY_NAME="${3:-$DEFAULT_DISPLAY_NAME}"

# Derived paths
TARGET_PATH="/usr/share/backgrounds/${WALLPAPER_NAME}.png"
XML_PATH="/usr/share/gnome-background-properties/${WALLPAPER_NAME,,}.xml"

print_status "Starting wallpaper installation..."
print_status "Source image: $SOURCE_IMAGE"
print_status "Target path: $TARGET_PATH"
print_status "Display name: $DISPLAY_NAME"

# Check if source image exists
if [[ ! -f "$SOURCE_IMAGE" ]]; then
    print_error "Source image not found: $SOURCE_IMAGE"
    echo
    print_warning "Usage: $0 [source_image] [wallpaper_name] [display_name]"
    print_warning "Example: $0 /path/to/image.png MyWallpaper 'My Beautiful Wallpaper'"
    echo
    print_warning "Default location: $DEFAULT_SOURCE"
    exit 1
fi

# Check if image is actually an image file
if ! file "$SOURCE_IMAGE" | grep -q "image"; then
    print_error "File does not appear to be an image: $SOURCE_IMAGE"
    exit 1
fi

# Check available disk space
IMAGE_SIZE=$(stat -c%s "$SOURCE_IMAGE" 2>/dev/null || stat -f%z "$SOURCE_IMAGE" 2>/dev/null || echo 0)
AVAIL_SPACE=$(df /usr/share/backgrounds/ | tail -1 | awk '{print $4}')
if [[ $IMAGE_SIZE -gt 0 ]] && [[ $((AVAIL_SPACE * 1024)) -lt $IMAGE_SIZE ]]; then
    print_error "Insufficient disk space in /usr/share/backgrounds/"
    exit 1
fi

print_status "Step 1: Copying image to system backgrounds directory..."

# Copy the image to the system directory
if sudo cp "$SOURCE_IMAGE" "$TARGET_PATH"; then
    print_status "Image copied successfully to $TARGET_PATH"
else
    print_error "Failed to copy image to $TARGET_PATH"
    exit 1
fi

# Set proper permissions
sudo chmod 644 "$TARGET_PATH"
print_status "Set permissions for wallpaper image"

print_status "Step 2: Creating XML configuration file..."

# Create the XML configuration
XML_CONTENT="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">
<wallpapers>
<wallpaper>
<name>$DISPLAY_NAME</name>
<filename>$TARGET_PATH</filename>
<options>zoom</options>
<pcolor>#000000</pcolor>
<scolor>#000000</scolor>
<shade_type>solid</shade_type>
</wallpaper>
</wallpapers>"

# Write XML file
if echo "$XML_CONTENT" | sudo tee "$XML_PATH" > /dev/null; then
    print_status "XML configuration created at $XML_PATH"
else
    print_error "Failed to create XML configuration"
    exit 1
fi

# Set proper permissions for XML file
sudo chmod 644 "$XML_PATH"
print_status "Set permissions for XML configuration"

# Update GNOME settings cache
if command -v update-desktop-database &> /dev/null; then
    sudo update-desktop-database 2>/dev/null || true
    print_status "Updated desktop database"
fi

print_status "Step 3: Installation complete!"
echo
print_status "Your wallpaper '$DISPLAY_NAME' has been installed successfully."
print_warning "To see the new wallpaper in your settings:"
echo "  1. Close the Settings app if it's open"
echo "  2. Open Settings > Appearance > Background"
echo "  3. Your wallpaper should appear in the list"
echo "  4. If not visible, try logging out and back in"
echo
print_status "Files created:"
echo "  - Wallpaper: $TARGET_PATH"
echo "  - Configuration: $XML_PATH"
