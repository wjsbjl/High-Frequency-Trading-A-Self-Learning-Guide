- Recursion: Programming Abstractions in C++, Ch7
- Fractals: Programming Abstractions in C++, Ch8 分形
## Recursion

Recursion is the process of defining an operation in terms of itself. This technique is pivotal in solving problems where the solution involves breaking the problem down into smaller, more manageable sub-problems that are similar to the overall problem.

### Key Concepts:
- **Self-Similarity**: The solution to the problem depends on solutions to smaller instances of the same problem.
- **Key Question**: "How is this problem self-similar?" This question helps in identifying the recursive nature of the problem and determining the base case and the recursive case.

## Recursive Programming

Recursive programming involves writing functions that call themselves to solve problems that are recursive in nature. This method is particularly powerful and can serve as an alternative to traditional iterative approaches like loops.

### Characteristics of Recursive Programming:
- **Powerful Substitute for Iteration**: It can perform the same operations as loops but is often more succinct and conceptually simpler for certain types of problems.
- **Well-Suited for Specific Problems**: Especially effective for problems where the solution can be expressed as a variation of the same problem on a smaller scale.
- **Elegance and Simplicity**: Leads to more readable and shorter code when used appropriately.

### Use in Programming Languages:
- **Functional Programming**: Languages such as Scheme, ML, and Haskell utilize recursion extensively, often excluding traditional loop constructs altogether.
- **Core Component**: Recursion is a fundamental aspect of functional programming and is emphasized in educational courses to enhance problem-solving skills and understanding of automatic memory management (stack frames).

### Practical Application:
Recursive functions are pivotal in:
- Traversing and manipulating complex data structures like trees and graphs.
- Implementing algorithms such as QuickSort and MergeSort.
- Performing calculations like computing factorials and Fibonacci numbers.

Recursive programming not only reinforces understanding of function calls and execution stack but also encourages thinking in terms of reducing big problems into manageable sub-problems.

## Recursion and Cases

Recursion is a powerful programming technique where a function calls itself to solve a problem. Each recursive algorithm involves at least two cases:

### Base Case
- **Definition**: A simple occurrence of the problem that can be answered directly. The base case stops the recursion, preventing it from continuing indefinitely.

### Recursive Case
- **Definition**: A more complex occurrence of the problem that cannot be directly solved but can instead be described in terms of smaller occurrences of the same problem.
- **Key Idea**: In a recursive piece of code, you handle a small part of the overall task yourself, and then make a recursive call to handle the rest.

### Key Question
- When designing a recursive function, ask yourself: "How is this task self-similar?"
  - This question helps in identifying how to break the problem down and how to approach solving the recursive case by making the problem smaller or simpler.

Recursion is suited for problems where the solution to the problem can be facilitated through solving smaller instances of the same problem, such as sorting algorithms, calculating factorials, or traversing data structures.





book Ch10.1-10.2
Algorithm Analysis and Big-Oh Notation