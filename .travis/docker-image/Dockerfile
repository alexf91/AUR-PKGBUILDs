FROM archlinux/base:latest

COPY arch-mirrorlist /etc/pacman.d/mirrorlist

RUN pacman-key --init && \
    pacman -Syyu --noconfirm && \
    pacman -S --noconfirm base-devel

RUN useradd -ms /bin/bash builduser
RUN echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser

# Install yay and git. Git and its dependencies will be removed after installing
# dependencies of the package we want to test.
RUN cd /tmp \
 && curl -JL https://github.com/Jguer/yay/releases/download/v9.2.1/yay_9.2.1_x86_64.tar.gz \
    | tar xfz - \
 && mv yay_9.2.1_x86_64/yay /usr/local/bin/yay \
 && pacman -S --noconfirm git

COPY docker-entrypoint.sh /docker-entrypoint.sh

USER builduser

# Add GPG keys for some packages.
RUN gpg --recv-keys A06C6D95DFC71475

ENTRYPOINT ["/docker-entrypoint.sh"]
