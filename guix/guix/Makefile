export GUILE_LOAD_PATH := $(pwd):$(GUILE_LOAD_PATH):$(XDG_CONFIG_HOME)/guix

.PHONY: work
work:
	guix home reconfigure ./home/machines/work.scm

.PHONY: personal
personal:
	guix home reconfigure ./home/machines/personal.scm --substitute-urls='https://ci.guix.gnu.org https://bordeaux.guix.gnu.org https://substitutes.nonguix.org' --allow-downgrades

.PHONY: tablet
tablet:
	guix home reconfigure ./home/machines/tablet.scm

.PHONY: reform
reform:
	guix home reconfigure ./home/machines/reform.scm
