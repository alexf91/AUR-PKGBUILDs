FROM archlinux/base:latest

RUN pacman-key --init && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel

RUN useradd -ms /bin/bash builduser
RUN echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser

USER builduser

RUN cd /tmp && \
    curl -O -J https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz && \
    tar xf yay.tar.gz && \
    cd yay && \
    makepkg --noconfirm --syncdeps --install && \
    cd /tmp && \
    rm -rf yay yay.tar.gz

ENTRYPOINT ["/bin/bash"]
