FROM haskell:8.0

MAINTAINER https://github.com/olastor

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    apt-utils \
    unzip \
    fontconfig \
    lmodern \
    texlive-full

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "2.1.3"

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

WORKDIR /source

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
