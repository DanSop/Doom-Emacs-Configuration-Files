;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
(setq doom-font (font-spec :size 14 ))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-material) ;; problem, we didn't see which text is highlighted
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-spacegrey)

(when (display-graphic-p)
  (toggle-frame-maximized)
  ;;(setq doom-font (font-spec :family "monospace" :size 13)
  ;;    doom-variable-pitch-font (font-spec :family "sans"))

  (custom-theme-set-faces! 'doom-one
    '(line-number :foreground "dim gray")
    '(line-number-current-line :foreground "white")))
    ;; '(doom-modeline-project-dir :foreground "blue")
    ;; '(doom-modeline-buffer-path   :foreground "blue")
    ;;'(mode-line-inactive :background "dim gray" :foreground "white" :height 80)
    ;;'(mode-line :background "black" :height 80)
    ;;'(default :background "#1b1c1c")

(set-frame-parameter (selected-frame) 'alpha '(88 88))
(add-to-list 'default-frame-alist '(alpha 88 88))

;; Makes magit look a bit nicer
(after! magit
  (remove-hook 'git-commit-setup-hook 'git-commit-turn-on-auto-fill)
  (setf magit-ediff-dwim-show-on-hunks t)
  (setf magit-log-margin '(t "%d-%m-%y" magit-log-margin-width t 18))
  (set-face-attribute 'magit-branch-current nil :box '(:line-width (1 . 1) :color "#51afef")))

(after! highlight-indent-guides
  (message "Applying highlight-indent-guides settings")
  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-auto-enabled t)
  (setq highlight-indent-guides-responsive 'top))

;; C++ styles comments
(add-hook 'c-mode-hook (lambda () (setq comment-start "// "
                                        comment-end   "")))

;; Line number and emacs confirmation message
(setq confirm-kill-emacs nil)
(setq display-line-numbers-type t)

;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(add-to-list 'load-path "~/.config/doom/Custom/")
(require 'ollama)
