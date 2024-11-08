多进程
`pandarallel.initialize()`和`df.parallel_apply`

```python
import pandas as pd
from pandarallel import pandarallel

# 初始化
pandarallel.initialize()

# 创建一个简单的DataFrame
df = pd.DataFrame({
    'A': range(1, 6),
    'B': range(10, 15)
})

# 定义一个简单的函数，例如计算每列的两倍
def multiply_by_two(x):
    return x * 2

# 使用parallel_apply并行应用函数
result = df.parallel_apply(multiply_by_two, axis=0)
```
