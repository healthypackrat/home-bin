prefix = $(HOME)/bin

sources = \
  bookmarks2json \
  brew-installed-deps \
  brew-installed-rdeps \
  http-server \
  java_home \
  jj \
  ruby-tags \
  set-volume \
  sox-silence \
  tac \
  terminal-notifier-alert \
  youtube-dl-playlist \
  youtube-dl-playlist-audio

targets = $(addprefix $(prefix)/,$(sources))

.PHONY: all show-diff

all: $(targets)

$(prefix)/%: %
	@ test -d '$(dir $@)' || mkdir -p '$(dir $@)'
	cp $< $@

show-diff:
	@ for source in $(sources); do \
	    diff -u "$(prefix)/$$source" "$$source"; \
	  done; true
