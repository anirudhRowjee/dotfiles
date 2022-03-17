;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Anirudh Rowjee"
      user-mail-address "ani.rowjee@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 12)
      )

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)


;; util function to open windows side by side
(defun my/open-files-vert-split (file1 file2)
  (interactive "f\nf")
  (select-frame-set-input-focus (make-frame))
  (find-file file1)
  (split-window-right)
  (find-file file2)
  )

(setq fancy-splash-image "~/Desktop/random/doom-emacs-color.png")

;; battery level
(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))

;; web-mode config
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))

;; remove spelling suggestions
(remove-hook 'text-mode-hook #'spell-fu-mode)


(custom-set-faces
 '(background-color "black")
  )


(setq org-roam-directory "~/college/sem4")

(setq org-roam-capture-templates
      '(
        ("c" "College")

        ("cl" "Linear Algebra")
        ("cl1" "LA: Unit 1" plain (function org-roam--capture-get-point) "%?"
        :file-name "MA251/unit1/${slug}"
        :head "#+TITLE: ${title}\n#+FILETAGS: MA251 Unit1\n\nfrom: \ndate: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}\n")

        ("ca" "Design and Analysis of Algorithms")
        ("ca1" "DAA: Unit 1" plain (function org-roam--capture-get-point) "%?"
         :file-name "CS251/unit1/${slug}"
         :head "#+TITLE: ${title}\n#+FILETAGS: CS251 Unit1\n\nfrom: \ndate: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}\n")

        ("cm" "Microprocessor and Computer Architecture")
        ("cm1" "MPCA: Unit 1" plain (function org-roam--capture-get-point) "%?"
         :file-name "CS252/unit1/${slug}"
         :head "#+TITLE: ${title}\n#+FILETAGS: CS252 Unit1\n\nfrom: \ndate: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}\n")

        ("co" "Operating Systems")
        ("co1" "OS: Unit 1" plain (function org-roam--capture-get-point) "%?"
         :file-name "CS253/unit1/${slug}"
         :head "#+TITLE: ${title}\n#+FILETAGS: CS253 Unit1\n\nfrom: \ndate: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}\n")

        ("cn" "Computer Networks")
        ("cn1" "CN: Unit 1" plain (function org-roam--capture-get-point) "%?"
         :file-name "CS254/unit1/${slug}"
         :head "#+TITLE: ${title}\n#+FILETAGS: CS254 Unit1\n\nfrom: \ndate: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}\n")


        ;; TODO setup lab capture templates
        ("cc" "Laboratories")
                ("ccm" "MPCA Lab" plain (function org-roam--capture-get-point) "%?" :file-name "CS255/${slug}" :head "#+TITLE: ${title}")
                ("ccn" "CN lab" plain (function org-roam--capture-get-point) "%?" :file-name "CS256/${slug}" :head "#+TITLE: ${title}")
        ))


;; (setq elfeed-feeds
;;       '(
;;
;;         ;; programming
;;         ("https://news.ycombinator.com/rss" hackernews)
;;         ("https://www.heise.de/developer/rss/news-atom.xml" heise)
;;         ("https://www.reddit.com/r/programming.rss" rprogramming)
;;         ("https://www.reddit.com/r/emacs.rss" remacs)
;;
;;         ;; programming languages
;;         ("https://www.reddit.com/r/golang.rss" rgolang)
;;         ("https://www.reddit.com/r/java.rss" rjava)
;;         ("https://www.reddit.com/r/javascript.rss" rjavascript)
;;         ("https://www.reddit.com/r/typescript.rss" rtypescript)
;;         ("https://www.reddit.com/r/python.rss" rpython)
;;         ("https://www.reddit.com/r/rust.rss" rrust)
;;
;;         ;; cloud
;;         ("https://www.reddit.com/r/aws.rss" aws)
;;         ("https://www.reddit.com/r/googlecloud.rss" googlecloud)
;;         ("https://www.reddit.com/r/azure.rss" azure)
;;         ("https://www.reddit.com/r/devops.rss" devops)
;;         ("https://www.reddit.com/r/kubernetes.rss" kubernetes)
;;
;;         ;; tech news
;;         ;; ("" )
;; ))

(setq-default elfeed-search-filter "@2-days-ago +unread")
(setq-default elfeed-search-title-max-width 100)
(setq-default elfeed-search-title-min-width 100)

(global-set-key (kbd "C-x w") 'elfeed)
