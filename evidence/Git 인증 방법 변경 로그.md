# Git 인증 방법 변경 로그

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  https://github.com/Junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  https://github.com/Junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote set-url origin git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git add .
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git commit -m "보너스 과제 1, 5 번 진행"
[main 097ddbf] 보너스 과제 1, 5 번 진행
 1 file changed, 24 insertions(+), 13 deletions(-)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git push
Enter passphrase for key '/c/Users/User/.ssh/id_ed25519':
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 731 bytes | 731.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), done.
remote: This repository moved. Please use the new location:
remote:   git@github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
To github.com:Junsang3101/Codyssey_Pre-Course_1-1.git
   47a4d94..097ddbf  main -> main
```