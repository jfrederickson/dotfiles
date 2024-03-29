(dolist (package '(use-package))
  (unless (package-installed-p package)
    (progn
      (package-refresh-contents)
      (package-install package))))

(use-package quelpa
  :ensure t)
;;(use-package quelpa-use-package
;;  :ensure t)

;;(require 'quelpa-use-package)

;;(use-package matrix-client
;;  :quelpa ((matrix-client :fetcher github :repo "alphapapa/matrix-client-el"
;;                          :files (:defaults "logo.png" "matrix-client-standalone.el.sh"))))
(use-package xterm-color
  :ensure t)
;;(use-package rmoo
;;  :quelpa ((rmoo :fetcher github :repo "lisdude/rmoo")))

;;(use-package sunrise-commander
;;  :quelpa (sunrise-commander :fetcher github :repo "escherdragon/sunrise-commander"))
;;
;;(use-package spotify
;;  :quelpa (spotify :fetcher github :repo "danielfm/spotify.el"))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
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
(use-package forge
  :after magit
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
  :ensure t
  :init
  (elpy-enable))
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
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))
(use-package eudc
  :ensure t)
(use-package apache-mode
  :ensure t)
;;(use-package poet-theme
;;  :ensure t)
(use-package nginx-mode
  :ensure t)
(use-package s
  :ensure t)
(use-package mastodon
  :ensure t)
(use-package highlight-indent-guides
  :ensure t
  :hook (yaml-mode . highlight-indent-guides-mode))
(use-package one-themes
  :ensure t)
(use-package elixir-mode
  :ensure t)
(use-package terraform-mode
  :ensure t)
(use-package nov
  :ensure t)
(use-package rust-mode
  :ensure t)
;;(use-package spacemacs-theme
;;  :ensure t)
(use-package ansible
  :ensure t)
(use-package ini-mode
  :ensure t)
(use-package poetry
  :ensure t)
(use-package elpher
  :ensure t)
(use-package base16-theme
  :ensure t)
(use-package nix-mode
  :ensure t)
(use-package elfeed-protocol
  :ensure t)
(use-package yequake
  :ensure t)
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))
(use-package mastodon
  :ensure t)
(use-package visual-fill-column
  :ensure t)
(use-package racket-mode
  :ensure t)
(use-package fennel-mode
  :ensure t)
