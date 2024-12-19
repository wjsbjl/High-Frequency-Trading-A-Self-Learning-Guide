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
### Why not arrays?
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

### Vector Members (5.1)

| **Method**                                                  | **Description**                                                                              |
| ----------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `v.add(value);` or `v += value;` or `v += v1, v2, ..., vN;` | Appends value(s) at the end of the vector                                                    |
| `v.clear();`                                                | Removes all elements                                                                         |
| `v[i]` or `v.get(i)`                                        | Returns the value at the given index                                                         |
| `v.insert(i, value);`                                       | Inserts the given value just before the given index, shifting subsequent values to the right |
| `v.isEmpty()`                                               | Returns `true` if the vector contains no elements                                            |
| `v.remove(i);`                                              | Removes/returns value at the given index, shifting subsequent values to the left             |
| `v[i] = value;` or `v.set(i, value);`                       | Replaces value at the given index                                                            |
| `v.subList(start, length)`                                  | Returns a new vector of a sub-range of indexes                                               |
| `v.size()`                                                  | Returns the number of elements in the vector                                                 |
| `v.toString()`                                              | Returns a string representation of the vector, such as `"{3, 42, -7, 15}"`                   |
| `ostr << v`                                                 | Prints `v` to the given output stream                                                        |

### Vector Insert/Remove

`v.insert(2, 42);`
- **Operation:** Inserts `42` at index `2`.
- **Behavior:** Shifts elements to the right to make room for the new element.

Before:

| Index | 0   | 1   | 2   | 3   | 4   |
|-------|-----|-----|-----|-----|-----|
| Value | 3   | 8   | 9   | 7   | 5   |
After:

| Index | 0   | 1   | 2   | 3   | 4   | 5   |
|-------|-----|-----|-----|-----|-----|-----|
| Value | 3   | 8   | 42  | 9   | 7   | 5   |

---

`v.remove(1);`
- **Operation:** Removes the element at index `1`.
- **Behavior:** Shifts elements to the left to cover the space left by the removed element.

Before:

| Index | 0   | 1   | 2   | 3   | 4   | 5   |
|-------|-----|-----|-----|-----|-----|-----|
| Value | 3   | 8   | 42  | 9   | 7   | 5   |

After:

| Index | 0   | 1   | 2   | 3   | 4   |
|-------|-----|-----|-----|-----|-----|
| Value | 3   | 42  | 9   | 7   | 5   |

## Grid
`#include "grid.h"`
- Like a 2D array, but more powerful.
- Must specify the element type in < > (a template or a type parameter).

```cpp
Grid<int> matrix(3, 4); // Constructing a Grid
matrix[0][0] = 75;

// Or specify elements in {}
Grid<int> matrix = {
    {75, 61, 83, 71},
    {94, 89, 98, 100},
    {63, 54, 51, 49}
};

// Visualization of the Grid:
// Row / Column     0    1    2    3
// 0               75   61   83   71
// 1               94   89   98   100
// 2               63   54   51   49
```

### Grid Members

| **Method**                              | **Description**                                                                                   |
|-----------------------------------------|---------------------------------------------------------------------------------------------------|
| `Grid<type> name(r, c);`                | Creates a grid with the given number of rows and columns; creates an empty 0x0 grid if omitted.  |
| `Grid<type> name;`                      | Creates an empty grid.                                                                            |
| `g[r][c]` or `g.get(r, c)`              | Returns the value at the given row and column.                                                   |
| `g.fill(value);`                        | Sets every cell to store the given value.                                                        |
| `g.inBounds(r, c)`                      | Returns `true` if the given position is in the grid.                                             |
| `g.numCols()` or `g.width()`            | Returns the number of columns in the grid.                                                       |
| `g.numRows()` or `g.height()`           | Returns the number of rows in the grid.                                                          |
| `g.resize(nRows, nCols);`               | Resizes the grid to a new size, discarding old contents.                                          |
| `g[r][c] = value;` or `g.set(r, c, value);` | Stores a value at the given row and column.                                                    |
| `g.toString()`                          | Returns a string representation of the grid, e.g., `{{3, 42}, {-7, 1}, {5, 19}}`.               |
| `ostr << g`                             | Prints the grid, e.g., `{{3, 42}, {-7, 1}, {5, 19}}`.                                            |
> Notes: This is a partial list. For more details, see [Stanford Grid Documentation](http://stanford.edu/~stepp/cppdoc/).

# Looping Over a Grid

```cpp
// Row-major order
for (int r = 0; r < grid.numRows(); r++) {
    for (int c = 0; c < grid.numCols(); c++) {
        do something with grid[r][c];
    }
}

// "for-each" loop (also row-major)
for (int value : grid) {
    do something with value;
}

/* 
Visualization (Row-major):
The grid is traversed row by row:
75  61  83  71 →
94  89  98  91 →
63  54  51  49 →
*/

// Column-major order
for (int c = 0; c < grid.numCols(); c++) {
    for (int r = 0; r < grid.numRows(); r++) {
        do something with grid[r][c];
    }
}

/* 
Visualization (Column-major):
The grid is traversed column by column:
↓   ↓   ↓   ↓
75  61  83  71
94  89  98  91
63  54  51  49
*/
```
### Grid as Parameter

==Grid复制太慢，用&传，如果不想修改就设置为const常量==
- When a **Grid** is passed by value, C++ makes a **copy** of its contents.
  - Copying is slow; you should usually **pass by reference** using `&`.
  - If the code won't modify the grid, also pass it as `const`.

---

## Example: Which one is best?

### Function `computeSum`

```cpp
A) int computeSum(Grid<int> g) {
    // Passed by value; slow because it copies the entire grid.
}

B) int computeSum(Grid<int>& g) {
    // Passed by reference; faster, but allows modification of the grid.
}

C) int computeSum(const Grid<int> g) {
    // Passed by value; slow and cannot modify the grid.
}

D) int computeSum(const Grid<int>& g) {
    // Passed by reference and prevents modification; best choice.
}
```
Best Option: `D`

### Function `invert`

```C++
A) void invert(Grid<double> matrix) {
    // Passed by value; slow because it copies the entire grid.
}

B) void invert(Grid<double>& matrix) {
    // Passed by reference; fast and allows modification of the grid.
}

C) void invert(const Grid<double> matrix) {
    // Passed by value; slow and cannot modify the grid.
}

D) void invert(const Grid<double>& matrix) {
    // Passed by reference and prevents modification; unsuitable since modification is required.
}
```
**Best Option: `B`**