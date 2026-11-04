# Git 설정 및 커밋 로그

```text
PS E:\git_repo\Codyssey_Pre-Course_1-1> git config -l
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=schannel
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
user.email=3101junsang@gmail.com
user.name=3101junsang
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=https://github.com/junsang3101/Codyssey_Pre-Course_1-1.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
branch.main.vscode-merge-base=origin/main
(END)
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=https://github.com/junsang3101/Codyssey_Pre-Course_1-1.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
branch.main.vscode-merge-base=origin/main
PS E:\git_repo\Codyssey_Pre-Course_1-1> git branch 
* main
PS E:\git_repo\Codyssey_Pre-Course_1-1> echo "기본 브랜치밖에 없음" 
기본 브랜치밖에 없음
PS E:\git_repo\Codyssey_Pre-Course_1-1> git status 
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md
        modified:   compose.yaml
        deleted:    fa
        deleted:    "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/15-1. GitHub SSH \355\202\244 \354\204\244\354\240\225.png"

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/Docker \352\270\260\353\263\270 \354\240\220\352\262\200.log"
        "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/Docker \352\270\260\353\266\204 \354\232\264\354\230\201 \353\252\205\353\240\271 \354\210\230\355\226\211.log"
        "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/GitHub Deplay Keys \354\204\244\354\240\225 \355\231\224\353\251\264.png"
        "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/SSH \355\202\244 \354\203\235\354\204\261 \353\241\234\352\267\270.log"
        "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/\355\204\260\353\257\270\353\204\220 \354\241\260\354\236\221 \353\241\234\352\267\270 \352\270\260\353\241\235.log"

no changes added to commit (use "git add" and/or "git commit -a")
PS E:\git_repo\Codyssey_Pre-Course_1-1> git add .
PS E:\git_repo\Codyssey_Pre-Course_1-1> git commit -m "집에서 readme.md 수정/보완1"     
[main a53fab3] 집에서 readme.md 수정/보완1
 8 files changed, 297 insertions(+), 304 deletions(-)
 delete mode 100644 fa
 create mode 100644 "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/Docker \352\270\260\353\263\270 \354\240\220\352\262\200.log"
 create mode 100644 "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/Docker \352\270\260\353\266\204 \354\232\264\354\230\201 \353\252\205\353\240\271 \354\210\230\355\226\211.log"
 rename "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/15-1. GitHub SSH \355\202\244 \354\204\244\354\240\225.png" => "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/GitHub Deplay Keys \354\204\244\354\240\225 \355\231\224\353\251\264.png" (100%)
 create mode 100644 "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/SSH \355\202\244 \354\203\235\354\204\261 \353\241\234\352\267\270.log"
 create mode 100644 "\352\270\260\353\212\245 \354\232\224\352\265\254 \354\202\254\355\225\255 \354\246\235\353\271\231 \354\236\220\353\243\214/\355\204\260\353\257\270\353\204\220 \354\241\260\354\236\221 \353\241\234\352\267\270 \352\270\260\353\241\235.log"
PS E:\git_repo\Codyssey_Pre-Course_1-1> git push
remote: Invalid username or token. Password authentication is not supported for Git operations.
fatal: Authentication failed for 'https://github.com/junsang3101/Codyssey_Pre-Course_1-1.git/'
PS E:\git_repo\Codyssey_Pre-Course_1-1> git config user.name "junsang3101"
PS E:\git_repo\Codyssey_Pre-Course_1-1> git config --global user.name "junsang3101"
PS E:\git_repo\Codyssey_Pre-Course_1-1> git config --global user.email "3101junsang@gmail.com"
PS E:\git_repo\Codyssey_Pre-Course_1-1> git push
fatal: User cancelled dialog.
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 12 threads
Compressing objects: 100% (9/9), done.
Writing objects: 100% (9/9), 5.77 KiB | 1.15 MiB/s, done.
Total 9 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
remote: This repository moved. Please use the new location:
remote:   https://github.com/Junsang3101/Codyssey_Pre-Course_1-1.git
To https://github.com/junsang3101/Codyssey_Pre-Course_1-1.git
   bbbab17..a53fab3  main -> main
PS E:\git_repo\Codyssey_Pre-Course_1-1> 
```