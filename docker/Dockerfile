FROM ubuntu:20.04
MAINTAINER "Jonas Toth <jonas.toth@student.tu-freiberg.de>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y gnupg2 \
            texlive-full \
            texlive-science

ADD http://latex.tu-freiberg.de/deb/tubaflatex_via_apt.sh /bin/tubaflatex_via_apt.sh
RUN chmod +x /bin/tubaflatex_via_apt.sh \
 && /bin/tubaflatex_via_apt.sh \
 && apt-get update \
 && apt-get download tubaf-base tubaf-fonts

RUN dpkg --force-depends -i tubaf-base*.deb \
 && dpkg --force-depends -i tubaf-fonts*.deb \
 && rm -f *.deb

VOLUME /project
WORKDIR /project
COPY run.sh /bin/run.sh

ENTRYPOINT ["/bin/run.sh"]
