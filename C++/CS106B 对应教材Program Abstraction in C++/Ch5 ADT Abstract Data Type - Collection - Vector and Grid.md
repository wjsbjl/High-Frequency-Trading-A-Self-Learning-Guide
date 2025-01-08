## 前言
- Collection 也被称为data structure
- STL `standard template library`，是collection的library。斯坦福觉得这个做的不好，自己做了个 SPL `stanford CPP library`

- **abstract data type (ADT)**: A specification of a collection of data and the operations that can be performed on it.
	- Describes *what* a collection can do, not *how* it does it.
	- We could say that both Vector and LinkedList implement the operations of the abstract data type called "list".
	- Other examples of ADTs: stack, queue, set, map, graph

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
| v.contains(x)                                               | 用来判断x是否在v里                                                                                   |

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

### Looping Over a Grid

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

### Example: Which one is best?

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

## LinkedList 链表
`#include "linkedlist.h"`
通过节点链接，插入O(1)，索引O(n)
## Stacks
`#include "stack.h"`
- **stack**: A collection based on the principle of adding elements and retrieving them in the opposite order.
  - Last-In, First-Out ("LIFO")
  - Client can only add/remove/examine the last element added (the "top").
- Basic stack operations:
	- **push**: Add an element to the top.
	- **pop**: Remove the top element.
	- **peek**: Examine the top element without removing it.
### Stack Class
Operations and Their Time Complexity

| Method          | Complexity | Description                                                              |
| --------------- | ---------- | ------------------------------------------------------------------------ |
| `s.isEmpty()`   | O(1)       | returns true if stack has no elements                                    |
| `s.peek()`      | O(1)       | returns top value without removing it; throws an error if stack is empty |
| `s.pop()`       | O(1)       | removes top value and returns it; throws an error if stack is empty      |
| `s.push(value)` | O(1)       | places given value on top of stack                                       |
| `s.size()`      | O(1)       | returns number of elements in stack                                      |
> Example Usage
```cpp
#include "stack.h"

Stack<int> s; // {} bottom-> top
s.push(42);
s.push(2);
s.push(2);
cout << s.peek() << endl; // Output: 42
cout << s.pop() << endl;  // Output: 42
```
### Stacks in Computer Science

- **Programming languages and compilers**:
  - Function calls are placed onto a stack (`call=push`, `return=pop`)
  - Compilers use stacks to evaluate expressions

- **Matching up related pairs of things**:
  - Find out whether a string is a palindrome
  - Examine a file to see if its braces `{ }` match
  - Convert "infix" expressions to "pre/postfix"

- **Sophisticated algorithms**:
  - Searching algorithms like "If you're evaluating expressions, you know."
## Queues (5.3)
`#include queue.h`
> 可以用linked list实现
- **queue**: Retrieves elements in the order they were added.
  - First-In, First-Out ("FIFO")
  - Elements are stored in order of insertion but don't have indexes.
  - Can add only to the end of the queue, and can only examine/remove the front.
### Basic queue operations:
- **enqueue**: Add an element to the back.
- **dequeue**: Remove the front element.
- **peek**: Examine the front element without removing it.
## The Queue Class
`#include "queue.h"`

| Method             | Complexity | Description                                                             |
| ------------------ | ---------- | ----------------------------------------------------------------------- |
| `q.dequeue()`      | O(1)       | Removes front value and returns it; throws an error if queue is empty   |
| `q.enqueue(value)` | O(1)       | Places given value at back of queue                                     |
| `q.isEmpty()`      | O(1)       | Returns true if queue has no elements                                   |
| `q.peek()`         | O(1)       | Returns front value without removing; throws an error if queue is empty |
| `q.size()`         | O(1)       | Returns number of elements in queue                                     |

### Example Usage
```cpp
Queue<int> q; 
q.enqueue(42); 
q.enqueue(-3); 
q.enqueue(17); 
cout << q.dequeue() << endl; 
```
## Sets (5.5)

A **set** is a collection of unique values (no duplicates allowed) that can perform the following operations efficiently:
- **add**
- **remove**
- **search** (contains)

We don't think of a set as having any indexes; we just add things to the set in general and don't worry about order.

Example of searching in a set:

```cpp
set.contains("to")  // returns true
set.contains("be")  // returns false
```
### Stanford C++ Sets

- Set
	- Implemented using a linked structure called a **binary tree**.
	- Elements are stored in **sorted order**.
	- Values must have a `<` operation.
- HashSet
	- Implemented using a special array called a **hash table**.
	- Elements are stored in **unpredictable order**.
	- Values must have a `hashCode` function (provided for most standard types).
	- Variant: **LinkedHashSet** (slightly slower, but remembers insertion order).
- How to Choose:
	- Do you need the elements to be in sorted order?
		- **Yes**: Use `Set`.
		- **No**: Use `HashSet` for the performance boost.
	- 排序后不能索引，但查值等会变快
```cpp
#include "set.h" 
#include "hashset.h"``
```
### Operations and their complexities

