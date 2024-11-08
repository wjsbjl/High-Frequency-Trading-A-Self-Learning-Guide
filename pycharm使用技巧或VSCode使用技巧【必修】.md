## 资源
- **书籍**:
	- 《PyCharm快速入门与实战》 by 李志强
- **在线资源**:
	- [PyCharm Documentation](https://www.jetbrains.com/pycharm/documentation/)
	- [VSCode Documentation](https://code.visualstudio.com/docs)
## PyCharm
### 配置快捷键 keymap

- 方法论
    
    在 PyCharm 中修改快捷键的方法如下：
    
    1. 打开 PyCharm 软件，在菜单栏中选择“Preferences”（或者 Windows 下的“Settings”）。
    2. 在弹出的设置窗口中，选择“Keymap”选项。
    3. 在“Keymap”选项中，可以看到 PyCharm 中现有的所有快捷键，以及对应的功能。如果想要修改某个快捷键，可以直接双击该快捷键，然后输入新的快捷键即可。
    4. 如果想要恢复默认的快捷键，可以右键点击该快捷键，然后选择“Reset”，即可恢复默认快捷键。
    
    注意：修改快捷键可能会导致某些功能无法正常使用，请谨慎操作。
    
![[PyCharm常用快捷键.png|100]]
    
- 具体设置
    
    Execute Selection in Python Console
    

### 常用快捷键

|opt+enter|preview the warnings and apply a quick fix 可以解决一些报错问题|
|---|---|
|shift + shift|开启搜索框|
|opt+上|选中附近的代码|
|cmd+B|Navigate to declaration|
|cmd+Fn+F8|断点|
|ctrl+shift+r|运行|
|ctrl+shift+d|Debug|
|opt+cmd+t|提示|
|F7|step into|
|opt+shift+F7|step into my code|
|cmd+,|settings|
|shift+cmd+t|test模式|
|ctrl+shift+e|逐行运行，可以通过快捷键右边按这几个键来搜对应英文|
|||
|⌘ B|(Navigate|
|1. reveal in finfer||

2. rename
3. 运行和debug | | | cmd+shift+W restart kernel | 重启kernel |
## VSCode
### VSCode 快捷键
cmd+shift+P，输入keyboard，进入Open Keyboard Shortcuts (json)
{
        "key": "cmd+enter",
        "command": "editor.debug.action.selectionToRepl",
        "when": "!notebookEditorFocused"
    },

### VSCode 配置C++
https://zhuanlan.zhihu.com/p/48233069
#### settings.json
```json
{

"tabnine.experimentalAutoImports": true,

"[python]": {

"editor.formatOnType": true

},

"terminal.integrated.env.osx": {

"PYTHONPATH": "/Users/zyz/Library/CloudStorage/OneDrive-uibe.edu.cn/YZquant/dev/wjsbjl"

}, // 添加环境变量

"editor.inlineSuggest.enabled": true,

"workbench.colorTheme": "Visual Studio Dark",

"terminal.integrated.inheritEnv": false,

"notebook.output.textLineLimit": 100,

"macros": {

"pythonExecSelectionAndCursorDown": [

"python.execSelectionInTerminal",

"cursorDown"

]

},

"multiCommand.commands": [

{

"command": "multiCommand.runCellInPythonTerminal",

"label": "Run cell in python terminal",

"sequence": [

"jupyter.selectCellContents",

"python.execSelectionInTerminal",

"cursorDown"

]

}

],

"diffEditor.wordWrap": "on",

"jupyter.askForKernelRestart": false,

"github.copilot.enable": {

"*": false,

"plaintext": false,

"markdown": false,

"scminput": false

},

"editor.largeFileOptimizations": false,

"python.terminal.activateEnvironment": false,

"python.defaultInterpreterPath": "/Users/zyz/miniconda3/bin/python",

"terminal.integrated.env.linux": {

"PYTHONPATH": "/Users/zyz/Library/CloudStorage/OneDrive-uibe.edu.cn/YZquant/dev/wjsbjl"

},

"notebook.lineNumbers": "on",

"security.workspace.trust.untrustedFiles": "open",

"explorer.confirmDelete": false,

"todo-tree.regex.regex": "(//|#|<!--|;|/\\*|^|^\\s*(-|\\d+.))\\s*($TAGS)",

"todo-tree.general.tags": [

"BUG",

"HACK",

"FIXME",

"TODO",

"XXX",

"[ ]",

"[x]",

"MARK"

],

"workbench.colorCustomizations": {//深色

"editor.background": "#000000",

"editorGroupHeader.tabsBackground": "#000000",

"statusBar.border": "#000000", // 最底部

"statusBar.background": "#000000",

"terminal.border": "#000000",

"terminal.background": "#000000",

  

"panel.border": "#333333", // 终端上方

"panel.background": "#000000",

  

"sideBar.border": "#333333", // 左侧

"sideBarSectionHeader.background": "#000000",

"sideBarSectionHeader.border": "#333333",

"sideBar.background": "#000000",

"tab.border": "#333333", // 上侧

"tab.inactiveBackground": "#000000",

"tab.activeBackground": "#000000",

"tab.": "#ff0000",

  

"activityBar.background": "#000000", // 最左侧

"activityBar.border": "#333333",

  

"titleBar.activeBackground": "#000000" // 最顶部

  

},

"C_Cpp.default.compilerPath": "/usr/bin/clang",

"cmake.configureOnOpen": true,

}
```
#### launch.json
```json
{

// 使用 IntelliSense 了解相关属性。

// 悬停以查看现有属性的描述。

// 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387

"version": "0.2.0",

"configurations": [

{

"name": "c/c++ Launch",

"type": "cppdbg",

"request": "launch",

"program": "${workspaceFolder}/a.out",

"args": [],

"stopAtEntry": false,

"cwd": "${workspaceFolder}",

"environment": [],

"externalConsole": true,

"MIMode": "lldb",

"preLaunchTask":"c++"

}

]

}
```
#### tasks.json
```json
{

// See https://go.microsoft.com/fwlink/?LinkId=733558

// for the documentation about the tasks.json format

"version": "2.0.0",

"tasks": [

{

"label": "c++",

"command": "clang++",

"type": "shell",

"args": [

"${file}", // 使用当前打开的文件

// "./c++/hello.cpp",

"-std=c++11",

"-g"

],

"presentation": {

"echo": true,

"reveal": "always",

"focus": false,

"panel": "shared"

}

},

{

"type": "cppbuild",

"label": "C/C++: clang 生成活动文件",

"command": "/usr/bin/clang",

"args": [

"-fcolor-diagnostics",

"-fansi-escape-codes",

"-g",

"${file}",

"-o",

"${fileDirname}/${fileBasenameNoExtension}"

],

"options": {

"cwd": "${fileDirname}"

},

"problemMatcher": [

"$gcc"

],

"group": "build",

"detail": "编译器: /usr/bin/clang"

}

]

}
```


### VSCode debug file
```
{

// 使用 IntelliSense 了解相关属性。

// 悬停以查看现有属性的描述。

// 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387

"version": "0.2.0",

"configurations": [

{

"name": "Python: 当前文件",

"type": "python",

"request": "launch",

"program": "${file}",

"console": "internalConsole",

"justMyCode": true

}

]

}
```