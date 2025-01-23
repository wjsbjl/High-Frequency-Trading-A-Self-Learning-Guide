- C中void main，C++中是int main，可以理解为return的是错误个数，0正常结束
- `Java`的编译：`.class`，编译完后可以在任何系统上运行（似乎是tool kit那一套有点忘了）；`C++`的编译：在编译的系统上
- 面向对象：`Java`是object oriented；`C++`是函数，main不在公共类里
- HotKeys
	- **CTRL+R** will compile and **r**un your project.
	- **CTRL+I** will fix up the **i**ndentation of any code you have selected/highlighted.
- **Syntax vs. Semantics**
	- **syntax:** the rules for constructing grammatical statements in a language (whether a coding language or a [natural language](https://ninjawords.com/natural%20language))
	- **semantics:** meaning
	- _Why is this relevant?_ As I introduce you to different things you can do with the C++ programming language, I will generally introduce you to the _syntax_ you have to follow (i.e., how to write lines of code that the compiler will be happy with) and the associated _semantics_ (i.e., what that syntax _does_ or _means_).
- 备注的使用
	- 语法：`/* */`, `//`
	- 用法：说一大块代码的目的是什么（代入很多年后读现在代码的角度）；说how和why而不是whatwhat；尽量使用动词短语
- `#include`
	- 可能内置库<>可能自己库""
	- including standard system libraries:`#include < LIBRARY_NAME >`
	- including user-defined libraries: `#include "LIBRARY_NAME" `
	- [[常见的library]]
- `using namespace std`
	- 无声明，`std::cout`
	- 先声明`using namespace std`，然后`cout`
	- `cout`是stream，通过`<<`接受要输出的内容，c是console，<<可以看作吃豆人；`endl`创立新行，end of the line；`cin`不会对输入的内容进行检查来看，tt
- 定义函数
	```C++
	DATA_TYPE FUNCTION_NAME ( PARAMETERS )  
	{  
	   STATEMENT(S)   
	}
	```
- The `main()` Function
	- 数学上的函数把输入映射到输出，C++中的函数同理，但需要申明输入和输出数据的类型
	- 程序自动从`main()`函数开始运行，没有`main()`无法编译
	- 需要return 0，表示正常退出，可以理解为遇到0个错误。11