|Member|Set Complexity|HashSet Complexity|Description|
|---|---|---|---|
|`s.add(value)`|O(log N)|O(1)|Adds a given value to the set|
|`s.clear()`|O(N)|O(N)|Removes all elements of the set|
|`s.contains(value)`|O(log N)|O(1)|Returns true if the given value is found|
|`s.isEmpty()`|O(1)|O(1)|Returns true if the set contains no elements|
|`s.isSubsetOf(set)`|O(N log N)|O(N)|Returns true if the set contains all elements of another set|
|`s.remove(value)`|O(log N)|O(1)|Removes a given value from the set|
|`s.size()`|O(1)|O(1)|Returns the number of elements in the set|
|`s.toString()`|O(N)|O(N)|Returns a string representation of the set, e.g., "{3, 42, -7, 15}"|
|`ostr << s`|O(N)|O(N)|Prints the set to a stream|
### Set Operators

Below are the operators for set manipulation, along with their descriptions and examples:

| Operator | Description | Example |
|----------|-------------|---------|
| `s1 == s2` | True if the sets contain exactly the same elements | `if (set1 == set2) {...}` |
| `s1 != s2` | True if the sets don't contain the same elements | `if (set1 != set2) {...}` |
| `s1 + s2` | Returns the union of `s1` and `s2` (elements from either) | `auto set3 = set1 + set2;` |
| `s1 += s2` | Sets `s1` to the union of `s1` and `s2` (or adds a value to `s1`) | `set1 += set2;` |
| `s1 * s2` | Returns intersection of `s1` and `s2` (elements in both) | `auto set3 = set1 * set2;` |
| `s1 *= s2` | Sets `s1` to the intersection of `s1` and `s2` | `set1 *= set2;` |
| `s1 - s2` | Returns difference of `s1`, `s2` (elements in `s1` but not in `s2`) | `auto set3 = set1 - set2;` |
| `s1 -= s2` | Sets `s1` to the difference of `s1` and `s2` (or removes a value from `s1`) | `set1 -= set2;` |

#### Example of Usage
```cpp
Set<string> set;
set += "Jess"; // Adds "Jess"
set += "Alex"; // Adds "Alex"

Set<string> set2{"a", "b", "c"}; // Initializer list
```

### looping over a set
- 没有索引，所以不能for循环with index [i]，而是
```cpp
for (type name: collection){
	statements;
}
```
e.g.
```cpp
for (string str:AllwordsSet){
	cout<<str<<endl;
}
```
## Stanford Lexicon
`#include "lexicon.h"`
A set of words optimized for dictionary and prefix lookups. 
### Member Functions and Their Complexities

| Member                     | Big-Oh   | Description                                                                    |
| -------------------------- | -------- | ------------------------------------------------------------------------------ |
| `Lexicon name;`            | O(N*len) | Create empty lexicon or read from file                                         |
| `L.add(word);`             | O(len)   | Adds the given word to lexicon                                                 |
| `L.addWordsFromFile("f");` | O(N*len) | Adds all words from input file (one per line)                                  |
| `L.clear();`               | O(N*len) | Removes all elements of lexicon                                                |
| `L.contains("word")`       | O(len)   | True if word is found in lexicon                                               |
| `L.containsPrefix("str");` | O(len)   | True if `str` is the start of any word in lexicon                              |
| `L.isEmpty();`             | O(1)     | True if lexicon contains no words                                              |
| `L.remove("word");`        | O(len)   | Removes word from lexicon, if present                                          |
| `L.removePrefix("str");`   | O(len)   | Removes all words that start with prefix                                       |
| `L.size();`                | O(1)     | Number of elements in lexicon                                                  |
| `L.toString();`            | O(N)     | Returns a string representation of the lexicon, e.g. `{"arm", "cot", "zebra"}` |
## Maps (5.4)  
- A `map` is a collection that stores pairs, where each pair consists of a first half called a `key` and a second half called a `value`. 
- Sometimes referred to as a "dictionary", "associative array", or "hash".  
### Map Operations

Maps are collections that store pairs of elements, where each pair consists of a unique key and a corresponding value. Below are the primary operations you can perform on maps:

#### Adding and Updating Entries
- **Add or Update**: Use `m.put(key, value)` or `m[key] = value` to add a new key-value pair or update an existing pair.
  - Example: `m.put("Eric", "650-123-4567");` or `m["Eric"] = "650-123-4567";`

#### Retrieving Values
- **Get Value**: Use `m.get(key)` or `m[key]` to retrieve the value for a specific key.
  - Example: `string phoneNum = m.get("Yana");` or `string phoneNum = m["Yana"];`
  - Note: If the key is not found, `m.get(key)` returns a default value like 0, 0.0, "", etc., depending on the map's configuration.

#### Removing Entries
- **Remove Entry**: Use `m.remove(key)` to delete a key-value pair.
  - Example: `m.remove("Marty");`
### Map Implementations in the Stanford C++ Library

The Stanford C++ library offers two primary classes for map implementations, catering to different needs based on the nature of key storage and retrieval:

#### Map
- **Implementation**: Uses a linked structure known as a *binary search tree*.
- **Characteristics**:
  - Keys are stored in **sorted order**, facilitating operations that benefit from ordered data.
  - Pretty fast for all operations, making it suitable for applications where order is beneficial.
  - The key type must be comparable with a `<` operation.
