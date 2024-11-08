### Key Concepts in Batch Scripting

1. **Commands Run Line-by-Line**:
    
    - In a batch script, each line is a separate command that runs sequentially unless conditional statements (like `if` or `goto`) alter the flow.
    - This is similar to shell scripting, but batch scripts require different syntax, especially for conditions and loops.
2. **Environment Variables**:
    
    - Variables in batch scripts are defined using `set`, like this:
        
        bat
        
        复制代码
        
        `set myvar=Hello echo %myvar%`
        
    - To access a variable, you need `%` signs around it (`%myvar%`), unlike `$myvar` in shell.
3. **`if` Statements**:
    
    - Batch uses `if` for conditions, similar to shell, but the syntax is different. Here’s a simple example:
        
        bat
        
        复制代码
        
        `if %myvar%==Hello echo It's Hello!`
        
    - Unlike in shell scripts, you use `==` for comparison and `%errorlevel%` to check the success of a command:
        
        bat
        
        复制代码
        
        `if %errorlevel% neq 0 echo Command failed`
        
    - `neq` stands for “not equal,” and there are others like `equ` (equal), `gtr` (greater than), `lss` (less than).
4. **Control Flow with `goto`**:
    
    - Batch scripts use `goto` to jump to specific parts of the script, often to exit if there’s an error:
        
        bat
        
        复制代码
        
        `goto end :end echo Script finished`
        
    - This is somewhat like a `break` in shell scripts but provides more control over jumping to a specific part of the script.
5. **Redirection (`>` and `>>`)**:
    
    - Similar to shell scripting, you can redirect output:
        - `>` overwrites a file, like `>` in shell.
        - `>>` appends to a file, similar to `>>` in shell.
    - You can also redirect error output with `2>` and combine standard output and error with `2>&1`.
6. **Loops (For Loops)**:
    
    - Batch files have a limited looping capability, using `for` loops for iteration:
        
        bat
        
        复制代码
        
        `for %%i in (1 2 3) do echo %%i`
        
    - This syntax differs from the `for i in {1..3}` approach in shell, but the concept is similar.