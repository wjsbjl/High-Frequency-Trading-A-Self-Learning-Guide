Defining Functions
``` C++
type name(type name, type name, ..., type name){
	statement;
	...
	statement;
	return EXPRESSION; // 返回的语法
}
```
Void Functions
- 没有return
- 如果想提前退出，`return;`

关于函数定义的顺序
- Java中顺序不重要，C++重要
- 如果想后定义函数需要进行函数声明`function prototype`，例如`void makeFun()`，在一开始声明，这是因为静态类型（编译源码时需要知道函数的声明信息）+编译时解析，和Python的动态类型不一样。函数的定义见上面代码框
- p.s. Java面向对象，所有代码都在类class里，先编译成字节码`.class`，之后通过JVM（Java虚拟机）运行
- p.s. Python解释型语言，逐行解释
**functional prototype**
- A **functional prototype** is just a function signature with a semicolon: `int square(int x);`
- 这样就可以把函数放在`main()`后面，用于让`main()`知道函数的输入是什么
Variable scope
- 变量存续周期，这个黑马讲的也不错
**semantics**
- `value semantics` e.g. `int age`：传递参数的时候，传递的是存储在那里的值，而不是变量
- `reference semantics` e.g. `int& age`：传递的时候，传递的是变量进去，而不是值的copy，有风险
- p.s.1. 例如交换俩变量的值，不写&就不会发生实际交换
- p.s.2. 返回多个值的时候无法return，就可以提前定义好，然后用&的形式传进去

## 阅读笔记

**Variables and Data Types**
- C++需要定义每个变量的类型，主要有
- 变量的声明 variable declaration：`DATA_TYPE VARIABLE_NAME ;`
- **Uninitialized Variables**：In C++, variables are not auto-initialized for you. By default, if you don't assign a value to a variable, it contains garbage. (An exception here is string variables, which are empty by default.)
## 数据类型
| data type keyword | type description                    | example(s)                               |
| ----------------- | ----------------------------------- | ---------------------------------------- |
| int               | integer (whole number)              | -3, 0, 1, 1051                           |
| float             | floating point number (real number) | 3.14159                                  |
| double            | floating point number (real number) | 3.14159                                  |
| char              | character (single glyph)            | 'q', 'P', '$' (requires single quotes)   |
| string            | string of characters                | "Hello, world!" (requires double quotes) |
| bool              | Boolean                             | true, false (no quotes)                  |
## 控制语句
**While Loops**
```
while ( CONDITION )  
{  
   STATEMENT(S)   
}
```

**For Loops**
```
for ( INITIALIZATION_STATEMENT ; CONDITION ; POST_ITERATION_STATEMENT )  
{  
   STATEMENT(S)   
}
```
- 注意分号semicolon的使用

**For-Each Loops (Range-Based Loops)**
```
for ( DATA_TYPE  VARIABLE_NAME  : CONTAINER )  
{  
   STATEMENT(S)   
}
```
- e.g. `string s = "giraffe"; for(char ch : s){cout << ch << endl}`

**Conditional (If-Else) Statements and Comparison Operators**
```
if ( CONDITION )  
{  
   STATEMENT(S)   
}
else if (CONITION)
{
   STATEMENT(S)   
}
else
{
   STATEMENT(S)   
}
```

- **Common Pitfall with the || Operator**
	- `int numCupcakes = 5;  if(numCupcakes == 1 || 2){cout << "true" << endl;}`被判定为true，因为2非0，被认为true。应该`numCupcakes == 1 || numCupcakes == 2`
