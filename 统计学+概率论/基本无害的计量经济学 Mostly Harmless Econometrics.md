- 理想实验是随机分配（random assignment），但通常做不到，可能违背人性或成本巨大$$
Y_i = 
\begin{cases} 
Y_{1i} & \text{if } D_i = 1 \\
Y_{0i} & \text{if } D_i = 0 
\end{cases}
= Y_{0i} + (Y_{1i} - Y_{0i})D_i. \tag{2.1.1}
$$
- 对于想要研究的潜在因果，我们可以拆分为$$
E[Y_i|D_i = 1] - E[Y_i|D_i = 0] = E[Y_{1i}|D_i = 1] - E[Y_{0i}|D_i = 1] + E[Y_{0i}|D_i = 1] - E[Y_{0i}|D_i = 0]$$其中$$\begin{align*}
E[Y_i|D_i = 1] - E[Y_i|D_i = 0] & \text{ is the observed difference in average health} \\
E[Y_{1i}|D_i = 1] - E[Y_{0i}|D_i = 1] & \text{ is the average treatment effect on the treated} \\
E[Y_{0i}|D_i = 1] - E[Y_{0i}|D_i = 0] & \text{ is the selection bias}\end{align*}$$其中$Y$是个体$i$假设为1住院和0不住院的情况， $D$是个体$i$真实住院情况。我们想知道去医院和不去医院的健康水平差距，而忽略去医院的人呢本身健康状况可能就差于不去医院的人。计量的目的是消除选择偏差的影响，从而判断因果效应。
- 消除选择偏误，最简单的就是对$D_i$进行随机分配，使得患者是否接受治疗和他们无关，条件独立使得选择偏误为0。
- 回归模型中大部分数据是观测数据，而非随机试验产生的数据。
- dependent variable $Y_i$