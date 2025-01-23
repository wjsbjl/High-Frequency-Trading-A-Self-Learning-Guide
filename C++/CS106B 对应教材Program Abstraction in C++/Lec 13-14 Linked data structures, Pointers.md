- Refs
	- Vedio Lecture 12-13
	- Book 11.2, 11.4; 12.1-12.3
## Summary
- Contents
	- Linked Data Structures
	- Structure: 小的类，默认members为public
	- Memory addresses: `&` ("address-of") operator 返回变量的内存地址，通常为hex (base-16) numbers
- Reassigning pointers
	- `a->next = b->next`: a指针和b指针指向同一个位置
	- `a=b->next`: a指针直接指向b的下一个结点
	- `a=b`: a指针指向b指针指的位置
- `new`
	- 这里的`new`是用来创建类的一个实例；`int`这种primitive data type不用这样。
- 指针修改
	- 理解`temp=temp->next`（不改变数据内容）和`temp->next=nullptr`（相当于从这里截断）的区别
- `delete pointer` 删除
	- 例如`front=front->next`，前面的内容在程序结束时才会删除，造成memory leak
	- 这块内存也不会被其他命令占用，memory manager认为这部分内存还在被使用
	- `ListNode* temp = front;front = front->next;delete temp;`
## Linked Data Structures

Some collections store data using linked sequences of nodes.
- Each node stores one element and a link to another node(s).
- Examples include: Set, Map, LinkedList

**Visualization of a LinkedList:**
- front → 42 → -3 → 17 → 9

**Pros and Cons:**
- **Pro:** Fast to add/remove at any point; no shifting, no resizing.
- **Con:** Slow to access certain parts of the list.

### Discussion
Linked data structures are ideal for scenarios where frequent insertions and deletions are common, as they can be done without reallocating the entire structure. However, accessing elements in the middle of the list can be slow since it requires sequential traversal from the start of the list.
## Structs

**Definition:**
- `struct`: A lightweight class mainly used as a data structure template where members are public by default.

**Declaring a Struct Type:**
···cpp
struct Date {
    int month;
    int day;  // members of each Date structure
};
···

**Usage Examples:**
- **Constructing an instance:**
```cpp
Date today;
today.month = 10;  // Assigning values to members
today.day = 23;
```

- **Using initializer syntax for construction:**
```cpp
Date xmas {12, 25};  // Shorter initializer syntax
```

### Discussion
Structs in C++ provide a simple way to group related data together. They are typically used when you need to aggregate data without requiring complex behavior that a class would offer. This makes structs ideal for small data structures where access control (i.e., encapsulation) is not a primary concern.
## Memory Addresses

The `&` ("address-of") operator in C++ is used to obtain the memory address of a variable. Memory addresses are typically represented as hexadecimal (base-16) numbers.

**Example Code:**
```cpp
int x = 42;
int y = 17;
Date d {7, 13};

cout << x << endl;        // Outputs the value of x: 42
cout << &x << endl;       // Outputs the memory address of x: 0x7f8e20

cout << y << endl;        // Outputs the value of y: 17
cout << &y << endl;       // Outputs the memory address of y: 0x7f8e24

cout << &d << endl;       // Outputs the memory address of the Date object d: 0x7f8e28
cout << &d.month << endl; // Outputs the memory address of the month member of d: 0x7f8e28
cout << &d.day << endl;   // Outputs the memory address of the day member of d: 0x7f8e2c
```

### Discussion
Using the `&` operator is essential for understanding pointers and memory management in C++. It allows programmers to directly access and manipulate the memory locations of variables and struct members, which can be crucial for performance optimization and interfacing with low-level system components.

## Pointers in C++

**Pointer Definition:**
- A **pointer** is a variable that stores a memory address.
- In the code below, `p` points to `x`.
  - The `int x` is the "pointee" of the pointer `p`.
  - The pointer itself occupies memory and can be manipulated just like any other variable.

**Example Code:**
```cpp
int x = 42;
int* p = &x;  // p points to the memory address of x
cout << p << endl;  // Outputs the memory address of x (e.g., 0x7f8e20)
```

### Key Points:
- The `&` operator is used to get the memory address of a variable.
- The pointer variable (`p`) stores this memory address.
- You can use the pointer to access or manipulate the value stored at the memory address.

### Memory Address:
- The output of `cout << p` will display the address of `x`, and this address is typically displayed in hexadecimal format (e.g., `0x7f8e20`).
## Dereferencing a Pointer

`*p` means "the value that `p` points to". This process is known as **dereferencing** the pointer.

**Example Code:**
```cpp
int x = 42;
int* p = &x;  // p points to x

// Access the pointee
cout << p << endl;    // Outputs memory address of x: 0x7f8e20
cout << *p << endl;   // Dereferences p and outputs value of x: 42

// Modify the pointee
*p = 99;  // Changes the value at the memory address that p points to
cout << x << endl;   // Outputs modified value of x: 99
```

### Explanation
- **Dereferencing**: When you use `*p`, you're accessing the value stored at the memory address that `p` holds. In this case, `p` holds the address of `x`, so `*p` gives you the value of `x`.
- Modifying `*p` allows you to change the value stored at the address `p` points to, which will affect the original variable `x`.

### Diagram
- The diagram in the image shows that `p` holds the memory address of `x`, and dereferencing it (with `*p`) allows you to access or modify `x`.
## Pointer to a Struct

- **Pointer to Struct**: You can create a pointer to a struct or object using `new`. This will allocate memory for the struct and return a pointer to it.
- **Operator `->`**: The `->` operator is used to access members of an object that a pointer points to.

**Example Code:**
```cpp
Date* d1 = new Date();  // Creates a new Date object and returns a pointer to it
d1->month = 7;          // Set the month to 7
d1->day = 13;           // Set the day to 13

Date* d2 = d1;          // Point d2 to the same Date object as d1
d2->month = 9;          // Modify the month via d2

cout << d1->month << endl;  // Outputs 9, since d1 and d2 point to the same object
cout << d1->day << endl;    // Outputs 13, since only the month was modified
```

### Explanation
- **Pointer Creation**: `Date* d1 = new Date();` creates a new `Date` object on the heap and assigns the pointer `d1` to it.
- **Accessing Members**: The `->` operator is used to access the `month` and `day` members of the `Date` struct through the pointer.
- **Pointer Assignment**: `d2 = d1;` makes `d2` point to the same `Date` object as `d1`. Therefore, changing the `month` through `d2` also affects `d1`, as both point to the same memory location.

### Memory Layout:
The diagram shows the memory layout, with the pointer pointing to the object at a specific memory address. Both `d1` and `d2` point to the same memory, and changes via one pointer are reflected in the other.
