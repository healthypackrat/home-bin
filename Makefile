prefix = $(HOME)/bin

sources = \
  brew-installed-deps \
  brew-installed-rdeps \
  http-server \
  java_home \
  ruby-tags \
  set-volume \
  sox-silence \
  terminal-notifier-alert

targets = $(addprefix $(prefix)/,$(sources))

all: $(targets)

$(prefix)/%: %
	@ test -d '$(dir $@)' || mkdir -p '$(dir $@)'
	cp $< $@

show-diff:
	@ for source in $(sources); do \
	    diff -u "$(prefix)/$$source" "$$source"; \
	  done; true
