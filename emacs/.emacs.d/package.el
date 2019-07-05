(use-package quelpa
  :ensure t)
(use-package quelpa-use-package
  :ensure t)

(require 'quelpa-use-package)

(use-package matrix-client
  :quelpa ((matrix-client :fetcher github :repo "alphapapa/matrix-client-el"
                          :files (:defaults "logo.png" "matrix-client-standalone.el.sh"))))
(use-package xterm-color
  :ensure t)
(use-package rmoo
  :quelpa ((rmoo :fetcher github :repo "lisdude/rmoo")))

(use-package sunrise-commander
  :quelpa (sunrise-commander :fetcher github :repo "escherdragon/sunrise-commander"))

(use-package git-link
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package sourcerer-theme
  :ensure t)
(use-package groovy-mode
  :ensure t)
(use-package salt-mode
  :ensure t)
(use-package smooth-scroll
  :ensure t)
(use-package neotree
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package jedi
  :ensure t)
(use-package floobits
  :ensure t)
(use-package ein
  :ensure t)
(use-package virtualenvwrapper
  :ensure t)
(use-package jabber
  :ensure t)
(use-package magit
  :ensure t)
(use-package rainbow-delimiters
  :ensure t)
(use-package projectile
  :ensure t)
(use-package ido-completing-read+
  :ensure t)
(use-package cider
  :ensure t)
(use-package clojure-mode-extra-font-locking
  :ensure t)
(use-package clojure-mode
  :ensure t)
(use-package paredit
  :ensure t)
(use-package elpy
  :ensure t)
(use-package helm
  :ensure t)
(use-package better-defaults
  :ensure t)
(use-package helm-dash
  :ensure t)
(use-package ledger-mode
  :ensure t)
(use-package doom-modeline
  :ensure t)
(use-package all-the-icons
  :ensure t)
(use-package org-jira
  :ensure t)
(use-package ag
  :ensure t)
(use-package multiple-cursors
  :ensure t)
(use-package hyperbole
  :ensure t)
