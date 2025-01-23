```C++
#include <fstream>
ifstream input;
input.open("poem.txt");
string line;
if (input.fail()){
	cout << "womp womp" << endl;
}
else{
	while (getline(input,line)){ // 1.line is put by reference 2.getline返回bool
		cout << line << endl;
	}
}
input.close();
```
> 这个`f.fail()`太容易触发，不建议`while (!input.fail()){getline(input,line);...;}

方法2
```Cpp
#include <fstream>
ifstream input;
input.open(filename);
string word;
while(input >> word){
	cout << word << endl;
}
```

| Member function                | Description                                                               |
|--------------------------------|---------------------------------------------------------------------------|
| `f.clear();`                   | resets stream's error state, if any                                       |
| `f.close();`                   | stops reading file                                                        |
| `f.eof()`                      | returns true if stream is *past* end-of-file (EOF)                        |
| `f.fail()`                     | returns true if the last read call failed (e.g. EOF)                      |
| `f.get()`                      | reads and returns one character                                           |
| `f.open("filename"); f.open(s.c_str());` | opens file represented by given C string (may need to write .c_str() if a C++ string is passed) |
| `f.unget(ch)`                  | un-reads one character                                                    |
| `f >> var`                     | reads data from input file into a variable (like cin); reads one whitespace-separated token at a time |
| `getline(f&, s&)`              | reads line of input into a string by reference; returns a true/false indicator of success            |


| Function name                      | Description                                             |
|------------------------------------|---------------------------------------------------------|
| `createDirectory(name);`           | make a new directory with the given name                |
| `deleteFile(name);`                | erase a file from the disk                              |
| `fileExists(name)`                 | return true if the given file exists on disk            |
| `getCurrentDirectory()`            | return C++ program's directory as a string              |
| `isDirectory(name), isFile(name)`  | return true based on type of file path                  |
| `openFile(ifstream&, name);`       | convenience for opening file by C++ string              |
| `promptUserForFile(ifstream&, prompt)` | repeatedly prompt for existing file's name            |
| `readEntireFile(ifstream&, Lines&);`| read file data into a collection of lines               |
| `renameFile(oldname, newname);`    | change a file's name                                    |








