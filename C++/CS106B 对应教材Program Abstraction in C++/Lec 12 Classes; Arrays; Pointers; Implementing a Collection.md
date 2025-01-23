## Summary
- 文件
	- `.h`定义类的属性和方法都有哪些，有点像prototype
	- `.cpp`写实现
	- compile时把cpp转为binary code, 并编译为程序。`#include "x.h"`就是这些编译的prototype
- 名词
	- `constructor`: 理解为创建instance]的时候填入初始参数。是一个method，name为类的name（python的`__init__`）
	- `private data`: read-only attribute
- Data Type
	- array，Vector和Stack都基于array实现。一般大于当前数据长度，有多余slots，称为unfilled array
	- Lecture 11后半部分写了ArrayStack
	- Lecture 12讲了Linked data structures

- Lecture 12-14
- Book Ch6, 11, 14.1-2
- Vedio 11-15 3:37
- how to build stack
- ## Classes and Objects

- **class**: A template for a new type of objects.
  - Allows us to add new types to the language.
  - Examples: Date, Student, BankAccount

- **object**: Entity that combines state and behavior.
  - **Object-oriented programming (OOP)**: Programs that perform their behavior as interactions between objects.
  - **abstraction**: Separation between concepts and details.
## Elements of a Class

- **member variables**: State inside each object.
  - Also called "instance variables" or "fields"
  - Each object has a copy of each member.

- **member functions**: Behavior inside each object.
  - Also called "methods"
  - Each object has a copy of each method.
  - The method can interact with the data inside that object.

- **constructor**: Initializes new objects as they are created.
  - Sets the initial state of each new object.
  - Often accepts parameters for the initial state of the fields.

> GPT: in Python:
- **Member variables** are typically referred to as **attributes**. These are the variables associated with an object of a class and define the state of that object.
	
- **Member functions** are known as **methods**. These are functions defined inside a class and are used to define the behaviors and capabilities of the objects created from the class.

## Interface vs. Code in C++

C++ separates classes into two kinds of code files:
- `.h`: A "header" file containing the interface (declarations).
- `.cpp`: A "source" file containing definitions (method bodies).
  - For class `Foo` => must write both `Foo.h` and `Foo.cpp`.

The content of `.h` files is `#include`d inside `.cpp` files:
- Makes them aware of declarations of code implemented elsewhere.
- At compilation, all definitions are linked together into an executable.
## Class Declaration (.h File)

```cpp
#ifndef _classname_h
#define _classname_h

class ClassName {
public:
    ClassName(parameters); // constructor
    returnType name(parameters); // member functions
    returnType name(parameters); // (behavior inside each object)
    returnType name(parameters); // 

private: // 防止被外部修改
    type name; // member variables
    type name; // (data inside each object)
}; // IMPORTANT: must put a semicolon at end of class declaration (argh)

#endif 
```
> This Markdown formatted code block represents a typical C++ header file structure, showing the use of include guards, class definition, public members (like constructors and methods), and private members (variables).

```cpp
// BankAccount.h
#ifndef _bankaccount_h
#define _bankaccount_h

class BankAccount {
public:
    BankAccount(string n, double d); // constructor
    void deposit(double amount);     // methods
    void withdraw(double amount);    // methods

private:
    string name;           // each BankAccount object has a name
    double balance;        // and a balance
};

#endif
```

```cpp
// client code in bankmain.cpp
BankAccount ba1("Marty", 1.25);
ba1.deposit(2.00);

BankAccount ba2("Mehran", 9999.00);
ba2.withdraw(500.00);
```

## Member Function Bodies in C++

In `ClassName.cpp`, we write bodies (definitions) for the member functions that were declared in the `.h` file:

```cpp
// ClassName.cpp
#include "ClassName.h"

returnType ClassName::methodName(parameters) {
    statements;
}
```

## Member Function Implementation and Client Program Usage

