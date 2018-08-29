FROM debian:jessie
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

RUN apt-get --yes update && \
  apt-get --yes install \
    imagemagick
    wget
    bc && \
  mkdir -p /app && \
  wget -O /app/textcleaner "http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname=textcleaner&dirname=textcleaner" && \
  chmod +x /app/textcleaner && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
