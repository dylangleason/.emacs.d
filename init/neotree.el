;;;; File: neotree.el
;;;; neotree configuration for file/director browsing

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(require 'neotree)
(global-set-key "\C-cn" 'neotree-toggle)

(when (not (display-graphic-p))
  (set-face-foreground neo-file-link-face "white"))
