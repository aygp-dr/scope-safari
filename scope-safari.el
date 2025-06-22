;;; scope-safari.el --- Emacs support for Scope Safari project -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Environment Explorer

;; Author: Environment Explorer <scope@safari.example>
;; Version: 1.0.0
;; Package-Requires: ((emacs "27.1") (org "9.4") (lsp-mode "8.0.0") (projectile "2.5.0") (magit "3.3.0"))
;; Keywords: languages, tools
;; URL: https://github.com/aygp-dr/scope-safari

;;; Commentary:

;; This package provides Emacs support for the Scope Safari project,
;; which explores scope, environment, and closures across different
;; programming languages.
;;
;; Features:
;; - Org-mode Babel language support for all project languages
;; - LSP configuration for language servers
;; - Projectile integration
;; - Utilities for working with the project

;;; Code:

(require 'org)
(require 'ob)
(require 'lsp-mode)
(require 'projectile)
(require 'magit)

;;; Custom variables

(defgroup scope-safari nil
  "Customization group for Scope Safari project."
  :group 'tools
  :prefix "scope-safari-")

(defcustom scope-safari-root-dir nil
  "Root directory of the Scope Safari project."
  :type 'directory
  :group 'scope-safari)

(defcustom scope-safari-enable-lsp t
  "Whether to enable LSP for supported languages."
  :type 'boolean
  :group 'scope-safari)

;;; Path utilities

(defun scope-safari-root ()
  "Get the root directory of the Scope Safari project."
  (or scope-safari-root-dir
      (projectile-project-root)
      default-directory))

(defun scope-safari-path (path)
  "Expand PATH relative to the Scope Safari project root."
  (expand-file-name path (scope-safari-root)))

;;; Org-mode Babel integration

(defvar scope-safari-languages
  '((js . javascript)
    (python . python)
    (hy . hy)
    (elisp . emacs-lisp)
    (scheme . scheme)
    (clojure . clojure)
    (shell . sh))
  "Alist of languages used in Scope Safari with their Babel names.")

(defun scope-safari-setup-babel ()
  "Set up Org-mode Babel for all languages used in Scope Safari."
  (interactive)
  (dolist (lang scope-safari-languages)
    (let ((lang-name (cdr lang)))
      (add-to-list 'org-babel-load-languages (cons lang-name t))))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  
  ;; Enable syntax highlighting in org-mode code blocks
  (setq org-src-fontify-natively t)
  
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)
  
  ;; Display/update images when executing org blocks
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
  (add-hook 'org-mode-hook 'org-display-inline-images)
  
  ;; Fix tab behavior in code blocks
  (setq org-src-tab-acts-natively t)
  
  ;; Language-specific header arguments
  (setq org-babel-default-header-args:python
        '((:results . "output replace")
          (:session . "none")
          (:exports . "both")
          (:cache . "no")
          (:noweb . "yes")
          (:mkdirp . "yes")))
  
  (setq org-babel-default-header-args:js
        '((:results . "output replace")
          (:exports . "both")
          (:cache . "no")
          (:noweb . "yes")
          (:mkdirp . "yes")))
  
  (message "Org Babel configured for Scope Safari languages."))

;;; LSP integration

(defun scope-safari-setup-lsp ()
  "Set up LSP for all languages used in Scope Safari."
  (interactive)
  (when scope-safari-enable-lsp
    ;; JavaScript/TypeScript
    (add-hook 'js-mode-hook #'lsp)
    (add-hook 'typescript-mode-hook #'lsp)
    
    ;; Python
    (add-hook 'python-mode-hook #'lsp)
    
    ;; Clojure
    (add-hook 'clojure-mode-hook #'lsp)
    
    ;; Hy (Usually uses Python LSP)
    (add-hook 'hy-mode-hook #'lsp)
    
    ;; LSP UI customizations
    (setq lsp-headerline-breadcrumb-enable t)
    (setq lsp-modeline-diagnostics-enable t)
    (setq lsp-modeline-code-actions-enable t)
    
    (message "LSP configured for Scope Safari languages.")))

;;; Projectile integration

(defun scope-safari-setup-projectile ()
  "Set up Projectile for the Scope Safari project."
  (interactive)
  (projectile-add-known-project (scope-safari-root))
  
  ;; Custom commands
  (projectile-register-project-type 'scope-safari
                                   '("README.org" "Makefile" "com/example/truthmoji")
                                   :project-file "README.org"
                                   :compile "make"
                                   :test "make run-all"
                                   :run "make run-all"
                                   :test-suffix "_test")
  
  (message "Projectile configured for Scope Safari project."))

;;; Language-specific utilities

(defun scope-safari-run-language (lang)
  "Run the implementation for a specific language LANG."
  (interactive (list (completing-read "Language: "
                                     '("js" "py" "hy" "el" "scm" "clj")
                                     nil t)))
  (let ((default-directory (scope-safari-root)))
    (compile (format "make run-%s" lang))))

(defun scope-safari-run-all ()
  "Run all language implementations."
  (interactive)
  (let ((default-directory (scope-safari-root)))
    (compile "make run-all")))

(defun scope-safari-visit-implementation (lang)
  "Visit the implementation file for a specific language LANG."
  (interactive (list (completing-read "Language: "
                                     '("js" "py" "hy" "el" "scm" "clj")
                                     nil t)))
  (let* ((lang-file-alist '(("js" . "com/example/truthmoji/index.js")
                           ("py" . "com/example/truthmoji/__init__.py")
                           ("hy" . "com/example/truthmoji/truthmoji.hy")
                           ("el" . "com/example/truthmoji/truthmoji.el")
                           ("scm" . "com/example/truthmoji/truthmoji.scm")
                           ("clj" . "com/example/truthmoji.clj")))
         (file-path (cdr (assoc lang lang-file-alist))))
    (when file-path
      (find-file (scope-safari-path file-path)))))

;;; Keybindings and mode definition

(defvar scope-safari-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c s r") 'scope-safari-run-all)
    (define-key map (kbd "C-c s l") 'scope-safari-run-language)
    (define-key map (kbd "C-c s v") 'scope-safari-visit-implementation)
    (define-key map (kbd "C-c s b") 'scope-safari-setup-babel)
    map)
  "Keymap for Scope Safari mode.")

;;;###autoload
(define-minor-mode scope-safari-mode
  "Minor mode for working with the Scope Safari project."
  :lighter " ScopeSafari"
  :keymap scope-safari-mode-map
  :global nil
  (if scope-safari-mode
      (progn
        (scope-safari-setup-babel)
        (scope-safari-setup-lsp)
        (scope-safari-setup-projectile))
    (message "Scope Safari mode disabled.")))

;;;###autoload
(defun scope-safari-setup ()
  "Set up Emacs for working with the Scope Safari project."
  (interactive)
  (scope-safari-mode 1)
  (message "Scope Safari environment initialized."))

;;; Org-mode helper for creating new examples

(defun scope-safari-insert-language-blocks ()
  "Insert code blocks for all supported languages."
  (interactive)
  (let ((languages '(("JavaScript" . "js")
                    ("Python" . "python")
                    ("Hy" . "hy")
                    ("Emacs Lisp" . "emacs-lisp")
                    ("Guile Scheme" . "scheme")
                    ("Clojure" . "clojure"))))
    (dolist (lang languages)
      (insert (format "** %s Implementation\n" (car lang)))
      (insert (format "#+begin_src %s\n" (cdr lang)))
      (insert (format "# %s implementation of boolean-to-emoji converter\n\n" (car lang)))
      (insert "#+end_src\n\n"))))

;;; Dir-locals setup

;;;###autoload
(defun scope-safari-generate-dir-locals ()
  "Generate .dir-locals.el file for the project."
  (interactive)
  (let ((dir-locals-file (scope-safari-path ".dir-locals.el"))
        (content ";;; Directory Local Variables
;;; For more information see (info \"(emacs) Directory Variables\")

((nil . ((eval . (scope-safari-setup))))
 (org-mode . ((org-confirm-babel-evaluate . nil)
              (eval . (progn
                       (require 'ob-js)
                       (require 'ob-python)
                       (require 'ob-scheme)
                       (require 'ob-clojure)
                       (require 'ob-emacs-lisp)
                       (when (require 'ob-hy nil t)
                         (org-babel-do-load-languages 'org-babel-load-languages
                                                     (append org-babel-load-languages
                                                             '((hy . t))))))))))
"))
    (with-temp-file dir-locals-file
      (insert content))
    (message "Generated .dir-locals.el at %s" dir-locals-file)))

(provide 'scope-safari)

;;; scope-safari.el ends here