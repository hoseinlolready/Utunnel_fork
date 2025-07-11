#!/bin/bash

echo "📦 Installing wget..."
apt install wget -y

# Check if the utunnel file already exists
if [ -f /opt/utunnel/utunnel ]; then
    echo "✅ utunnel already exists in /opt/utunnel/, skipping download."
    exit 0
fi

echo "🔄 Please wait..."
mkdir -p /opt/utunnel
cd /opt/utunnel || exit

# Download the base utunnel script
wget -O utunnel https://raw.githubusercontent.com/hoseinlolready/bug-free-fortnight/main/utunnel

clear
sleep 2
clear

# Fancy banner
cat << "EOF"
██╗      ██████╗ ██╗         ███████╗ ██████╗ ██████╗ ██╗  ██╗
██║     ██╔═══██╗██║         ██╔════╝██╔═══██╗██╔══██╗██║ ██╔╝
██║     ██║   ██║██║         █████╗  ██║   ██║██████╔╝█████╔╝ 
██║     ██║   ██║██║         ██╔══╝  ██║   ██║██╔══██╗██╔═██╗ 
███████╗╚██████╔╝███████╗    ██║     ╚██████╔╝██║  ██║██║  ██╗
╚══════╝ ╚═════╝ ╚══════╝    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
                    Fork by TG:@Pedsea                                      
EOF

sleep 8

# Detect CPU architecture
ARCH=$(uname -m)

case $ARCH in
    "x86_64")
        URL="https://github.com/hoseinlolready/Utunnel_fork/raw/refs/heads/main/utunnel_manager_amd64"
        ;;
    "aarch64" | "arm64")
        URL="https://github.com/hoseinlolready/Utunnel_fork/raw/refs/heads/main/utunnel_manager_arm64"
        ;;
    "i386" | "i686")
        URL="https://github.com/hoseinlolready/Utunnel_fork/raw/refs/heads/main/utunnel_manager_386"
        ;;
    *)
        echo "❌ Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

echo "📥 Downloading utunnel_manager for $ARCH..."
wget -O utunnel_manager "$URL" || curl -o utunnel_manager "$URL"

if [ ! -f "utunnel_manager" ]; then
    echo "❌ Failed to download utunnel_manager"
    exit 1
fi

chmod +x utunnel_manager

echo "🚀 Starting utunnel_manager..."
./utunnel_manager
