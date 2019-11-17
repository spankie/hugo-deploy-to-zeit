FROM alpine:latest
LABEL maintainer="Odohi David <odohi.david@gmail.com>"

LABEL "com.github.actions.name"="Hugo Deploy To Zeit"
LABEL "com.github.actions.description"="Build and deploy a hugo site to zeit using now"
LABEL "com.github.actions.icon"="target"
LABEL "com.github.actions.color"="black"

RUN	apk add --no-cache \
	bash \
	ca-certificates \
	curl \
	git

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