- **Usage**: Ideal for scenarios where frequent order-dependent retrievals are common, such as sorted data display or range queries.

#### HashMap
- **Implementation**: Utilizes a special array called a *hash table*.
- **Characteristics**:
  - Provides very fast access times since keys are stored in an unpredictable order.
  - The key type must have a `hashCode` function, but this is commonly available in most types.
- **Usage**: Best for situations requiring rapid lookups where the insertion order does not matter.

#### Type Parameters
- Maps in this library require two type parameters: one for the keys and one for the values.
  - Example: `Map<string, int> votes;` maps from string keys to integer values.

These map types offer flexible solutions for managing key-value pairs with performance tailored to specific application needs, whether maintaining order with `Map` or optimizing for speed with `HashMap`.
### Map Members and Operations

In the context of data structures like `Map` and `HashMap`, here are the operations and their complexities:

| Operation | Map Complexity | HashMap Complexity | Description |
|-----------|----------------|--------------------|-------------|
| `m.clear()` | O(N) | O(N) | Removes all key/value pairs from the map. |
| `m.containsKey(key)` | O(log N) | O(1) | Returns true if the map contains the specified key. |
| `m[key]` or `m.get(key)` | O(log N) | O(1) | Retrieves the value associated with the key; adds it with a default value if not found. |
| `m.isEmpty()` | O(1) | O(1) | Checks if the map contains no pairs. |
| `m.keys()` | O(N) | O(N) | Returns a vector containing all the keys in the map. |
| `m[key] = value` or `m.put(key, value)` | O(log N) | O(1) | Adds or updates a key/value pair in the map. |
| `m.remove(key)` | O(log N) | O(1) | Removes the key (and its corresponding value) from the map. |
| `m.size()` | O(1) | O(1) | Returns the number of key/value pairs in the map. |
| `m.toString()` | O(N) | O(N) | Provides a string representation of the map, e.g., `"{a: 90, d: 60, c: 70}"`. |
| `m.values()` | O(N) | O(N) | Returns a vector containing all the values in the map. |
| `ostr << m` | O(N) | O(N) | Outputs the contents of the map to a stream. |

This table provides a comprehensive comparison of operations between a traditional `Map` implemented with a binary search tree and a `HashMap` using a hash table, highlighting efficiency differences and use cases.
## Looping Over and Working with Maps in C++

Maps in C++ can be efficiently manipulated and traversed using various operations. Here’s an overview of looping through maps and some practical applications.

### Map Operations
Maps support a variety of operations that can be used to manipulate and access data:

- **`m.clear()`**: Removes all key/value pairs.
- **`m.containsKey(key)`**: Checks if a key exists.
- **`m[key]` or `m.get(key)`**: Accesses the value associated with a key; adds a default value if the key does not exist.
- **`m.isEmpty()`**: Returns true if the map is empty.
- **`m.keys()`**: Retrieves all keys in the map.
- **`m[key] = value` or `m.put(key, value)`**: Adds or updates a key/value pair.
- **`m.remove(key)`**: Removes a key and its associated value.
- **`m.size()`**: Returns the number of pairs in the map.
- **`m.toString()`**: Provides a string representation of the map.

### Looping Over a Map 
When looping over a map, the type of map determines the order of traversal:

- **`Map`**: Iterates in sorted order based on the keys.
- **`HashMap`**: Iterates in an unpredictable order.

Example of looping over a `Map` to access GPA records:

```cpp
Map<string, double> gpa;
gpa.put("Victoria", 3.98);
gpa.put("Marty", 2.7);
// Looping over the map
for (string name : gpa) {
    cout << name << "'s GPA is " << gpa[name] << endl;
}
```

```cpp
Map<string, int> wordCount;
ifstream input("filename.txt");
string word;
while (input >> word) {
    word = toLowerCase(word);  // Assuming a function to convert to lower case
    wordCount[word]++;
}
```
## Buddy List Example: Storing Facebook Friends

When managing collections like a buddy list in C++, you can use a `Map` where each key (a person's name) maps to a `Set` of friends, ensuring each friend's name is stored uniquely and without duplication.

### Example Code
```cpp
#include <iostream>
#include <string>
#include <map>
#include <set>
using namespace std;

int main() {
    Map<string, Set<string>> pals;
    pals["Jim"] += "Kate";  // Adds Kate to Jim's list of friends
    pals["Jim"] += "Bill";  // Adds Bill to Jim's list of friends
    pals["Marty"] += "Stuart";  // Adds Stuart to Marty's list of friends
    pals["Jim"] += "Cindy";  // Adds Cindy to Jim's list of friends
    pals["Hal"] += "Marty";  // Adds Marty to Hal's list of friends
    pals["Marty"] += "Yana";  // Adds Yana to Marty's list of friends

    // Print all buddies
    for (auto& pair : pals) {
        cout << pair.first << ": {";
        for (auto& friendName : pair.second) {
            cout << friendName << " ";
        }
        cout << "}" << endl;
    }
}
