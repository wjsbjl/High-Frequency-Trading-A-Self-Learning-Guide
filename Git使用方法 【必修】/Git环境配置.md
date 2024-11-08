基础设置
```
git config --global user.email "your_email@example.com"
git config --global user.name "username"
```
check if you already have an SSH key generated on your system
```
ls -al ~/.ssh
ssh -T git@github.com
```
If you don't have an SSH key, you can generate one:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Start the SSH agent:
```
eval "$(ssh-agent -s)"
```
Add your SSH private key to the agent:  
```
ssh-add ~/.ssh/id_rsa
```
Copy the contents of your public key to the clipboard:
```
cat ~/.ssh/id_rsa.pub
```
find ssh in settings of github and add key to it
test the connection
```
ssh -T git@github.com
```
