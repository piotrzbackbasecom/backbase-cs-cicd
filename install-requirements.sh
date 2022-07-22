#!/bin/bash
set -u

function install_brew() { NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }
function message_brew() { echo -e "https://docs.brew.sh/Installation"; }
function install_gh() { /bin/bash -c "brew install gh"; }
function message_gh() { echo -e "MacOS/Windows: https://github.com/cli/cli#installation\nLinux: https://github.com/cli/cli/blob/trunk/docs/install_linux.md"; }
function install_colima() { /bin/bash -c "brew install colima"; }
function message_colima() { echo -e "https://github.com/abiosoft/colima"; }


function check_and_install() {
    if ! type "$1" >/dev/null 2>&1; then
        echo -e "\n-------------------------------\n$1 is needed, we'll try to install it automatically,\nif it fails try to install manually using steps described at :"
        message_"$1";
        echo -e "\n-------------------------------"
        if ! install_"$1" >/dev/null 2>&1; then
            echo "There was an issue while installing $1"
            exit 1
        else
            echo "$1 installation succesful"
        fi
        else   
            echo "OK - $1 present."
    fi
}

check_and_install "brew";
check_and_install "gh";
check_and_install "colima";


# run  -it \
#     -e http_proxy=webproxy.infra.backbase.cloud:8888 \
#     -e https_proxy=webproxy.infra.backbase.cloud:8888 \
#     -v ~/github.com:/github.com ghcr.io/piotrzbackbasecom/backbase-cs-cicd:main \
#     newman run \
#     /github.com/organisations/baas-devops-reference/docs/backend/Model\ Bank\ -\ Postman\ Collection/Product\ Led\ -\ Modelbank\ installation.postman_collection.json \
#     -e /github.com/organisations/baas-devops-reference/docs/backend/Model\ Bank\ -\ Postman\ Collection/Product\ Led\ -\ Modelbank\ installation.postman_environment-jcb.json \
#     --folder "1. Login as admin" --folder "2. Get service agreement"
