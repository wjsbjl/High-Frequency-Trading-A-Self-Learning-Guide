## 笔记
- DQN
	- 状态连续，动作离散，估计函数f(s,a) $\mapsto$ Q，动作离散可以直接$f(s)\mapsto Q$
	- 由时序差分（temporal difference，TD）产生构建损失函数的灵感
	- 经验回放（experience replay），独立同分布所以随机抽样拿样本
	- 目标网络（target network），因为TD误差本就包含神经网络的输出，所以更新网络参数同时目标也在改变。所以在损失函数的两个Q中，训练网络$Q_\omega(s,a)$时刻更新，目标网络$Q_{\omega^-}(s',a')$每C步更新一次
- 深度双Q网络（DDQN）和基于竞争构架Q网络（_Dueling_-_DQN_）
- DDQN
	- DDQN改进了DQN在计算状态$s'$下Q值时选取动作的方法
	- DQN 的优化目标可以写为 $r+\gamma Q_{\omega^{-}}\left(s^{\prime}, \arg \max _{a^{\prime}} Q_{\omega^{-}}\left(s^{\prime}, a^{\prime}\right)\right)$, 动作的选取依靠目标网络 $Q_{\omega^{-}}$;
	- Double DQN 的优化目标为 $r+\gamma Q_{\omega^{-}}\left(s^{\prime}, \arg \max _{a^{\prime}} Q_\omega\left(s^{\prime}, a^{\prime}\right)\right)$, 动作的选取依靠训练网络 $Q_\omega$ 
- Dueling-DQN
	- 把状态动作价值函数Q拆分为状态价值函数V和优势函数A
	- $Q_{\eta, \alpha, \beta}(s, a)=V_{\eta, \alpha}(s)+A_{\eta, \beta}(s, a)$
	- 训练有A+1个输出，从而让策略重点在环境本身和不同动作优势值之间切换
- 实际运行中Dueling-DQN比DDQN好
## 思考
240621 目标是复刻D3QN，Dueling Double Deep Q-learning Network
- DQN
	- 聚焦于连续状态离散动作，股价等确实可以看成连续的状态
	- 更新规则是[[时序差分]]（改进版的[[增量式更新期望的方法（均值）]]）$$
Q(s, a) \leftarrow Q(s, a)+\alpha\left[r+\gamma \max _{a^{\prime} \in \mathcal{A}} Q\left(s^{\prime}, a^{\prime}\right)-Q(s, a)\right]
$$
	- 上述公式用时序差分 (temporal difference, TD) 学习目标 $r+\gamma \max _{a^{\prime} \in \mathcal{A}} Q\left(s^{\prime}, a^{\prime}\right)$ 来增量式更新 $Q(s, a)$, 也就是说要使 $Q(s, a)$ 和 TD 目标 $r+\gamma \max _{a^{\prime} \in \mathcal{A}} Q\left(s^{\prime}, a^{\prime}\right)$ 靠近。于是, 对于一组数据 $\left\{\left(s_i, a_i, r_i, s_i^{\prime}\right)\right\}$, 我们可以很自然地将 $\mathrm{Q}$ 网络的损失函数构造为均方误差的形式:$$
\omega^*=\arg \min _\omega \frac{1}{2 N} \sum_{i=1}^N\left[Q_\omega\left(s_i, a_i\right)-\left(r_i+\gamma \max _{a^{\prime}} Q_\omega\left(s_i^{\prime}, a^{\prime}\right)\right)\right]^2
$$
	- 240624 看了代码，写的真好
- Double DQN
	- 动作选取变了
		- DQN 的优化目标可以写为 $r+\gamma Q_{\omega^{-}}\left(s^{\prime}, \arg \max _{a^{\prime}} Q_{\omega^{-}}\left(s^{\prime}, a^{\prime}\right)\right)$, 动作的选取依靠目标网络 $Q_{\omega^{-}}$;
		- Double DQN 的优化目标为 $r+\gamma Q_{\omega^{-}}\left(s^{\prime}, \arg \max _{a^{\prime}} Q_\omega\left(s^{\prime}, a^{\prime}\right)\right)$, 动作的选取依靠训练网络 $Q_\omega$ 。
	- 240624 看了代码，可以开始做了，优化的后面再想
- 结果保存[[DQN Model Saving and Loading]]