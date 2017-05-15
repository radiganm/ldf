
# Chapter 2 Notes

|Symbol                                   | Name                          |
|:---------------------------------------:|:------------------------------|
|$h(x_k) \exists x_k \in \mathcal(X)$     |Dichotomy                      |
|$N$                                      |Number of Data Points          |
|$m_\mathcal{H}(N)$                       |Growth Function                |
|$m_\mathcal{H}(N)$                       |Growth Function                |
|$B\left(N,k\right)$                      |Growth Bound with Breakpoint k |
|$d_{vc}$                                 |Vapnik-Chervonenkis Dimension  |

## Generalization Error

\begin{equation}
E_{out}(g) \leq E_{in}(g) + \sqrt{\frac{1}{2N}ln\frac{2M}{\delta}}
\end{equation}

## Growth Function
\begin{equation}
m_{\mathcal{H}}(N) = \max_{\vec{x} \in \mathcal{X}} |\mathcal{H}(\vec{x})|
\end{equation}

## Bounding the Growth Function

$B\left(N,k\right)$ is the maximum number of dichotomies on N points such that no subset of size k of the N points can be shattered by these dichotomies.

## Vapnik-Chervonenkis Dimension
\begin{equation}
d_{VC}(\mathcal{H}) = 
\begin{cases}
\max N \mbox{ s.t. } m_{\mathcal{H}}(N) = 2^N & \mbox{ if } m_{\mathcal{H}}(N) < 2^N \exists N \\
\infty & \mbox{ if } m_{\mathcal{H}}(N) = 2^N \forall N \\
\end{cases}
\end{equation}

$k = d_{VC} + 1$ is a breakpoint for $m_{\mathcal{H}}(N)$

$m_{\mathcal{H}}(N) \leq \Sigma_{i=0}^{d_{VC}}{N \choose i}$

$m_{\mathcal{H}}(N) \leq N^{d_{VC}} + 1$

## Sauer's Lemma

\begin{equation}
B\left(N,k\right) \leq \Sigma_{i=0}^{k-1}{N \choose i}
\end{equation}
