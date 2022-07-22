#!/bin/bash
set -u

function install_brew() { NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }
function install_gh() { /bin/bash -c "brew install gh"; }
function install_colima() { /bin/bash -c "brew install colima"; }

# brew will be used for installing stuff, check if installed
if ! type brew >/dev/null 2>&1 ; then
    echo "brew is needed, we'll try to install it automatically,
        if it fails try to install manually using steps described: 
        https://docs.brew.sh/Installation"
    if ! install_brew >/dev/null 2>&1 ; then
        echo "There was an issue while installing Homebrew."
        exit 1
    else
        echo "Homebrew installation succesful"
    fi
    else
        echo "OK - Homebrew present."
fi

# Github CLI is used, check if installed
if ! type gh >/dev/null 2>&1 ; then
    echo "Github CLI is needed, we'll try to install it automatically,
        if it fails try to install manually using steps described: 
        MacOS/Windows: https://github.com/cli/cli#installation
        Linux: https://github.com/cli/cli/blob/trunk/docs/install_linux.md"
    if ! install_gh >/dev/null 2>&1 ; then
        echo "There was an issue while installing Github CLI."
        exit 1
    else
        echo "Github CLI installation succesful"
    fi
    else 
        echo "OK - Github CLI present."
fi

# Colima for running containers will be used, check if installed
if ! type colima >/dev/null 2>&1 ; then
    echo "Colima is needed, we'll try to install it automatically,
        if it fails try to install manually using steps described: 
        https://github.com/abiosoft/colima"
    if ! install_colima >/dev/null 2>&1 ; then
        echo "There was an issue while installing Colima."
        exit 1
    else
        echo "Colima installation succesful"
    fi
    else
        echo "OK - Colima present."
fi


# run  -it \
#     -e http_proxy=webproxy.infra.backbase.cloud:8888 \
#     -e https_proxy=webproxy.infra.backbase.cloud:8888 \
#     -v ~/github.com:/github.com ghcr.io/piotrzbackbasecom/backbase-cs-cicd:main \
#     newman run \
#     /github.com/organisations/baas-devops-reference/docs/backend/Model\ Bank\ -\ Postman\ Collection/Product\ Led\ -\ Modelbank\ installation.postman_collection.json \
#     -e /github.com/organisations/baas-devops-reference/docs/backend/Model\ Bank\ -\ Postman\ Collection/Product\ Led\ -\ Modelbank\ installation.postman_environment-jcb.json \
#     --folder "1. Login as admin" --folder "2. Get service agreement"
