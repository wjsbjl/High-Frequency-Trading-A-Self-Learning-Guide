通过使用 abc.ABC 和 @abstractmethod，你可以定义一个抽象基类和抽象方法，以下为
比较：空方法 vs 抽象基类和抽象方法
## 基本方式：定义空方法
你可以在类中定义一个空方法，通过在 `def` 后直接使用 `pass`：

```python

class BaseClass:

def method(self):

pass

```

  

这种方式定义了一个空方法，但它有一些缺陷：

- **无法强制实现**：子类可以选择不实现这个方法，而不会报错。

- **无明确意图**：这种方法没有明确表示这个方法是需要子类实现的，仅仅是一个空的方法。

  

## 使用抽象基类和抽象方法

  

通过使用 `abc.ABC` 和 `@abstractmethod`，你可以定义一个抽象基类和抽象方法：

  

```python

from abc import ABC, abstractmethod

  

class BaseClass(ABC):

@abstractmethod

def method(self):

pass

```

  

这种方式有以下优点：

- **强制实现**：子类必须实现所有的抽象方法，否则实例化子类会报错。

- **明确意图**：通过 `@abstractmethod` 明确表明这个方法是抽象方法，必须在子类中实现。

- **实例化限制**：无法直接实例化抽象类，只能实例化其子类。

  

## 具体示例

  

让我们通过具体示例来对比这两种方式。

  

### 示例 1：使用空方法

  

```python

class BaseClass:

def method(self):

pass

  

class SubClass(BaseClass):

pass

  

# 可以实例化SubClass，即使它没有实现method方法

sub = SubClass()

sub.method() # 不会报错，但什么也不做

```

  

在这个例子中，即使 `SubClass` 没有实现 `method` 方法，也不会报错。这违背了我们设计抽象方法的初衷。

  

### 示例 2：使用抽象基类和抽象方法

  

```python

from abc import ABC, abstractmethod

  

class BaseClass(ABC):

@abstractmethod

def method(self):

pass

  

class SubClass(BaseClass):

pass

  

# 尝试实例化SubClass会报错，因为它没有实现method方法

# sub = SubClass() # TypeError: Can't instantiate abstract class SubClass with abstract methods method

  

class ConcreteSubClass(BaseClass):

def method(self):

print("Method implemented in subclass")

  

# 现在可以实例化ConcreteSubClass，因为它实现了method方法

sub = ConcreteSubClass()

sub.method() # 输出: Method implemented in subclass

```

  

在这个例子中：

- 尝试实例化 `SubClass` 会报错，因为它没有实现 `method` 方法。

- 只有实现了所有抽象方法的子类 `ConcreteSubClass` 才能被实例化。

  

## 为什么要使用抽象基类和抽象方法

  

1. **强制实现**：抽象基类强制子类实现所有抽象方法，确保接口的一致性。

2. **明确意图**：通过 `@abstractmethod` 装饰器，明确表明哪些方法是必须在子类中实现的，增强代码的可读性和可维护性。

3. **实例化限制**：抽象基类不能被实例化，只能作为其他类的基类，避免了错误的实例化操作。

  

## 总结

  

虽然定义空方法可以提供基本的接口，但使用抽象基类和抽象方法可以提供更强的约束和更明确的意图。通过使用 `abc.ABC` 和 `@abstractmethod`，你可以确保子类实现所有必要的方法，从而实现更可靠和可维护的代码设计。