#!/bin/sh
anno=$(date +%Y)
pkgschema="scheme-basic"
echo "LaTeXinstaller SheBang script v. 1.0.0.1"
echo "Maintainer ""sandyposten"" https://github.com/sandyposten"
echo "-- START INSTALL --"
echo "Actual LaTeX year release: $anno"
echo -n "Please insert installation scheme, default is: $pkgschema\n"
read data
if [ -z "$data" ]; then
    echo "No Data"
else
    pkgschema=$data
fi
echo "LaTeX selected installation schema is: $pkgschema"
echo "Removing symbolic links of previous installation (if exists, password required)..."
sudo tlmgr path remove
cd ~/Downloads
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*
sudo ./install-tl --paper=a4 --scheme=$pkgschema --no-interaction
cd /usr/local/texlive/$anno/bin/x86_64-linux
pwd
sudo ./tlmgr path add
echo "If you see this message, installation process went well! Have nice LaTeX typesetting! ;-)"
echo "-- END INSTALLATION --"
