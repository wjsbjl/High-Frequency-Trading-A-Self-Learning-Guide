## 概述
用[[时序差分]]方法更新Q值，用$\varepsilon-$贪婪算法选取动作，进而动作价值更新用到了当前状态 $s$ 、当前动作 $a$ 、获得的奖励 $r$ 、下一个状态 $s^{\prime}$ 和下一个动作 $a^{\prime}$，这也是名字的来源。
## 引用
既然我们可以用时序差分方法来估计价值函数, 那一个很自然的问题是, 我们能否用类似策略迭代的方法来进行强化学习。策略评估已经可以通过时序差分算法实现，那么在不知道奖励函数和状态转移函数的情况下该怎么进行策略提升呢? 答案是时可以直接用时序差分算法来估计动作价值函数 $Q$ :
$$
Q\left(s_t, a_t\right) \leftarrow Q\left(s_t, a_t\right)+\alpha\left[r_t+\gamma Q\left(s_{t+1}, a_{t+1}\right)-Q\left(s_t, a_t\right)\right]
$$

然后我们用贪婪算法来选取在某个状态下动作价值最大的那个动作, 即 $\arg \max _a Q(s, a)$ 。这样似乎已经形成了一个完整的强化学习算法：用贪婪算法根据动作价值选取动作来和环境交互，再根据得到的数据用时序差分算法更新动作价值估计。

然而这个简单的算法存在两个需要进一步考虑的问题。第一, 如果要用时序差分算法来准确地估计策略的状态价值函数, 我们需要用极大量的样本来进行更新。但实际上我们可以忽略这一点, 直接用一些样本来评估策略, 然后就可以更新策略了。我们可以这么做的原因是策略提升可以在策略评估未完全进行的情况进行, 回顾一下, 价值迭代（参见 4.4 节）就是这样, 这其实是广义策略迭代（generalized policy iteration）的思想。第二, 如果在策略提升中一直根据贪婪算法得到一个确定性策略, 可能会导致某些状态动作对 $(s, a)$ 永远没有在序列中出现, 以至于无法对其动作价值进行估计, 进而无法保证策略提升后的策略比之前的好。我们在第 2 章中对此有详细讨论。简单常用的解决方案是不再一味使用贪婪算法, 而是采用一个 $\epsilon$-贪婪策略：有 $1-\epsilon$ 的概率采用动作价值最大的那个动作, 另外有 $\epsilon$ 的概率从动作空间中随机采取一个动作，其公式表示为：
$$
\pi(a \mid s)= \begin{cases}\epsilon /|\mathcal{A}|+1-\epsilon & \text { 如果 } a=\arg \max _{a^{\prime}} Q\left(s, a^{\prime}\right) \\ \epsilon /|\mathcal{A}| & \text { 其他动作 }\end{cases}
$$

现在, 我们就可以得到一个实际的基于时序差分方法的强化学习算法。这个算法被称为 Sarsa, 因为它的动作价值更新用到了当前状态 $s$ 、当前动作 $a$ 、获得的奖励 $r$ 、下一个状态 $s^{\prime}$ 和下一个动作 $a^{\prime}$, 将这些符号拼接后就得到了算法名称。Sarsa 的具体算法如下:
- 初始化 $Q(s, a)$
- for 序列 $e=1 \rightarrow E$ do:
- 得到初始状态 $S$
- 用 $\epsilon$-greedy 策略根据 $Q$ 选择当前状态 $s$ 下的动作 $a$
- for 时间步 $t=1 \rightarrow T$ do :
- 得到环境反馈的 $r, s^{\prime}$
- 用 $\epsilon$-greedy 策略根据 $Q$ 选择当前状态 $s^{\prime}$ 下的动作 $a^{\prime}$
- $Q(s, a) \leftarrow Q(s, a)+\alpha\left[r+\gamma Q\left(s^{\prime}, a^{\prime}\right)-Q(s, a)\right]$
- $s \leftarrow s^{\prime}, a \leftarrow a^{\prime}$
- $\quad$ end for
- end for