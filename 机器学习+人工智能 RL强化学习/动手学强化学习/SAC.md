-  <span style=color:red>根据高斯分布来采样动作的过程是不可导的。因此，我们需要用到重参数化技巧（reparameterization trick）</span>
- 连续变离散
	- 策略网络输出修改为离散动作空间上的softmax分布
	- 价值网络输入为状态和离散动作空间上的分布