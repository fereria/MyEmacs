# Emacs Setting

私のEmacsの設定 elです。  
Emacsの使用バージョンは　GNU Emacs 24.5.1 (x86_64-pc-mingw32) (https://github.com/chuntaro/NTEmacs64)
基本日本語を使う前提として設定しています。(04-ime.elで設定)  
主にMayaのスクリプト開発、Pythonを使用した単独ツールの作成をしています。  

init-loader(https://github.com/emacs-jp/init-loader) を使用して、設定を個別elにして管理しています。  
インストールは、基本 elpa を使用しています。  
elpaにはないもの（init-loaderやetom.el等）は、site-lispフォルダに入れています。
  
※ elに書いてあるけど、使用していないものも結構あります  
 
## フォルダ構成
 
* emacs.d
  * init.el 最初に読まれるファイル
  * inits init-loaderの読み先
  * site-lisp elpa以外に使用したい .elファイル
  * snippets yasnippetのファイル置き場
  * insert 初期テンプレート置き場
 

## 使用している主なel

###etom.el https://www.emacswiki.org/emacs/etom.el
Emacs上からMayaのコマンドを実行できるようにするelです。  

###elpy
Pythonの開発に必要なモノをほぼカバーしてくれるelです。  
###autopep8
コードを自動でpep8準拠に修正してくれます。  
これがないとまともにコードが書けません。  
###magit/yagist/igt-gutter+
Gitを使用するためのelです。  
###helm
説明不要のいろいろ絞り込みel。
helmのなかでも使用頻度が高いのが

* helm-buffers
* helm-ag
* helm i-menu
* helm-bookmarks
* helm-swoop

このへんはないと死にます。

###anzu
置換、通常のだと使いにくいので必須です。

####expand-region

リージョンを拡大・縮小してくれます。  

###yasnippets
よく使うコマンドを登録して置きかえしてくれます。  
