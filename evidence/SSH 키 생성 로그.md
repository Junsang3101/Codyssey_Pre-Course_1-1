# SSH 키 생성 로그

```powershell
PS C:\Users\컴퓨터정보학과 10616호> ssh-keygen -t ed25519 -C "3101junsang@gmail.com"
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\컴퓨터정보학과 10616호/.ssh/id_ed25519): testkey
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in testkey
Your public key has been saved in testkey.pub
The key fingerprint is:
SHA256:+BWml+ajhyupmssU4qU/72vQs83hVgdH4L5fbRopZ24 3101junsang@gmail.com
The key's randomart image is:
+--[ED25519 256]--+
|         ..      |
|        .  .     |
|         .+      |
|       ..+ +     |
|. ... . S.B      |
|..oo o o *..  o  |
| o. . *.+o+. * o |
| o.o oo=..o.*E+  |
|  =+*=o.oo ..o   |
+----[SHA256]-----+
PS C:\Users\컴퓨터정보학과 10616호> get-content .\testkey.pub | set-clipboard
```

```powershell
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote set-url origin git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git remote -v
origin  git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git (fetch)
origin  git@github.com:junsang3101/Codyssey_Pre-Course_1-1.git (push)
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1> git push
The authenticity of host 'github.com (20.200.245.247)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Enter passphrase for key '/c/Users/User/.ssh/id_ed25519':
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 8 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 177.19 KiB | 1.05 MiB/s, done.
Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), done.
To github.com:junsang3101/Codyssey_Pre-Course_1-1.git
   82bf624..d851285  main -> main
PS C:\Users\User\Documents\Junsang3101\Codyssey_Pre-Course_1-1>