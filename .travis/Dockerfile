FROM archlinux/base:latest

RUN pacman-key --init && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel

RUN useradd -ms /bin/bash builduser
RUN echo "builduser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builduser

USER builduser
ENTRYPOINT ["/bin/bash"]