```cpp
// BankAccount.cpp
void BankAccount::withdraw(double amount) {
    if (balance >= amount) {
        balance -= amount;
    }
}

// Example usage of the BankAccount class
BankAccount marty(...);  // Create an account for Marty
BankAccount mehran(...); // Create an account for Mehran

// Operations
marty.withdraw(5.00);   // Marty withdraws $5.00
mehran.withdraw(99.00); // Mehran withdraws $99.00
```
## Private Data and Encapsulation

**Private Data:**
```md
private:
    type name;
```
- **Encapsulation:** Encapsulation involves hiding implementation details from client code, which helps in maintaining the integrity of the data.

**Accessor and Mutator Methods:**

- **Accessor (Getter)** - Provides read-only access to a private data field.
```cpp
double BankAccount::getBalance() {
	return balance; 
}
```
- **Mutator (Setter)** - Allows clients to change the value of a data field.
```cpp
void BankAccount::setName(string newName) {
	name = newName; 
}
```

## Arrays in C++

**Dynamically Allocated Array:**
```cpp
type* name = new type[length];
```

- This creates a dynamically allocated array, where `type*` indicates a pointer to `type`.
- The variable `name` refers to the array and is called a pointer.
- Memory for the array must be manually released to avoid a memory leak.

**Example:**
```cpp
int* homeworkGrades = new int[7];
```

**Fixed Array:**
```cpp
type name[length];
```
- This syntax declares a fixed array which is initialized at declaration and cannot be resized.
- Stored in a different place in memory; specifically, fixed arrays are stored on the stack, while dynamically allocated arrays use the heap.

### Discussion
- The first method using `new` keyword allocates arrays on the heap, which provides flexibility in size and duration but requires manual management of the memory (including deallocation).
- The second method provides a simpler, safer alternative at the cost of flexibility since the array size is fixed at compile time and limited by the stack size.
## Array Initialization in C++

**How to Initialize Arrays:**
```cpp
type* name = new type[Length];  // Uninitialized
type* name = new type[Length](); // Initialize to zero
```

- **Uninitialized Array:** If `()` are not used after the array size, the elements are uninitialized and contain whatever values were previously in the allocated memory (often appearing as gibberish numbers).
- **Initialized Array:** Adding `()` after the array size initializes all elements to zero (or the default zero-equivalent for non-integer types), which is safer but may be slightly slower.

**Examples:**
```cpp
int* a = new int[3];   // Uninitialized array
cout << a[0];          // Output might be a random number, e.g., 2395876
cout << a[1];          // Another random number, e.g., -197630894

int* a2 = new int[3](); // Initialized array, all elements set to 0
cout << a2[0];          // Output: 0
cout << a2[1];          // Output: 0
```

### Discussion
Using parentheses to initialize the array elements to zero is crucial in many scenarios to avoid errors related to unexpected or undefined values in your program.
## How Vector/Stack Works

**Vector Mechanics:**
- A Vector uses an internal array to store elements. Typically, the array is larger than the actual data added so far, allowing room for adding more elements without needing to resize frequently. This is known as an "unfilled array."

**Example with Vector:**
```cpp
Vector<int> v;
v.add(42);  // Adds 42 to the vector
v.add(-5);  // Adds -5 to the vector
v.add(17);  // Adds 17 to the vector
```

**Visualization:**
- **Index**: 0 1 2 3 4 5 6 7 8 9
- **Value**: 42 -5 17 0 0 0 0 0 0 0
- **Size**: 3
- **Capacity**: 10

**Stack Mechanics:**
- A Stack can also be implemented using an unfilled array, taking advantage of the array's unused capacity to manage elements in a LIFO (Last In, First Out) order.

**Example with Stack:**
```cpp
Stack<int> s;
s.push(42);  // Pushes 42 onto the stack
s.push(-5);  // Pushes -5 onto the stack
s.push(17);  // Pushes 17 onto the stack
```
### Discussion
- **Vector** and **Stack** structures are efficient in managing dynamic collections of elements by utilizing arrays with preallocated, unfilled space, enhancing performance by reducing the need for frequent memory allocations.
