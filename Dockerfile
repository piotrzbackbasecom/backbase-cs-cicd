FROM archlinux:latest

RUN pacman -Syq --noconfirm yq jq aws-cli kubectl fluxctl sed coreutils sops github-cli nodejs-lts-gallium npm yarn
RUN npm i postman-to-openapi -g
RUN npm i newman -g

RUN useradd -m cicd
USER cicd

CMD [ "/bin/bash" ]
