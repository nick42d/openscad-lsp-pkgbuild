# Possible tests for openscad-lsp

# Test that package still works and makes
test-this-ver:
    echo "Testing makepkg"
    rm -rf pkg/ src/
    makepkg -f --cleanbuild --nodeps
    
# Check if upstream has updated version
check-upstream-ver: 
    #!/usr/bin/env bash
    # cur_ver=$(grep -oP '^pkgver=\K(\d+\.)*\d+' PKGBUILD)
    # rm -rf tuxedo-drivers/
    # git clone https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers.git
    # new_ver=$(grep -Pom1 '.* \(\K.*(?=\) .*; urgency=.*)' tuxedo-drivers/debian/changelog) 
    # if [ "$cur_ver" != "$new_ver" ]; then
    #     echo "Upstream version $new_ver not equal to local version $cur_ver"
    #     exit 1
    # else 
    #     echo "Versions match $new_ver"
    #     exit 0
    # fi
    echo "Check-upstream-ver not yet implemented"
    exit 1

# Automatically update PKGBUILD, if it builds on the latest upstream version.
update-to-upstream:
    #!/usr/bin/env bash
    # cur_ver=$(grep -oP '^pkgver=\K(\d+\.)*\d+' PKGBUILD)
    # rm -rf pkg/ src/ tuxedo-drivers/
    # git clone https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers.git
    # new_ver=$(grep -Pom1 '.* \(\K.*(?=\) .*; urgency=.*)' tuxedo-drivers/debian/changelog) 
    # if [ "$cur_ver" != "$new_ver" ]; then
    #     echo "Updating PKGBUILD to $new_ver from $cur_ver"
    #     cp PKGBUILD PKGBUILD.bak
    #     cp .SRCINFO .SRCINFO.bak
    #     sed -i "s/^pkgver=$cur_ver/pkgver=$new_ver/" PKGBUILD
    #     if ./updpkgsums \
    #         && makepkg -f --cleanbuild --nodeps \
    #         && make -C ./src/clevo-drivers-$new_ver \
    #         && makepkg --printsrcinfo > .SRCINFO; then
    #         echo "Update successful"
    #         exit 0
    #     else
    #         echo "New PKGBUILD / .SRCINFO failed - reverting"
    #         cp PKGBUILD.bak PKGBUILD
    #         cp .SRCINFO.bak .SRCINFO
    #         exit 1
    #     fi
    # else 
    #     echo "Already at latest version $new_ver"
    #     exit 0
    # fi
    echo "Update-to-upstream not yet implemented"
    exit 1

# Push to AUR
push-to-aur COMMIT-MSG:
    #!/usr/bin/env bash
    # https://just.systems/man/en/chapter_45.html
    set -euxo pipefail
    echo "Pushing to AUR"
    rm -rf aur/
    git clone ssh://aur@aur.archlinux.org/openscad-lsp.git aur
    cp PKGBUILD aur/PKGBUILD
    cp .SRCINFO aur/.SRCINFO
    cd aur
    git commit -am '{{COMMIT-MSG}}'
    git push
