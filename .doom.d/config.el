;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Anirudh Rowjee"
      user-mail-address "ani.rowjee@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:


(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled


(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; change the default lsp server for rust
(after! lsp-rust
  (setq lsp-rust-server 'rust-analyzer))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))


;; Treesitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; DAP
;;
(use-package! dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(require 'dap-python)
(require 'dap-lldb)
(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                           :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))
(require 'dap-dlv-go)


;; custom keybindings, lessgooooo
(map! :leader
      :desc "split window vertically"
      "|" #'evil-window-vsplit
      )

(map! :leader
      :desc "split window horizontally"
      "-" #'evil-window-split
      )

;; soft wrap line at buffer boundaries
(global-visual-line-mode t)

;; bind file path completion
(map! :leader
      :desc "complete filepath dynamically at this point"
      "e" '(lambda ()
            (interactive)
            (comint-dynamic-complete-as-filename)
            )
      )

;; (setq fancy-splash-image "~/Desktop/random/memes/FUoiyeMWYAA9Loz.jpeg")



;; no transparency.

(custom-set-faces
'(font-lock-comment-face nil :slant 'italic)
'(font-lock-function-name-face nil  :slant 'italic)
'(font-lock-variable-name-face nil  :slant 'italic)
)
;; TODO https://david.rothlis.net/emacs/customize_colors.html

;; Breadcrums with LSP
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-headerline-breadcrumb-segments '(project file symbols))
(setq lsp-headerline-breadcrumb-icons-enable t)

;; Custom GitGutter Fringes
(define-fringe-bitmap 'git-gutter-fr:added [#b11100000] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [#b11100000] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted
  [#b10000000
   #b11000000
   #b11100000
   #b11110000] nil nil 'bottom)

;; Change the delay for evil-mode to make it more snappy
(setq evil-esc-delay 0)

;; set the idle delay for autocomplete to make it more snappy
(setq company-idle-delay 0)

;; Snippet to walk a directory tree for python files and include it as org SRC Blocks
(require 'find-lisp)
(defun inject-include-find-file (root_dir regexp)
(mapc
 (lambda (x)
   (insert "*** " x " \n")
   (insert "#+INCLUDE: " x " src py ")
   (insert "\n")
   )
   (find-lisp-find-files root_dir regexp)))

;; Tell Emacs to use EWW as the Default Browser
(setq browse-url-browser-function 'eww-browse-url)

;; Configure how EWW Opens
(defun eww-display+ (buf _alist)
  (let ((w (or (window-in-direction 'right)
               (window-in-direction 'left)
               (window-in-direction 'below)
               (window-in-direction 'above)
               (split-window-horizontally))))
    (set-window-buffer w buf)
    w))

(push `(,(rx "*eww*")
        (eww-display+))
      display-buffer-alist)

;; Workable Rust config for LSP

;; Custom Blog Mode! :D
;; Inspired by https://willschenk.com/articles/2021/emacs_blogging_mode/
;; set the directory
(setq blog-mode-base-dir "/home/anirudh/portfolio/data/")
(require 'transient)

;; Peek Function - Reads _entite file_ to extract something based on regex
(defun blog-mode-file-peek (pattern file)
    (let ((result (car (process-lines "awk" "-F: " (concat pattern " {print $2}") file))))
      (if result
          (replace-regexp-in-string "\"" "" result)
        "")))

;; Custom peek function - check for WIP
(defun blog-mode-file-peek-wip (pattern file)
    (let ((result (car (process-lines "awk" (concat pattern " {print $0}") file))))
      (if result
          (replace-regexp-in-string "\"" "" result)
          (let ((result "true")))
        "")))

;; Function to extract tags from the post
(defun blog-mode-extract-tags (pattern file)
    (let (
          (result (format "%S" (process-lines "awk" "-F- " (concat pattern " {print $2}")  file)))
          )
      (if result
          (replace-regexp-in-string "\"" "" result)
        "no tags"))
    )

;; Parse an Org File
(defun blog-mode-parse-org (file)
  (let ((title (blog-mode-file-peek "/\\+title/" file))
        (date (blog-mode-file-peek "/\\+date/" file))
        (draft (blog-mode-file-peek "/\\+draft/" file))
        (tags (blog-mode-file-peek "/\\+tags/" file)))
    (list file (vector title draft date tags))))
;; Parse a Markdown File
;; TODO - Figure out how to Parse Tags & WIP Status using AWK
(defun blog-mode-parse-md (file)
  (let ((title (blog-mode-file-peek "/^title/" file))
        (date (blog-mode-file-peek "/^date/" file))
        (draft (blog-mode-file-peek-wip "/( )*WIP/" file))
        (tags (blog-mode-extract-tags "/  - /" file)))
    (list file (vector title draft date tags))))
;; Check if there's a .md or .org file hiding somewhere in a directory
(defun blog-mode-parse-directory (directory)
  (let ((md (concat directory "/index.md"))
        (org (concat directory "/index.org")))
    (if (file-exists-p md)
        (blog-mode-parse-md md)
      (if (file-exists-p org)
          (blog-mode-parse-org org)
        nil))))
;; Delegate a parser based on the file extension
(defun blog-mode-parse (file)
  (if (file-directory-p file)
  (blog-mode-parse-directory file)
    (let ((ex (file-name-extension file)))
      (if (string= ex "md")
          (blog-mode-parse-md file)
        (if (string= ex "org")
            (blog-mode-parse-org file)
          )))))
;; Source all the data from the directory
(defun blog-mode-refresh-data ()
  (setq blog-mode-entries nil)
  (dolist (file (process-lines "find" blog-mode-base-dir  "-maxdepth" "4" "-print"))
    (let ((entry (blog-mode-parse file)))
      (if entry
          (push (blog-mode-parse file) blog-mode-entries)))))
;; Implement the mode itself
(define-derived-mode blog-mode tabulated-list-mode "blog-mode" "Major mode Blog Mode, to edit hugo blogs"
  (setq tabulated-list-format [("Title" 60 t)
                               ("Draft" 5 nil)
                               ("Date"  11 t)
                               ("Tags" 0 nil)])
  (setq tabulated-list-padding 2)
  (setq tabulated-list-sort-key (cons "Date" t))
  (use-local-map blog-mode-map)
  (tabulated-list-init-header))

(defun blog-list ()
  (interactive)
  (pop-to-buffer "*Blog Mode*" nil)
  (blog-mode)
  (blog-mode-refresh-data)
  (setq tabulated-list-entries (-non-nil blog-mode-entries))
    (tabulated-list-print t))

;; Implement the popup with transient
(defvar blog-mode-map nil "keymap for blog-mode")

(setq blog-mode-map (make-sparse-keymap))

(define-key blog-mode-map (kbd "?") 'blog-mode-help)
(define-key blog-mode-map (kbd "o") 'blog-mode-open)
(define-key blog-mode-map (kbd "<return>") 'blog-mode-open)
(define-key blog-mode-map (kbd "d") 'blog-mode-drafts)
(define-key blog-mode-map (kbd "a") 'blog-mode-all)
(define-key blog-mode-map (kbd "p") 'blog-mode-published)
(define-key blog-mode-map (kbd "r") 'blog-mode-refresh-all)
(define-key blog-mode-map (kbd "c") 'blog-mode-make-draft)
(define-key blog-mode-map (kbd "s") 'blog-mode-start-hugo)
(define-key blog-mode-map (kbd "RET") 'blog-mode-open)

(transient-define-prefix blog-mode-help ()
  "Help transient for blog mode."
  ["Blog mode help"
   ("o" "Open" blog-mode-open)
   ("d" "Drafts" blog-mode-drafts)
   ("a" "All" blog-mode-all)
   ("p" "Published" blog-mode-published)
   ("r" "Refresh" blog-mode-refresh-all)
   ("c" "Create post" blog-mode-make-draft)
   ("s" "Start hugo" blog-mode-start-hugo)
   ])

;; Actions - Open a file
(defun blog-mode-open ()
  (interactive)
  (find-file (tabulated-list-get-id)))

;; Actions - Fetch all data again
(defun blog-mode-refresh-all ()
  (interactive)
  (progn
    (blog-mode-refresh-data)
    (setq tabulated-list-entries (-non-nil blog-mode-entries))
    (tabulated-list-print t)))

;; Actions - Show all Data
(defun blog-mode-all ()
  (interactive)
  (progn
    (setq tabulated-list-entries (-non-nil blog-mode-entries))
    (tabulated-list-print t)))

;; Actions - show drafts
(defun blog-mode-drafts ()
  (interactive)
  (progn
    (setq tabulated-list-entries
          (-filter (lambda (x)
                     (string= "true"
                              (aref (car (cdr x)) 1))) (-non-nil blog-mode-entries)))
    (tabulated-list-print t)))

(defun blog-mode-published ()
  (interactive)
  (progn
    (setq tabulated-list-entries
          (-filter (lambda (x)
                     (string= ""
                              (aref (car (cdr x)) 1))) blog-mode-entries)))
  (tabulated-list-print t))

(global-set-key (kbd "C-c d") 'blog-list)

