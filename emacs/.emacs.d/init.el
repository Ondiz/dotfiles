;; Añadir path
(add-to-list 'load-path "~/.emacs.d/extra")

;; Asignar los archivos .md al modo markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Asignar los archivos .latex al modo LaTex
(add-to-list 'auto-mode-alist '("\\.latex\\'" . LaTeX-mode))

;; Activar Auto Fill en modo texto y modos relacionados
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Activar Flyspell en modo texto y modos relacionados
(add-hook 'text-mode-hook
  '(lambda () (flyspell-mode 1)))

;; Activar modo de autocompletar paréntesis
(electric-pair-mode 1)

;; Evitar pantalla de bienvenida
(setq inhibit-splash-screen t) 

;; Codificación UTF-8 por defecto
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Tildes
(require 'iso-transl)

;; Aspell

(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "castellano8")

;; Activar Flyspell en modo texto y modos relacionados
(add-hook 'text-mode-hook
  '(lambda () (flyspell-mode 1)))

; Escribir en mayúscula después de punto
(autoload 'auto-capitalize-mode "auto-capitalize"
  "Toggle `auto-capitalize' minor mode in this buffer." t)
(autoload 'turn-on-auto-capitalize-mode "auto-capitalize"
  "Turn on `auto-capitalize' minor mode in this buffer." t)
(autoload 'enable-auto-capitalize-mode "auto-capitalize"
  "Enable `auto-capitalize' minor mode in this buffer." t)
(add-hook 'text-mode-hook 'turn-on-auto-capitalize-mode)
(setq auto-capitalize-words '("Ondiz")) ;; palabras que se vuelven mayúsculas por defecto

;; Barra de ancho
(require 'fill-column-indicator) 
(add-hook 'markdown-mode-hook 'fci-mode)

;; Definir keybindings
;; Compilar
(global-set-key "\C-cm" 'compile)

;; Recompilar
(global-set-key "\C-cr" 'recompile)

