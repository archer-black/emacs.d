;;; init-local.el --- archer's -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; theme
(light)

;; org
(setq org-agenda-files'("~/org/working"))


;; key
(when *is-a-mac*
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

;; hot key
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-F") 'projectile-ag)
(global-set-key (kbd "s-f") 'swiper-thing-at-point)



;;  wechat miniprogram
(add-auto-mode 'html-mode "\\.\\(wxml\\)\\'")
(add-auto-mode 'css-mode "\\.\\(wxss\\)\\'")


;; yasnippet
(maybe-require-package 'yasnippet)
(maybe-require-package 'yasnippet-snippets)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;; js
(maybe-require-package 'flycheck)
(maybe-require-package 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  ;; (define-key tide-mode-map (kbd "M-?") 'tide-references)
  )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)



;; lsp
;; (require-package 'lsp-mode)
;; (maybe-require-package 'lsp-ui)
;; (maybe-require-package 'flycheck)
;; (maybe-require-package 'company)
;; (maybe-require-package 'lsp-treemacs)
;; (maybe-require-package 'lsp-ivy)
;; (maybe-require-package 'dap-mode)
;; (maybe-require-package 'lsp-java)
;; (add-hook 'prog-mode-hook #'lsp-deferred)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2


(provide 'init-local)
;;; init-local.el ends here
