FROM archlinux:latest

RUN pacman -Syq --noconfirm yq jq aws-cli kubectl fluxctl sed coreutils sops github-cli 
RUN useradd cicd
# Uncomment next 2 lines if we happen to need sudo afterall (we shouldn't need that)
# RUN pacman -Syq --noconfirm sudo
# RUN echo "cicd ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/cicd

USER cicd

CMD [ "/bin/bash" ]
