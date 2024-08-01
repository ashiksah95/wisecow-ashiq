FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    fortune-mod \
    cowsay \
    bash \
    curl \
    netcat \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ENV PATH="/usr/games:${PATH}"
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh
EXPOSE 4499
CMD ["/usr/local/bin/wisecow.sh"]
