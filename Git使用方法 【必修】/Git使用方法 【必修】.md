- **书籍**:
	- ✅ [[Git讲义.pdf]]
	- 《Pro Git》 by Scott Chacon and Ben Straub
- **在线资源**:
	- [Git官方文档](https://git-scm.com/doc)
	- [Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials)
[[Git环境配置]]

常用命令
```git
git fetch
git checkout -b localmaster
git add .
git status
git commit -m
git push
```

## 关于Line Endings
Git is detecting line endings (`LF` for Linux/Unix-style line endings) in your files that are set to be converted to `CRLF` (Windows-style line endings) the next time you check them out. This happens due to Git’s line-ending conversion settings and is common on Windows systems where the default line-ending style is `CRLF`.

Here’s how to resolve or manage this warning:

### Solution 1: Set the Line Endings Globally for the Repository

1. **Option 1: Always Use LF (Unix-style) Line Endings**
    
    - If you want to keep `LF` line endings (no conversion), set Git to ignore conversions:
        
        bash
        
        复制代码
        
        `git config --global core.autocrlf false`
        
    - This will stop Git from converting `LF` to `CRLF` and vice versa. It’s best if you’re working with cross-platform projects where `LF` is preferable.
2. **Option 2: Automatically Convert Line Endings Based on OS**
    
    - If you want Git to automatically handle line endings based on the operating system, use:
        
        bash
        
        复制代码
        
        `git config --global core.autocrlf true`
        
    - This setting converts `LF` to `CRLF` on Windows while keeping `LF` on Linux/macOS. It works well if collaborators are on different systems and ensures that files have consistent line endings across platforms.