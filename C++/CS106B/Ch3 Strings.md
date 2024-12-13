- `char` 单个字符，用单引号
- **Typecasting**
	- `(int)ch`通过括号把强制转换为int
- _Strings_
	1. Strings are arrays of characters.
		- strings in C++ must be given in double quotes, not single quotes. We only use single quotes for single characters.
	2. Strings are objects (not primitive data types).
		- 基本数据类型 `primitive types` _int_, _float_, _double_, and _char._
		- strings可以用Dot Operator `.` 获取methods and properties
**C++ String Member Functions**

| Member Function                             | Description                                                                                                                         |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| s.append(str)                               | add text to the end of a string                                                                                                     |
| s.compare(str)                              | return -1, 0, or 1 depending on relative ordering                                                                                   |
| s.erase(index, length)                      | delete text from a string starting at given index                                                                                   |
| s.find(str)  <br>s.rfind(str)               | return first or last index where the start of _str_ appears in this string (returns _string::npos_ if not found)                    |
| s.insert(index, str)                        | add text into string at a given index                                                                                               |
| s.length()  <br>s.size()                    | return number of characters in the string                                                                                           |
| s.replace(index, len, str)                  | replace _len_ chars at given index with new text                                                                                    |
| s.substr(start, length)  <br>s.subsr(start) | return a new string with the next _length_ chars beginning at _start_ (inclusive); if _length_ is omitted, grabs till end of string |
> 如果有错，会返回`string::npos`，其中npos是string和array的最大长度

**Stanford C++ String Library (_strlib.h_)**

| Function Name                                                                                   | Description                                                                         |
| ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| endsWith(str, suffix)  <br>startsWith(str, prefix)                                              | returns _true_ if the given string begins or ends with the given prefix/suffix text |
| integerToString(int)  <br>realToString(double)  <br>stringToInteger(str)  <br>stringToReal(str) | returns a conversion between numbers and strings                                    |
| equalsIgnoreCase(s1, s2)                                                                        | returns true if _s1_ and _s2_ have same chars, ignoring case                        |
| toLowerCase(str)  <br>toUpperCase(str)                                                          | returns an upper/lowercase version of a string (pass-by-value!)                     |
| trim(str)                                                                                       | returns string with surrounding whitespace removed                                  |
> Stanford library的`getLine`比cin好，不会每次只能接受一个字符

`CTRL+CLICK`
- If you #include "strlib.h" in a Qt Creator project, you can CTRL+CLICK on _strlib.h_ to go into that file and see a list of functional prototypes with descriptions of what those functions do. Alternatively, you can click over to the Resources page on the course website, click "Stanford Library documentation," then click [_strlib.h_](https://web.stanford.edu/dept/cs_edu/resources/cslib_docs/strlib.html) on that page.
**Accessing (and Modifying) Individual Characters in Strings**
- C++'s strings are **mutable** (able to be changed), whereas Python and Java strings are **immutable**
- C++中的变量基本都是uninitialized，但string是一上来就空的，double quotes with nothing -- not even a space -- between them: ""

The _cctype_ library

| Member Function | Description |
| ---- | ---- |
| isalnum(ch) | checks if a character is alphanumeric |
| isalpha(ch) | checks if a character is alphabetic |
| islower(ch) | checks if a character is a lowercase alphabetic character |
| isupper(ch) | checks if a character is an uppercase alphabetic character |
| isdigit(ch) | checks if a character is a digit |
| isxdigit(ch) | checks if a character is a hexadecimal character |
| iscntrl(ch) | checks if a character is a control character |
| isgraph(ch) | checks if a character is a graphical (i.e., visible) character |
| isspace(ch) | checks if a character is a space character (typically tab or space) |
| isblank(ch) | checks if a character is a blank character |
| isprint(ch) | checks if a character is a printing character according to locale |
| ispunct(ch) | checks if a character is punctuation (visible non-alnum/non-space) |
| toupper(ch) | converts a character to uppercase (pass-by-value!) |
| tolower(ch) | converts a character to lowercase (pass-by-value!) |
**C++'s Two Types of Strings**
- C++ actually has two types of strings. We have seen the _string_ variable type, but any time we type a **string literal** (i.e., a hard-coded string in double quotes), we are actually getting a C-style string.
	- C style `"abc"`
	- C++ style `string s1 = "abc"`
	- wrong `string s2 = "abc" + "def"` 不可加，后面两个是C style
	- right `string s2 = s1 + "def"` s1是C++ style，至少有一个C++ style就可以转换
**Common Pitfall with Strings in C++**
- C++ lets you access invalid indices when playing with strings. This can cause all kinds of wonky things to happen in your programs.长度为5的string也可以索引`[10]`。

1. (_Pass-by-Reference Functions_) Write a pass-by-reference function called _mySwap()_ that takes two integers and swaps their values. Your function should pass the test case provided below. What should the return type be? What types should we use for the function parameters? (Note: The function is called _mySwap()_ because there is already a native _swap()_ function in C++.)
```
#include <iostream>
#include "console.h"
using namespace std;
void mySwap(int& a, int& b){
    int c;
    c = a;
    a = b;
    b = c;
}

int main()
{
    int a = 1;
    int b = 2;
    cout << a << b << endl;
    mySwap(a,b);
    cout << a << b << endl;
    return 0;
}
```

3. (_Pass-by-Reference Functions_) Trace through the following program by hand to see if you can determine the output it will produce. Then run compile and run the program to check your result.