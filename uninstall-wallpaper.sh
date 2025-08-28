#!/bin/bash

# Lumi Wallpaper Uninstallation Script
# This script removes the Lumi wallpaper from the system

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

# Default wallpaper name
WALLPAPER_NAME="${1:-Lumi-Wallpaper}"

# Derived paths
WALLPAPER_PATH="/usr/share/backgrounds/${WALLPAPER_NAME}.png"
XML_PATH="/usr/share/gnome-background-properties/${WALLPAPER_NAME,,}.xml"

print_status "Starting wallpaper uninstallation..."
print_status "Wallpaper name: $WALLPAPER_NAME"

# Check if wallpaper exists
if [[ ! -f "$WALLPAPER_PATH" ]]; then
    print_warning "Wallpaper not found at: $WALLPAPER_PATH"
    print_warning "It may have already been removed or was never installed."
else
    # Remove wallpaper image
    print_status "Removing wallpaper image..."
    if sudo rm -f "$WALLPAPER_PATH"; then
        print_status "Wallpaper image removed successfully"
    else
        print_error "Failed to remove wallpaper image"
        exit 1
    fi
fi

# Check if XML configuration exists
if [[ ! -f "$XML_PATH" ]]; then
    print_warning "XML configuration not found at: $XML_PATH"
    print_warning "It may have already been removed or was never created."
else
    # Remove XML configuration
    print_status "Removing XML configuration..."
    if sudo rm -f "$XML_PATH"; then
        print_status "XML configuration removed successfully"
    else
        print_error "Failed to remove XML configuration"
        exit 1
    fi
fi

print_status "Uninstallation complete!"
echo
print_status "The wallpaper '$WALLPAPER_NAME' has been removed from your system."
print_warning "If this wallpaper was currently in use, you may need to select a different wallpaper in Settings."
echo
print_status "Files removed:"
echo "  - Wallpaper: $WALLPAPER_PATH"
echo "  - Configuration: $XML_PATH"
