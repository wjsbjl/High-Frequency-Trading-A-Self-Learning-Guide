- `javac HelloWord.java`, javac是JDK提供的编译工具，我们可以通过这个工具，把java文件编译成class文件
- `java HelloWord` java也是JDK提供的一个工具，用来运行代码

语言的运行方式
- 编程
- 编译
	- 编译型：C/C++，用Arm（手机）或X86（电脑）平台编译成二进制机器指令，产生xx.obj
	- 解释型：Python，相比编译型的整体编译，Python是逐行编译，所以相当于开源；也分arm平台和x86平台；不产生新文件
	- 混合型：Java，编译成.class字节码文件，按行交给设备在虚拟机运行，这个虚拟机也是Java可以跨平台的原因
- 运行

JDK和JRE
- Java开发工具包 JDK Java Development Kit 
	- JAVA虚拟机，JVM Java Virtual Machine，运行代码的地方
	- 核心类库
	- 开发工具：javac编译工具，java运行工具，jdb调试工具，jhat内存分析工具
- JRE Java Runtime Environment
	- JDK减去开发工具中的javac和jdb，保留运行工具、JVM和核心类库

注释：单行`//`, 多行`/* */`, 文档`/** */`（在文档开头，对类的注释）