- 写代码的原则
	- 起名要直白
	- 不要什么都堆`main()`函数，难读难debug
	- 命名函数用动词，表示函数的作用
- functional decomposition
	- Breaking up a task into constituent functions that each fulfill a single purpose is called **functional decomposition** and improves the readability and maintainability of our code.
- **Testing**
	1. `#include` "SimpleTest.h" in your code
	2. Write your own tests using STUDENT_TEST("description of test") { ... }
	3. Populate each SIMPLE_TEST with EXPECT_EQUAL( ... ) statements that verify the results of various operations.
	4. Call runSimpleTests(ALL_TESTS) to cause the tests to be run
	- [test-driven development](https://web.stanford.edu/class/cs106b/resources/testing_guide.html)
	```
	/* * * * * * Test Cases * * * * * */
	PROVIDED_TEST("Demonstrate different SimpleTest use cases") {
	    EXPECT_EQUAL(reversed("but"), "tub");
	    EXPECT_EQUAL(reversed("stanford"), "drofnats");
	}
	```
	- `PROVIDED_TEST`说明测试目的，其后花括号内是测试内容
		- `EXPECT_EQUAL(your_result, expected_result)`检测结果是否和预期一样
		- `EXPECT(expression)`检测True, False
		- `EXPECT_ERROR(expression)`检测是否有error，有error则correct。 `EXPECT_ERROR` is used in the specific situation of confirming expected handling of errors within your code.
		- `EXPECT_NO_ERROR`是上述的反面
		- `TIME_OPERATION(size, expression)`判断需要的时间
	- `main`函数里`runSimpleTests`来决定测试内容
		```
		int main()
		{
		    if (runSimpleTests( <test choice argument> ))
		        return 0;
		
		    ...  // rest of normal main() here
		}
		```
		- The argument to `runSimpleTests` is either:
			- `ALL_TESTS` (run all tests for all files)
			- `SELECTED_TESTS` (provide menu for user to select which tests to run)
			    - The user can enter zero for "no tests", which causes the program to continue with rest of `main()`
- **Abstract Data Types (ADTs): Introduction and Overview**
	- Vector
		- 一种列表，自动expand和shrink
		- 有序，索引从0开始，齐次容器（homogenous container）所有内部数据要同类型
		- 创建Stanford的Vector:
			- `#include` "vector.h"
			- The syntax for creating a vector is as `Vector< **DATA_TYPE** > **VARIABLE_NAME** ;`
			- Optionally, we can provide an initial list of elements that the vector contains: `Vector< **DATA_TYPE** >  **VARIABLE_NAME**  { **ELEMENT_1** , **ELEMENT_2** , ..., **ELEMENT_N** };`
		- C++有自己的vector，小写的。这里用的是Stanford的
		- 使用的函数![[Pasted image 20240102175118.png]]
			- add比insert快很多
	- Grid ADT
		- 向量套向量
		- row-major，创建的时候也是先说row的数量
	- **Passing Containers by Reference**
		- 传参的时候加取址符`&`，省去复制的时间
	- **Common Pitfalls**
		- 注意索引不要超过长度