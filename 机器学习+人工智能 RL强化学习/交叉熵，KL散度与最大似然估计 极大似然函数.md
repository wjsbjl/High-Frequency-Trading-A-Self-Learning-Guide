## 交叉熵，KL散度
- **KL散度**（Kullback-Leibler divergence，库尔贝克-莱布勒散度）或相对熵，用于衡量从概率分布$P$到概率分布$Q$的不精确性。其定义为：$$D_{KL}(P \parallel Q) = \sum_{x} P(x) \log \frac{P(x)}{Q(x)}$$
	- 是一种比较特殊的距离度量，衡量的是x处两个分部之间的距离。没有对称性，但是非负
	- 其中$P$是真实分布，而$Q$是模型预测的分布。
- **交叉熵**（Cross-Entropy）是一种衡量两个概率分布之间差异的度量方法，常用于分类任务中的损失函数，特别是在神经网络中处理多分类问题时，定义为：$$H(P, Q) = -\sum_{x} P(x) \log Q(x)$$
	- 用数学语言描述，设时间$X_i$发生的概率为$P(X_i)$，那么$X_i$发生所能提供的信息是：$$I(X_i)=-\log P(X_i)$$确定发生的时间不会提供任何信息。
	- 交叉熵计算的是在给定模型预测分布$Q$的情况下，描述真实分布$P$所需的平均比特数（或其他对数基底的单位）。
- KL散度和交叉熵
	- 两者的关系可以这样描述：当你使用交叉熵最小化分类问题的损失时，实际上是在尝试最小化真实分布$P$和预测分布$Q$之间的 KL 散度加上真实分布的熵$H(P)$：$$H(P, Q) = H(P) + D_{KL}(P \parallel Q)$$
	- 这里的$H(P)$是常数（如果$P$是固定的），因此在优化过程中，最小化交叉熵与最小化 KL 散度之间的差异仅在于一个不依赖于模型参数的常数项。这意味着，从优化的角度看，最小化交叉熵与最小化 KL 散度是等价的。这也是为什么通常会说“KL散度和 CE 差一个常数”。
- 交叉熵和最大似然估计
	- 为什么MLE有效呢，假定 $X \sim P_{\mathcal{D}}$, 我们想用 $P_\theta$ 去拟合 $P_{\mathcal{D}}$, 在统计中我们一般是利用极大似然估计$$
\hat{\theta}=\underset{\theta}{\operatorname{argmax}} \mathbb{E}_{x \sim P_{\mathcal{D}}}\left[\log P_\theta(x)\right] .
$$改写一下有$$
\begin{aligned}
\hat{\theta} & =\underset{\theta}{\operatorname{argmax}} \mathbb{E}_{x \sim P_{\mathcal{D}}}\left[\log P_\theta(x)\right] \\
& =\underset{\theta}{\operatorname{argmax}} \sum_x P_{\mathcal{D}}(x) \log P_\theta(x)  =\underset{\theta}{\operatorname{argmax}} \sum_x P_{\mathcal{D}}(x) \log P_\theta(x)-\sum_x P_\mathcal{D}(x) \log P_\mathcal{D}(x)\\
& =\underset{\theta}{\operatorname{argmax}} \sum_x P_{\mathcal{D}}(x) \log \frac{P_\theta(x)}{P_{\mathcal{D}}(x)} \\
& =\underset{\theta}{\operatorname{argmin}} \sum_x P_{\mathcal{D}}(x) \log \frac{P_{\mathcal{D}}(x)}{P_\theta(x)} . \\
& =\underset{\theta}{\operatorname{argmin}} D_{\mathbb{K L}}\left(P_{\mathcal{D}}(x) \| P_\theta(x)\right) .
\end{aligned}
$$这说明最大对数函数等价于最小化$P_{\mathcal{D}}$与$P_\theta$的KL散度
## 最大似然估计（maximum likelihood estimation，MLE）
```
最大化预测正确的概率
```
[交叉熵与最大似然估计](https://hml.boyuai.com/books/chapter6#65-%E4%BA%A4%E5%8F%89%E7%86%B5%E4%B8%8E%E6%9C%80%E5%A4%A7%E4%BC%BC%E7%84%B6%E4%BC%B0%E8%AE%A1)
确定了逻辑斯谛回归的数学模型之后, 我们接下来还需要确定优化目标。对于有关概率分布的问题, 我们常常使用最大似然估计（maximum likelihood estimation, MLE）的思想来优化模型, 也即是寻找逻辑斯谛回归的参数 $\boldsymbol{\theta}$ 使得模型在训练数据上预测出正确标签的概率最大。

设共有 $N$ 个样本 $\boldsymbol{x}_1, \ldots, \boldsymbol{x}_N$, 类别分别是 $y_1, \ldots, y_N$ 。对于样本 $\boldsymbol{x}_i$, 如果 $y_i=0$, 那么模型预测正确的概率为 $1-f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)$; 如果 $y_i=1$, 那么概率为 $f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)$ 。将两者综合起来, 可以得到模型正确的概率为
$f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)^{y_i}\left(1-f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)\right)^{1-y_i}$ 。假设样本之间是两两独立的, 那么模型将所有样本的分类都预测正确的概率就等于单个样本概率的乘积:
$$
L(\boldsymbol{\theta})=\prod_{i=1}^N f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)^{y_i}\left(1-f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)\right)^{1-y_i}
$$

该函数也称为似然函数（likelihood function）。为了使模型的预测尽可能准确，我们需要寻找使似然函数最大的参数 $\boldsymbol{\theta}$ 。但是, 该函数的连乘形式使得求导和优化都很困难, 在计算机上直接计算甚至很容易造成浮点数越界。因此, 我们一般将似然值取对数, 也即是对数似然（log-likelihood）, 将连乘转化为求和：
$$
l(\boldsymbol{\theta})=\log L(\boldsymbol{\theta})=\sum_{i=1}^N\left[y_i \log f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)+\left(1-y_i\right) \log \left(1-f_{\boldsymbol{\theta}}\left(\boldsymbol{x}_i\right)\right)\right]
$$

由于对数函数是单调递增的, 优化 $l(\boldsymbol{\theta})$ 和 $L(\boldsymbol{\theta})$ 可以得到相同的结果。于是, 我们的优化目标为：
$$
\max _{\boldsymbol{\theta}} l(\boldsymbol{\theta})
$$
## 交叉熵
