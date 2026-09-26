FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# BOMBKI DOSBox-X + Turbo Pascal 7 image.
# Contains the genuine Borland TPC.EXE compiler (not FPC-emulated).
# TP7 is publicly available from the Internet Archive:
#   https://archive.org/download/tp_20240418/TP.zip
#
# Use in a workflow:
#   - uses: docker://ghcr.io/rzuf79/bombki-dosbox-tp7:latest
#     with:
#       volumes:
#         - ${{ github.workspace }}:/workspace
#
# See .github/workflows/build-dosbox-image.yml for the build and
# push to GHCR.

RUN apt-get update -qq && \
    apt-get install -y -qq dosbox-x xvfb wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Download and extract TP7 into /opt/tp7
RUN mkdir -p /opt/tp7 && \
    cd /opt/tp7 && \
    wget -q https://archive.org/download/tp_20240418/TP.zip -O tp7.zip && \
    unzip -o -q tp7.zip && \
    rm -f tp7.zip && \
    find . -iname '*.exe' | head -10

# Pre-create the workspace directory
RUN mkdir -p /workspace
WORKDIR /workspace

# Default entrypoint: run DOSBox-X headless with the TP7 config
COPY dosbox-tp7.conf /etc/dosbox-tp7.conf
ENTRYPOINT ["xvfb-run", "-a", "dosbox-x", "-conf", "/etc/dosbox-tp7.conf"]
