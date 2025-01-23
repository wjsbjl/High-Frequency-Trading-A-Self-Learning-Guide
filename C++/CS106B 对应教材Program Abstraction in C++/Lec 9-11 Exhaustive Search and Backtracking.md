- Lecture 9，Vedio 8
	- 讲了几个例子，用递归穷举
	- backtracking是指测试完删去，例如摇两个骰子总和为6，
- Lecture 10, Vedio 9
- Lecture 11, Vedio 10
- book Ch8.2-8.3; 9
# Backtracking

## A general pseudo-code algorithm for backtracking:

```cpp
function Explore(decisions):
    - If there are decisions left to make:
        // Let's handle one decision ourselves, and the rest by recursion.
        For each available choice C for my decision:
            - Choose C.
            - Explore the remaining decisions that could follow C.
            - Un-choose C. (backtrack!)
    - Otherwise, if there are no more decisions to make: Stop.

Key tasks:
    - Figure out appropriate smallest unit of work (decision).
    - Figure out how to enumerate all possible choices/options for it.
```

recursionIndent挺好用的，但没找到对应代码
## sublist
![[Pasted image 20250113203639.png]]
## Eight Queens
- 八个queen不能见面
- 挺直观的，if col到头就输出结果；else对row循环，if safe就放下一个col，if外面再撤回这个棋子。