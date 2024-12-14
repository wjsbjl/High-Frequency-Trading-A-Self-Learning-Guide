## 前言
- Collection 也被称为data structure
- STL `standard template library`，是collection的library。斯坦福觉得这个做的不好，自己做了个 SPL `stanford CPP library`

## Vectors (Lists)
**File**: `#include "vector.h"`
**Definition**: vector (aka list) - a collection of elements with 0-based indexes
- Similar to a dynamically-resizing array (like Java ArrayList or Python list)
**Examples**:
```cpp
// Initialize a vector containing 5 integers
Vector<int> nums {42, 17, -6, 0, 28}; // indices: 0 1 2 3 4

// Declare a vector for storing strings
Vector<string> names;

// Adding elements
names.add("Stu");   // {"Stu"}
names.add("Marty"); // {"Stu", "Marty"}

// Inserting elements
names.insert(0, "Ed"); // {"Ed", "Stu", "Marty"}
```
## Why not arrays?
**Actual arrays in C++ are mostly awful**
```cpp
int nums[5] {42, 17, -6, 0, 28}; // Example array
// index: 0    1   2  3  4
// value: 42  17  -6  0  28
```
**Drawbacks of using arrays:**

- **Fixed size:** Arrays have fixed size and cannot be easily resized.
    - In C++, an array doesn't even _know_ its size. (no `.length` field)
- **Indexing issues:** C++ lets you index out of the array bounds (can lead to accessing garbage memory).
- **Limited operations:** An array does not support many operations that you'd want:
    - Inserting/deleting elements into the front/middle/back of the array.
    - Reversing, sorting the elements.
    - Searching for a given value, etc.