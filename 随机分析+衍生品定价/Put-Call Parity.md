## Put and Call
终端支付: Call $(S-K)_+$, Put $(K-S)_+$

解析解：
Under this formulation the arbitrage-free price implied by the Black-Scholes model can be shown to be:
$$
C\left(S_t, t\right)=e^{-r(T-t)}\left[F N\left(d_1\right)-K N\left(d_2\right)\right]
$$
and
$$
P\left(S_t, t\right)=e^{-r(T-t)}\left[K N\left(-d_2\right)-F N\left(-d_1\right)\right]
$$
where now
$$
F=S_t e^{(r-q)(T-t)}
$$
is the modified forward price that occurs in the terms $d_1, d_2$ :
$$
d_1=\frac{1}{\sigma \sqrt{T-t}}\left[\ln \left(\frac{S_t}{K}\right)+\left(r-q+\frac{1}{2} \sigma^2\right)(T-t)\right]
$$
and
$$
d_2=d_1-\sigma \sqrt{T-t}=\frac{1}{\sigma \sqrt{T-t}}\left[\ln \left(\frac{S_t}{K}\right)+\left(r-q-\frac{1}{2} \sigma^2\right)(T-t)\right]
$$
## Put Call Parity
$C(t)-P(t)=S(t)-KB(t,T)$
