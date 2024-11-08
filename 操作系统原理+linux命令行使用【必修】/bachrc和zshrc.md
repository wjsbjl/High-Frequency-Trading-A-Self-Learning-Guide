- 使用情景
	- 配置文件和shell配置的问题不仅仅是macOS独有的。几乎所有Unix和类Unix系统（包括Linux发行版）都会遇到类似的配置文件问题，因为它们都依赖于shell来管理用户的环境和命令执行。
	- 从macOS 10.15 Catalina开始，默认shell从bash切换到了zsh
	- 尽管默认shell是zsh，macOS仍然提供了bash，并且你可以在终端中手动切换到bash，使用命令bash来启动一个新的bash shell会话。
- zshrc是Z shell (zsh)配置文件，rc表示resource configuration。zsh是macOS默认的shell，每次开新的zsh进程时都会开，经常用来存环境变量
- 合理组织配置文件的建议
	1.	明确区分不同shell的配置文件：
	- 确保bash相关的配置（如别名和特性）放在~/.bashrc中，而zsh相关的配置放在~/.zshrc中。
	2.	使用通用文件进行共享设置：
	- 对于所有shell通用的设置（如环境变量），可以放在~/.profile或一个单独的文件中，并在各自的shell配置文件中调用。
- 建议是`~/.profile`写通用内容，`~/.bashrc`配置bash shell，`~/.zshrc`配置zsh shell，这俩都是启东时运行，`~/.bash_profile`类似`~/.profile`，是登录bash的配置文件

[[linux中的基本命令]]