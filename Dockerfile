FROM debian:bullseye
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

RUN apt-get --yes update && \
  apt-get --yes install \
    exactimage \
    imagemagick \
    wget \
    bc && \
  mkdir -p /app && \
  wget -O /app/textcleaner "http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname=textcleaner&dirname=textcleaner" && \
  chmod +x /app/textcleaner && \
  wget -O /app/magick-slicer.sh "https://raw.githubusercontent.com/VoidVolker/MagickSlicer/master/magick-slicer.sh" && \
  chmod +x /app/magick-slicer.sh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY ./policy.xml /etc/ImageMagick-6/policy.xml

# Container metadata.
LABEL com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.description="Imagemagick processing image" \
  org.label-schema.name="docker-imagemagick" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-url="https://github.com/unb-libraries/docker-imagemagick" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.source="https://github.com/unb-libraries/docker-imagemagick"
