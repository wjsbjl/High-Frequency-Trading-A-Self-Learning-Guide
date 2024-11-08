```python
test_dict={}
test_dict['a']=df.iloc[-1,:]
test_dict.get('a',None) # 找a键对应的值，没有就返回None，类似最新的
```