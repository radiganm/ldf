
# Problem 1.3

Prove that the PLA eventually converges to a linear separator for separable data. The following steps will guide you through the proof. Let $w^*$ be an optimal set of weights (one which separates the data). The essential idea in this proof is to show that the PLA weights $w(t)$ get "more aligned" with $w^*$ with every iteration. For simplicity, assume that $w(0) = 0$.

(a) Let $\rho = min_{1 \leq n \leq N}(w^{*\intercal} x_n)$.  Show that $\rho > 0$.

(b) Show that $w^\intercal(t) w^* \geq w^\intercal(t-1) w^* + \rho$, and conclude that $w^\intercal(t) \geq t \rho$.

(c) Show that $\left\lVert w(t) \right\rVert^2 \leq \left\lVert w(t-1) \right\rVert + \left\lVert w(t-1) \right\rVert^2$. 

[Hint: $y(t-1) \cdot (w^\intercal(t-1) x(t-1)) \leq 0$ because $x(t-1)$ was misclassified by $w(t-1)$.]

(d) Show by induction that $\left\lVert w(t) \right\rVert^2 \leq tR^2$, where $R = max_{1 \leq n \leq N} \left\lVert x_n \right\rVert$.

(e) Using (b) and (d), show that

$\frac{w^\intercal}{\left\lVert w(t) \right\rVert^2} w^* \geq \sqrt{t} \cdot \frac{\rho}{R}$,

and hence prove that

$t \leq \frac{R^2 \left\lVert w^* \right\rVert^2}{\rho^2}$.

[Hint: $\frac{w^\intercal(t) w^*}{\left\lVert w(t) \right\rVert \left\lVert w^* \right\rVert} \leq 1$.  Why?]

In practice, PLA converges more quickly than the bound $\frac{R^2 \left\lVert w^* \right\rVert^2}{\rho^2}$ suggests. Nevertheless, because we do not know p in advance, we can't determine the number of iterations to convergence, which does pose a problem if the data is non-separable.

