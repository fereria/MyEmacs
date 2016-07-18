;;(setq load-path (cons "~/.emacs.d/org2blog/" load-path))
(require 'org2blog-autoloads)

(require 'metaweblog)
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)
(require 'htmlize)

(setq org2blog/wp-use-sourcecode-shortcode t)
(setq org-src-preserve-indentation t)
(setq org2blog/wp-sourcecode-default-params "light=false")
(setq org-src-fontify-natively t)


(setq org2blog/wp-blog-alist 
       '(("wordpress" 
          :url "<blog-URL>"  ;;xmlrcp.phpのURL
          :username "<blog-username>"  
          :password "<blog-password>" 
          :default-title "MEMO" ;; デフォルトタイトル
          :default-categories ("MEMO") ;;カテゴリを指定 
          :tags-as-categories nil))) ;; タグを指定
