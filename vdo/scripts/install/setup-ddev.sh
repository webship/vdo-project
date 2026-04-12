#!/bin/usr/env bash

echo '*--------------------------------------------------*';
echo '|   Setup DDEV for VDO                             |';
echo '*--------------------------------------------------*';
echo '| https://ddev.com/get-started/                    |';
echo '| https://docs.ddev.com/en/stable/                 |';
echo '*--------------------------------------------------*';
echo ;

# -----------------------------------------------------------------------------
# Step 1: Install Docker
# -----------------------------------------------------------------------------
echo '*--------------------------------------------------*';
echo '|   Step 1: Install Docker                         |';
echo '*--------------------------------------------------*';

if command -v docker &> /dev/null; then
  echo "Docker is already installed: $(docker --version)";
else
  echo "Installing Docker...";
  # Install Docker using the official convenience script.
  curl -fsSL https://get.docker.com | bash ;

  # Add the current user to the docker group.
  sudo usermod -aG docker $USER ;

  # Enable and start Docker service.
  sudo systemctl enable docker ;
  sudo systemctl start docker ;

  echo "Docker installed: $(docker --version)";
  echo "NOTE: You may need to log out and back in for docker group changes to take effect.";
fi

# -----------------------------------------------------------------------------
# Step 2: Install DDEV
# -----------------------------------------------------------------------------
echo '*--------------------------------------------------*';
echo '|   Step 2: Install DDEV                           |';
echo '*--------------------------------------------------*';

if command -v ddev &> /dev/null; then
  echo "DDEV is already installed: $(ddev version | head -1)";
else
  echo "Installing DDEV...";

  # Install DDEV via the official apt repository (Debian/Ubuntu).
  if command -v apt-get &> /dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings ;
    curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/ddev.gpg > /dev/null ;
    sudo chmod a+r /etc/apt/keyrings/ddev.gpg ;
    echo "deb [signed-by=/etc/apt/keyrings/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list >/dev/null ;
    sudo apt-get update && sudo apt-get install -y ddev ;
  # Install DDEV via yum/dnf (Fedora/CentOS).
  elif command -v dnf &> /dev/null; then
    echo '[ddev]
name=ddev
baseurl=https://pkg.ddev.com/yum/
gpgcheck=0
enabled=1' | perl -p -e 's/^ +//' | sudo tee /etc/yum.repos.d/ddev.repo >/dev/null ;
    sudo dnf install --refresh ddev ;
  # Fallback: Install DDEV via the universal install script.
  else
    curl -fsSL https://ddev.com/install.sh | bash ;
  fi

  echo "DDEV installed: $(ddev version | head -1)";
fi

# -----------------------------------------------------------------------------
# Step 3: Verify
# -----------------------------------------------------------------------------
echo '*--------------------------------------------------*';
echo '|   Step 3: Verify Installation                    |';
echo '*--------------------------------------------------*';

echo "Docker: $(docker --version 2>/dev/null || echo 'NOT INSTALLED')" ;
echo "DDEV: $(ddev version 2>/dev/null | head -1 || echo 'NOT INSTALLED')" ;

echo '*--------------------------------------------------*';
echo '|   DDEV setup complete!                           |';
echo '*--------------------------------------------------*';
