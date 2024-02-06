export GUILE_LOAD_PATH := $(pwd):$(GUILE_LOAD_PATH):$(XDG_CONFIG_HOME)/guix

.PHONY: work
work:
	guix home reconfigure ./home/machines/work.scm
