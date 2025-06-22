;;; Directory Local Variables
;;; For more information see (info \"(emacs) Directory Variables\")

((nil . ((eval . (when (require 'scope-safari nil t)
                   (scope-safari-setup)))))
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