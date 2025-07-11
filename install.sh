#!/bin/bash
echo installing
apt install wget -y
echo Please wait
cd /
cd opt
mkdir utunnel
cd utunnel
wget https://github.com/hoseinlolready/bug-free-fortnight/blob/main/utunnel
clear
sleep 2
cd /
clear
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
# Determine CPU architecture
ARCH=$(uname -m)

# Map architecture to download URL
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
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Download the appropriate version
echo "Downloading utunnel_manager for $ARCH..."
wget -O utunnel_manager $URL || curl -o utunnel_manager $URL

if [ ! -f "utunnel_manager" ]; then
    echo "Failed to download utunnel_manager"
    exit 1
fi

# Make it executable
chmod +x utunnel_manager

# Run the manager
echo "Starting utunnel_manager..."
./utunnel_manager
