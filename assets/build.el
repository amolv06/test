(message "\n==== Setup package repos ====")
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(message "\n==== Installing depedencies ====")
(package-install 'ox-hugo)
(require 'org-id)
(require 'ox-hugo)

(setq site-name (getenv "siteName"))
(message (format "site-name is: %s" site-name))
(setq default-directory (format "%s%s/content-org/"
				(file-name-parent-directory default-directory)
				site-name))
(dolist (file (cddr (directory-files ".")))
  (with-current-buffer (find-file file)
    (org-hugo-export-wim-to-md)))

    
