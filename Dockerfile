FROM qnib/alpn-base

RUN apk --no-cache add openssl \
 && wget -qO /usr/local/bin/go-github https://github.com/qnib/go-github/releases/download/0.2.2/go-github_0.2.2_MuslLinux \
 && chmod +x /usr/local/bin/go-github \
 && echo "# consul-content: $(/usr/local/bin/go-github rLatestUrl --ghorg ChristianKniep --ghrepo swarm --regex ".*_alpine" --limit 1)" \
 && wget -qO /usr/local/bin/swarm $(/usr/local/bin/go-github rLatestUrl --ghorg ChristianKniep --ghrepo swarm --regex ".*_alpine" --limit 1) \
 && rm -f /usr/local/bin/go-github \
 && apk del openssl
ADD opt/qnib/swarm/bin/start.sh /opt/qnib/swarm/bin/
