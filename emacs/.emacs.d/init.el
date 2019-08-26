;; Añadir path
(add-to-list 'load-path "~/.emacs.d/extra")

;; Paquetes
(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("08f5da7e1f5064a2917af94f0dab946adfb25665b25450168ded749ec78a1145" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(package-selected-packages
   (quote
    (ess pdf-tools org-bullets magit latex-extra julia-mode haskell-mode flycheck company-auctex cdlatex avk-emacs-themes))))
(package-initialize)

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

;; Aspecto
;; -------

;; Tema (paquete avk-emacs-themes en Melpa)
(load-theme 'avk-daylight)

;; Barra de ancho
(require 'fill-column-indicator) 
(add-hook 'markdown-mode-hook 'fci-mode)

;; Fuente
(if (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :family "Consolas" :height 110)
    (set-face-attribute 'default nil :family "Roboto Mono" :height 110)
)

;; Keybindings
;; -----------

;; Compilar
(global-set-key "\C-cm" 'compile)

;; Recompilar
(global-set-key "\C-cr" 'recompile)

;; Magit status
(global-set-key (kbd "C-x g") 'magit-status)

;; Modo haskell
;; https://github.com/haskell/haskell-mode

;; Activar flycheck siempre
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; Archivos de autoguardado en carpeta temporal
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Desactivar VC
(setq vc-handled-backends nil)

;; Personalización de AUCTeX
;; -------------------------

;; Activar CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
;; Activar prettify
(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
 
;; Autocompletar
(add-hook 'LaTeX-mode-hook (lambda ()(company-mode 1)))
(company-auctex-init)
 
;; Pide archivo maestro, para documentos con subdocumentos
(setq-default TeX-master nil)
 
;; Parser automático
(setq TeX-parse-self t) ; activar el parser al cargar
(setq TeX-auto-save t) ; activar el parser al guardar
 
;; Fold por defecto
(add-hook 'LaTeX-mode-hook (lambda ()(TeX-fold-mode 1)))
 
;; Activar RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
 
;; LaTeX extra para tener doblado de secciones como Org
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

;; Personalización de org mode
;; ---------------------------

;; Indented mode
(setq org-startup-indented t)

;; Marcar fecha de tarea realizada
(setq org-log-done 'time)

;; Palabras clave
(setq org-todo-keywords
       '((sequence "TODO" "CHECK" "|" "DONE" "CANCELLED")))

;; Cambiar color de palabras clave
(setq org-todo-keyword-faces
      '(
        ("TODO"  . (:foreground "firebrick2" :weight bold))
        ("CHECK"  . (:foreground "orange1" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("CANCELLED"  . shadow)
	))

;; Ruta a ditaa y plantuml
(setq org-ditaa-jar-path (expand-file-name "ditaa0_9.jar" "~/.emacs.d/extra")) 
(setq org-plantuml-jar-path (expand-file-name "plantuml.jar" "~/.emacs.d/extra"))

;; Activar lenguajes

;; Código Julia en Org
(setq inferior-julia-program-name "julia")
(require 'ob-julia)

(org-babel-do-load-languages
  (quote org-babel-load-languages)
  (quote (
	  (emacs-lisp . t)
	  (calc . t)
	  (ditaa . t)
	  (plantuml . t)
	  (julia . t)
	  )))

;; Redimensionar si hay atributo, si no dejar tamaño original
;; #+ATTR_X: :width [%] / X = [ORG, HTML, LATEX]
(setq org-image-actual-width nil)

;; Mostrar imagen tras crearla en bloque de código
(add-hook 'org-babel-after-execute-hook
	  'org-display-inline-images 'append)

;; Activar soporte para ratón
(require 'org-mouse)

;; Xelatex
(setq org-latex-pdf-process 
      '("xelatex -interaction nonstopmode %f"
	"xelatex -interaction nonstopmode %f"))

;; Activar CDLaTeX con Org mode
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; Paquetes de LaTeX
(setq org-latex-default-packages-alist
	     '((""    "fontspec"  t)
	       (""    "polyglossia" t)
	       (""    "graphicx"  t)
	       (""    "amsmath"   t)
	       (""    "amssymb"   t)
	       (""    "amsfonts"  t)
	       (""    "listings"  t) ;; TODO: change to UTF8 supporting
	       (""    "microtype" t)
	       ("usenames,dvipsnames,svgnames,table"    "xcolor"    t)
	       (""    "longtable" t)
	       (""    "float"     t)
	       (""    "rotating"  t)
	       (""    "parskip"   t)
	       (""    "hyperref"  t)))

;; Bloques de código
;; Sintaxis resaltada
(setq org-src-fontify-natively t)
;; Tabs en bloque de código
(setq org-src-tab-acts-natively t)

;; Org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
