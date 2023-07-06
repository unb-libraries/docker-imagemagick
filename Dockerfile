FROM debian:bullseye
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

RUN apt-get --yes update && \
  apt-get --yes install \
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
