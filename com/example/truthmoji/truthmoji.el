;;; truthmoji.el --- Boolean to emoji converter -*- lexical-binding: t; -*-

;;; Commentary:
;; Demonstrates environment inspection in Elisp

;;; Code:

(require 'json)

;; Step 1: Capture Elisp environment
(defun truthmoji--capture-environment (label)
  "Capture current Elisp environment state."
  (let ((env (make-hash-table :test 'equal)))
    (puthash "label" label env)
    (puthash "timestamp" (format-time-string "%Y-%m-%dT%H:%M:%S") env)
    (puthash "lexical-binding" lexical-binding env)
    (puthash "load-path-length" (length load-path) env)
    (puthash "features-count" (length features) env)
    (puthash "obarray-count" 
             (let ((count 0))
               (mapatoms (lambda (_) (setq count (1+ count))))
               count)
             env)
    (puthash "buffer-count" (length (buffer-list)) env)
    env))

;; Save environment to file
(defun truthmoji--save-environment (env filename)
  "Save ENV hash table to FILENAME as JSON."
  (with-temp-file (expand-file-name (concat filename ".json") 
                                    (file-name-directory load-file-name))
    (insert (json-encode env))))

;; Step 1: Initial environment
(defvar truthmoji--env-1 (truthmoji--capture-environment "initial"))
(truthmoji--save-environment truthmoji--env-1 "env-1-elisp-initial")

;; Step 2: Create application state
(defvar truthmoji-app-state '((name . "TruthMoji App")
                              (version . "1.0.0") 
                              (users . 0))
  "Application state.")

(defvar truthmoji--private-counter 0
  "Private counter demonstrating closure.")

(defun truthmoji--make-counter ()
  "Create a counter using lexical closure."
  (let ((count 0))
    (lambda (&optional increment)
      (if increment
          (setq count (1+ count))
        count))))

(defvar truthmoji--app-counter (truthmoji--make-counter))

;; Step 3: After app creation
(defvar truthmoji--env-2 (truthmoji--capture-environment "after-app"))
(truthmoji--save-environment truthmoji--env-2 "env-2-elisp-after-app")

;; Step 4: The truthmoji module
(defconst truthmoji--emoji-true "😊"
  "Emoji for true.")

(defconst truthmoji--emoji-false "😔"
  "Emoji for false.")

(defvar truthmoji--usage-count 0
  "Usage counter.")

(defun truthmoji-emojify (bool)
  "Convert BOOL to emoji string."
  (setq truthmoji--usage-count (1+ truthmoji--usage-count))
  (if bool truthmoji--emoji-true truthmoji--emoji-false))

(defun truthmoji-get-usage ()
  "Get usage count."
  truthmoji--usage-count)

(defun truthmoji-inspect ()
  "Inspect module internals."
  (list :usage-count truthmoji--usage-count
        :emoji-true truthmoji--emoji-true
        :emoji-false truthmoji--emoji-false
        :lexical-binding lexical-binding))

;; Step 5: Final environment
(defvar truthmoji--env-3 (truthmoji--capture-environment "after-truthmoji"))
(truthmoji--save-environment truthmoji--env-3 "env-3-elisp-after-truthmoji")

;; Demo and comparison
(defun truthmoji-demo ()
  "Interactive demo."
  (interactive)
  (message "=== Environment Changes ===")
  (message "Initial obarray: %s symbols" 
           (gethash "obarray-count" truthmoji--env-1))
  (message "After truthmoji: %s symbols" 
           (gethash "obarray-count" truthmoji--env-3))
  (message "\n=== TruthMoji Demo ===")
  (message "t → %s" (truthmoji-emojify t))
  (message "nil → %s" (truthmoji-emojify nil))
  (message "Usage: %d" (truthmoji-get-usage)))

(provide 'truthmoji)
;;; truthmoji.el ends here

;;; truthmoji.el --- Boolean to emoji converter -*- lexical-binding: t; -*-

;;; Commentary:
;; Demonstrates environment inspection in Elisp

;;; Code:

(require 'json)

;; Step 1: Capture Elisp environment
(defun truthmoji--capture-environment (label)
  "Capture current Elisp environment state."
  (let ((env (make-hash-table :test 'equal)))
    (puthash "label" label env)
    (puthash "timestamp" (format-time-string "%Y-%m-%dT%H:%M:%S") env)
    (puthash "lexical-binding" lexical-binding env)
    (puthash "load-path-length" (length load-path) env)
    (puthash "features-count" (length features) env)
    (puthash "obarray-count" 
             (let ((count 0))
               (mapatoms (lambda (_) (setq count (1+ count))))
               count)
             env)
    (puthash "buffer-count" (length (buffer-list)) env)
    env))

;; Save environment to file
(defun truthmoji--save-environment (env filename)
  "Save ENV hash table to FILENAME as JSON."
  (with-temp-file (expand-file-name (concat filename ".json") 
                                    (file-name-directory load-file-name))
    (insert (json-encode env))))

;; Step 1: Initial environment
(defvar truthmoji--env-1 (truthmoji--capture-environment "initial"))
(truthmoji--save-environment truthmoji--env-1 "env-1-elisp-initial")

;; Step 2: Create application state
(defvar truthmoji-app-state '((name . "TruthMoji App")
                              (version . "1.0.0") 
                              (users . 0))
  "Application state.")

(defvar truthmoji--private-counter 0
  "Private counter demonstrating closure.")

(defun truthmoji--make-counter ()
  "Create a counter using lexical closure."
  (let ((count 0))
    (lambda (&optional increment)
      (if increment
          (setq count (1+ count))
        count))))

(defvar truthmoji--app-counter (truthmoji--make-counter))

;; Step 3: After app creation
(defvar truthmoji--env-2 (truthmoji--capture-environment "after-app"))
(truthmoji--save-environment truthmoji--env-2 "env-2-elisp-after-app")

;; Step 4: The truthmoji module
(defconst truthmoji--emoji-true "😊"
  "Emoji for true.")

(defconst truthmoji--emoji-false "😔"
  "Emoji for false.")

(defvar truthmoji--usage-count 0
  "Usage counter.")

(defun truthmoji-emojify (bool)
  "Convert BOOL to emoji string."
  (setq truthmoji--usage-count (1+ truthmoji--usage-count))
  (if bool truthmoji--emoji-true truthmoji--emoji-false))

(defun truthmoji-get-usage ()
  "Get usage count."
  truthmoji--usage-count)

(defun truthmoji-inspect ()
  "Inspect module internals."
  (list :usage-count truthmoji--usage-count
        :emoji-true truthmoji--emoji-true
        :emoji-false truthmoji--emoji-false
        :lexical-binding lexical-binding))

;; Step 5: Final environment
(defvar truthmoji--env-3 (truthmoji--capture-environment "after-truthmoji"))
(truthmoji--save-environment truthmoji--env-3 "env-3-elisp-after-truthmoji")

;; Demo and comparison
(defun truthmoji-demo ()
  "Interactive demo."
  (interactive)
  (message "=== Environment Changes ===")
  (message "Initial obarray: %s symbols" 
           (gethash "obarray-count" truthmoji--env-1))
  (message "After truthmoji: %s symbols" 
           (gethash "obarray-count" truthmoji--env-3))
  (message "\n=== TruthMoji Demo ===")
  (message "t → %s" (truthmoji-emojify t))
  (message "nil → %s" (truthmoji-emojify nil))
  (message "Usage: %d" (truthmoji-get-usage)))

(provide 'truthmoji)
;;; truthmoji.el ends here
