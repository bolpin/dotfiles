(add-to-list 'load-path "~/.emacs.d/evil-evil")
(require 'evil)
(evil-mode 1)

(setenv "PATH" (concat "/usr/local/smlnj-110.75/bin:" (getenv "PATH"))) 
(setq exec-path (cons "/usr/local/smlnj-110.75/bin" exec-path))


