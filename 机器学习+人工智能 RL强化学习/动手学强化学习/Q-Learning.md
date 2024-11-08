- 更新规则基于[[时序差分]]，为$$
Q\left(s_t, a_t\right) \leftarrow Q\left(s_t, a_t\right)+\alpha\left[R_t+\gamma \max _a Q\left(s_{t+1}, a\right)-Q\left(s_t, a_t\right)\right]
$$
- 即$V_\pi(s_{t+1})$取为$\max _a Q\left(s_{t+1}, a\right)$

Q-learning 算法的具体流程如下:
- 初始化 $Q(s, a)$
- for 序列e $=1 \rightarrow E$ do:
- 得到初始状态 $s$
- for 时间步 $t=1 \rightarrow T$ do :
- 用 $\epsilon$-greedy 策略根据 $Q$ 选择当前状态 $s$ 下的动作 $a$
- 得到环境反馈的 $r, s^{\prime}$
- $Q(s, a) \leftarrow Q(s, a)+\alpha\left[r+\gamma \max _{a^{\prime}} Q\left(s^{\prime}, a^{\prime}\right)-Q(s, a)\right]$
- $s \leftarrow s^{\prime}$
- end for
- end for

我们可以用价值迭代的思想来理解 Q-learning, 即 Q-learning 是直接在估计 $Q^*$, 因为动作价值函数的贝尔曼最优方程是
$$
Q^*(s, a)=r(s, a)+\gamma \sum_{s^{\prime} \in \mathcal{S}} P\left(s^{\prime} \mid s, a\right) \max _{a^{\prime}} Q^*\left(s^{\prime}, a^{\prime}\right)
$$

而 Sarsa 估计当前 $\epsilon$-贪婪策略的动作价值函数。需要强调的是, Q-learning 的更新并非必须使用当前贪心策略 $\arg \max _a Q(s, a)$采样得到的数据, 因为给定任意 $\left(s, a, r, s^{\prime}\right)$ 都可以直接根据更新公式来更新 $Q$, 为了探索, 我们通常使用一个 $\epsilon$-贪婪策略来与环境交互。Sarsa 必须使用当前 $\epsilon$-贪婪策略采样得到的数据, 因为它的更新中用到的 $Q\left(s^{\prime}, a^{\prime}\right)$ 的 $a^{\prime}$ 是当前策略在 $s^{\prime}$ 下的动作。我们称 Sarsa 是在线策略（on-policy）算法, 称 Q-learning 是离线策略（off-policy）算法, 这两个概念强化学习中非常重要。