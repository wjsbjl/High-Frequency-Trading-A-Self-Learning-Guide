- Vedio 14 05:29
- Book 11.2, 11.4; 12.1-12.3
## Summary
- `const`用于声明不可被改变的对象
## The keyword `const`

- **a const reference parameter can't be modified by the function:**
  ```cpp
  void foo(const BankAccount& ba) {
  ```

- **a const member function can't change the object's state:**
  ```cpp
  class BankAccount {
      ...
      double getBalance() const;
  }
  ```
