7:30
- Refs
	- VedioLecture 12
- Contents
	- Linked Data Structures
	- Structure: 小的类，默认members为public
	- Memory addresses: `&` ("address-of") operator 返回变量的内存地址，通常为hex (base-16) numbers
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
···cpp
Date today;
today.month = 10;  // Assigning values to members
today.day = 23;
···

- **Using initializer syntax for construction:**
···cpp
Date xmas {12, 25};  // Shorter initializer syntax
···

### Discussion
Structs in C++ provide a simple way to group related data together. They are typically used when you need to aggregate data without requiring complex behavior that a class would offer. This makes structs ideal for small data structures where access control (i.e., encapsulation) is not a primary concern.
## Memory Addresses

The `&` ("address-of") operator in C++ is used to obtain the memory address of a variable. Memory addresses are typically represented as hexadecimal (base-16) numbers.

**Example Code:**
···cpp
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
···

### Discussion
Using the `&` operator is essential for understanding pointers and memory management in C++. It allows programmers to directly access and manipulate the memory locations of variables and struct members, which can be crucial for performance optimization and interfacing with low-level system components.
