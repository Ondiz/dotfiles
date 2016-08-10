;; Asignar los archivos .md al modo markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Activar Auto Fill en modo texto y modos relacionados

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Activar Flyspell en modo texto y modos relacionados

(add-hook 'text-mode-hook
  '(lambda () (flyspell-mode 1)))

;; Activar modo de autocompletar paréntesis
(electric-pair-mode 1)

;; Evitar pantalla de bienvenida
(setq inhibit-splash-screen t) 
