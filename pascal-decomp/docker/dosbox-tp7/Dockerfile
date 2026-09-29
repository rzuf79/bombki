FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# BOMBKI DOSBox-X + Turbo Pascal 7 image.
# Contains the genuine Borland TPC.EXE compiler (not FPC-emulated).
# Public-domain TP7 archive source (vendored at tools/TP.zip):
#   https://archive.org/download/tp_20240418/TP.zip
# Previous image layout: compiler extracted under /opt/tp7.
#
# Use in a workflow:
#   - uses: docker://ghcr.io/rzuf79/bombki-dosbox-tp7:latest
#     with:
#       volumes:
#         - ${{ github.workspace }}:/workspace
#
# See .github/workflows/build-dosbox-tp7-image.yml for the build and
# push to GHCR.

RUN apt-get update -qq && \
    apt-get install -y -qq dosbox-x xvfb unzip && \
    rm -rf /var/lib/apt/lists/*

# Extract the checked-in Archive.org payload into /tools/tp7.
COPY tools/TP.zip /tmp/TP.zip
RUN echo 'b9e71fcdb0cb5c2932e20e8eed254c643fe4de71fa5118868e61e8448743fc45  /tmp/TP.zip' | sha256sum -c - && \
    mkdir -p /tools/tp7 && \
    unzip -o -q /tmp/TP.zip -d /tools/tp7 && \
    rm -f /tmp/TP.zip && \
    find /tools/tp7 -iname 'tpc.exe' -print

# Pre-create the workspace directory
RUN mkdir -p /workspace
WORKDIR /workspace

# Default entrypoint: run DOSBox-X headless with the TP7 config
COPY dosbox-tp7.conf /etc/dosbox-tp7.conf
ENTRYPOINT ["xvfb-run", "-a", "dosbox-x", "-conf", "/etc/dosbox-tp7.conf"]
