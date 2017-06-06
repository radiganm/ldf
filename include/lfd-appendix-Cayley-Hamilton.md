
# Appendix A:  Cayley-Hamilton Theorem

The following excerpt is from **Matrix Theory, From Generalized Inverses to Jordan Forms**, by Robert Piziak and P. L. Odell.

[//]: ~ # The Frame Algorithm and the Cayley-Hamilton Theorem

In 1949, **J. Sutherlang Frame** (24 December 1907 - 27 February 1997) published an abstract in the *Bulletin of the American Mathematical Society* indicating a recursive algorithm for computing the inverse of a matrix and, as a by-product, getting additional informaiton, including the famous Cayley-Hamilton theorem.  (Hamilton is the Irish mathematician **William Rowan Hamilton** (4 August 1805 - 2 September 1895), and Cayley is **Aurthur Cayley** (16 August 1821 - 26 January 1895.)  We have not been able to find an actual paper with a detailed account of these claims.  Perhaps the author thought the abstract sufficient and went on with his work in group representations.  Perhaps he was told this algorithm had beeen rediscovered many times (see [House, 1964, p. 72]).  Whatever the case, in this section, we will expand on and expose the details of Frame's algorithm.  Suppose $A \in \mathbf{C}^{n \times n}$.  The *characteristic matrix* of A is $xI - A \in \mathbf{C}\left[x\right]^{n \times n}$, the collection of *n*-by*n* matrices with polynomial entries.  We must open our minds to accepting matrices with polynomial entries.  For example, $\left[ {\begin{array}{cc} x^2+1 & x-3 \\ 4x+2 & x^3-7 \\ \end{array} }\right] \in \mathbf{C}\left[x\right]^{2 \times 2}$.  Determinants work just fine for these kinds of matrices.  The determinant of $xI - A$, $det\left(xI - A\right) \in \mathbf{C}\left[x\right]$, the polynomials in x, and is what we call the *characteristic polynomial* of A:

\begin{equation*}
\mathcal{X}_A\left(x\right) = det\left(xI - A\right) = x^n + c_1 x^{n-1} + \cdots + c_{n-1} x + c_n
\end{equation*}

For example, if $A = \left[ {\begin{array}{ccc} 1 & 2 & 2 \\ 3 & 4 & 5 \\ 6 & 7 & 8 \end{array} }\right] \in \mathbf{C}\left[x\right]^{3x3}$, then $xI_3 - A =$

$\left[ {\begin{array}{ccc} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{array} }\right] \in \mathbf{C}\left[x\right]^{3x3}$.  

Thus $\mathcal{X}_A\left(x\right) = {\begin{vmatrix} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{vmatrix} } = x^3 - 13x^2 -9x - 3$.  This is computed using the usual familiar rules for expanding a determinant.

You may recall that the roots of the characteristic polynomial are quite important, being the *eigenvalues* of the matrix.  We will turn to this topic later.  For now, we focus on the coefficients of the characteristic polynomial.

First, we consider the constant term $c_n$.  You may already know the answer here, but let's make an argument.  Now $det\left(A\right) = \left(-1\right)^n det\left(-1\right) = \left(-1\right)^n det\left(0I - A\right) = \left(-1\right)^n \mathcal(X)_A\left(0\right) = \left(-1\right)^n c_n$.  Therefore, 

\begin{equation*}
det\left(A\right) = \left(-1\right)^n c_n.
\end{equation*}

As a consequence, we see immediately that A is invertible iff $c_n \neq 0$, in which case

\begin{equation*}
A^{-1} = \frac{\left(-1\right)^n}{c_n}adj\left(A\right),
\end{equation*}

where $adj\left(A\right)$ is the adjugate matrix of A introduced previously.  Also recall the important relationship, $B adj\left(B\right) = det\left(B\right)I$.  We conclude that

\begin{equation*}
\left(xI - A\right)adj\left(xI - A\right) = \mathcal{X}_A\left(x\right)I
\end{equation*}

To illustrate with the example above, 
$$ \left(xI - A\right)
= \left[ {\begin{array}{ccc} x-1 & -2 & -2 \\ -3 & x-4 & -5 \\ -6 & -7 & x-8 \end{array} }\right] \cdot \left[ {\begin{array}{ccc} x^2-12x-3 & 2x-2 & 2x+2 \\ 3x+6 & x^2-9x-4 & 5x+1 \\ 6x-3 & 7x+5 & x^2-5x-2 \end{array}} \right]
$$
$$
= \left[ {\begin{array}{ccc} x^3-13x^2-9x-3 & 0 & 0 \\ 0 & x^3-13x^2-9x-3 & 0 \\ 0 & 0 & x^3-13x^2-9x-3 \end{array} }\right] 
$$
$$
= x^3-13x^2-9x-3 \cdots \left[ {\begin{array}{ccc} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} }\right] 
$$

Next, let $C\left(x\right) = adj\left(xI - A\right) \in \mathbf{C}\left[x\right]^{n \times n}$.  We note that the elements of $adj\left(xI - A\right)$ are computed as $\left(n-1\right)-by-\left(n-1\right)$ subdeterminants of $\left(xI - A\right)$, so the highest power that can occur in $C\left(x\right)$ is $x^{n-1}$.  Also, note that we can identify $\mathbf{C}\left[x\right]^{n \times n}$, the *n*-by-*n* matrices with polynomial entries with $\mathbf{C}^{n \times n}\left[x\right]$, the polynomials with matrix coefficients, so we can view $C\left(x\right)$ as a polynomial in $x$ with scalar matrices as coefficients.  For example, 
$$ \left[ {\begin{array}{cc} x^2+1 & x-3 \\ 4x+2 & x^3-7 \end{array} }\right] = $$
$$ \left[ {\begin{array}{cc} 0 & 0 \\ 0 & 1 \end{array} }\right]x^3 + \left[ {\begin{array}{cc} 1 & 0 \\ 0 & 0 \end{array} }\right]x^2 + \left[ {\begin{array}{cc} 0 & 1 \\ 4 & 0 \end{array} }\right]x + \left[ {\begin{array}{cc} 1 & -3 \\ 2 & -7 \end{array} }\right]x.$$  All you do is gather the coefficients of each power of $x$ and make a matrix of scalar coefficients of that power of $x$.  Note that what we have thusly created is an element of $\mathbf{C}\left[x\right]^{n \times n}$, the polynomials in $x# whose coefficients come form the *n*-by*n* matrices over $\mathbf{C}$.  Also note, $xB = Bx$ for all $B \in \mathbf{C}\left[x\right]^{n \times n}$, so it does not matter which side we put the $x$ on.  We now view $C\left(x\right)$ as such an expression in $\mathbf{C}^{n \times n}\left[x\right]:$

$$C\left(x\right) = B_0 x^{n-1} + B_1 x^{n-2} + \cdots + B_{n-2} x + B_{n-1}.$$

These coefficient matrices turn out to be of interest.  For example, $adj\left(A\right) = \left(-1\right)^{n-1}adj\left(-A\right) = \left(-1\right)^{n-1}C\left(0\right) = \left(-1\right)^{n-1}B_{n-1}$, so

\begin{center}
$adj\left(A\right) = \left(-1\right)^{n-1}B_{n-1}$.
\end{center}

Thus, if $c_n \neq 0$, A is invertible and we have

\begin{center}
$A^{-1} = \frac{-1}{c_n}B_{n-1}$.
\end{center}

But now we compute

\begin{equation*}
\begin{split}
\left(xI-A\right)adj\left(xI-A\right) &= \left(xI-A\right)C\left(x\right) \\
                                      &= \left(xI-A\right)\left(B_0x^{n-1}+B_1x^{n-2}+\cdots+B_{n-2}x+B_{n-1}\right) \\
                                      &= x^nI+x^{n-1}c_1I+\cdots+xc_{n-1}I+c_nI
\end{split}
\end{equation*}

and we compare coefficients using the following table:

|Compare Coefficients        |Multiply by             |on the Left               |on the Right                  |
|:---------------------------|:-----------------------|:-------------------------|:-----------------------------|
|$B_0=I$                     |$A^n$                   |$A^nB_0$                  |$A^n$                         |
|$B_1-AB_0=C_1I$             |$A^{n-1}$               |$A^{n-1}B_1-A^nB_0$       |$c_1A^{n-1}$                  |
|$B_2-AB_1=C_2I$             |$A^{n-2}$               |$A^{n-2}B_2-A^{n-1}B_1$   |$c_2A^{n-2}$                  |
|$\vdots$                    |                        |                          |                              |
|$B_k-AB_{k-1}=c_kI$         |                        |                          |                              |
|$\vdots$                    |                        |                          |                              |
|$B_{n-2}-AB_{n-3}=C_{n-2}I$ |$A^2$                   |$A^2B_{n-2}-A^3B_{n-3}$   |$c_{n-2}A^2$                  |
|$B_{n-1}-AB_{n-2}=C_{n-1}I$ |$A$                     |$AB_{n-1}-A^2B_{n-2}$     |$c_{n-1}A$                    |
|$-AB_{n-1}=C_nI$            |                        |$-AB_{n-1}$               |$c_nI$                        |
|column                      |sum =                   |$\mathbf{O} =$            |$\mathcal{X}_A\left(A\right)$ |

So, the first consequence we get from these observations is that the Cayley-Hamilton theorem just falls out as an easy consequence.  (Actually, Liebler [2003] reports that Cayley and Hamilton only established the result for matrices up to size 4-by-4.  He says it was Frobenius (**Ferdinand Georg Frobenius** [26 October 1849 - 3 August 1917] who gave the first complete proof in 1878.)

## THEOREM 2.18 (Cayley-Hamilton theorem)
*For any n-by-n matrix A over $\mathbf{C}, \mathcal{X}_A\left(A\right) = \mathbf{O}$.*

What we are doing in the Cayley-Hamilton theroem is plugging a matrix into a polynomial.  Plugging numbers into a polynomial seems reasonable, almost inevitable, but matrices?  Given a polynomial $$p\left(A\right) = 
4I + 3A - 9A^3 = 
4 \left[ {\begin{array}{ccc} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{array} }\right] 
+3 \left[ {\begin{array}{ccc} 1 & 2 & 2 \\ 3 & 4 & 5 \\ 6 & 7 & 8 \end{array} }\right] 
-9 \left[ {\begin{array}{ccc} 1 & 2 & 2 \\ 3 & 4 & 5 \\ 6 & 7 & 8 \end{array} }\right]^3 
=\left[ {\begin{array}{ccc} -2324 & -2964 & -3432 \\ -5499 & -7004 & -8112 \\ -9243 & -11778 & -13634 \end{array} }\right] ,
$$
The Cayley-Hamilton theorem says that any square matrix is a "root" of its characteristic polynomial.

But there is much more information packed in those euqations on the left of the table, so let's push a little harder.  Notice we can rewrite these equations as

\begin{equation*}
\begin{split}
B_0         &= I                   \\
B_1         &= AB_0 + c_1I         \\
B_2         &= AB_1 + c_2I         \\
            & \vdots               \\
B_{n-1}     &= AB_{n-2} + c_{n-1}I \\
\mathbf{O}  &= AB_{n-1} + c_nI .
\end{split}
\end{equation*}

By setting $B_n := \mathbf{O}$, we have the following recursive scheme clear from above:  for k = 1, 2, ..., n,

\begin{equation*}
\begin{split}
B_0         &= I                   \\
B_k         &= AB_{k-1} + c_kI .
\end{split}
\end{equation*}

In other words, the matrix coefficients, the $B_k$s are given recursively in terms of the $B_{k-1}$s and $c_k$s.  If we can get a formula for the $B_k$ and $c_k$ in terms of $B_{k-1}$, we will get  acomplete set of recurrence formulas for the $B_k$ and $c_k$.  In particular, if we know $B_{n-1}$ and $c_n$, we have $A^{-1}$, provided, of course, $A^{-1}$ exists (i.e. provided $c_n \neq 0$).  For this, let's exploit the recursion given below:

\begin{equation*}
\begin{split}
B_0 = I                                     &                           \\
B_1 = AB_0+c_1I = AI+c_1I                   &= A+c_1I                   \\
B_2 = AB_1+c_2I = A\left(A+c_1I\right)+c_2I &= A^2+c_1A+c_2I            \\
B_3 =                                       &= A^3+c_1A^2+c_2A+c_3I     \\
\vdots                                      &                           \\
\end{split}
\end{equation*}

Inductively, we see for k = 1, 2, ..., n,

\begin{center}
$B_k = A^k + c_1A^{k-1} + \cdots + c_{k-1}A + c_kI .$
\end{center}

Indeed, when k = n, this is just the Cayley-Hamilton theorem all over again.
Now we have for k = 2, 3, ..., n+1, 

\begin{center}
$B_{k-1} = A^{k-1} + c_1A^{k-2} + \cdots + c_{k-2}A + c_{k-1}I .$
\end{center}

If we multiply through by A, we get for k = 2, 3, ..., n+1, 

\begin{center}
$AB_{k-1} = A^k + c_1A^{k-1} + \cdots + c_{k-2}A^2 + c_{k-1}A .$
\end{center}

Now we pull a trick out of the mathematician's hat.  Take the trace of both sizes of the equation using linearity of the trace functional.

\begin{center}
$tr\left(AB_{k-1}\right) = tr\left(A^k\right) + tr\left(c_1A^{k-1}\right) + \cdots + tr\left(c_{k-2}A^2\right) + tr\left(c_{k-1}A\right) .$
\end{center}
\begin{center}
for k = 2, 3, ..., n+1.
\end{center}

Why would anybody think to do such a thing?  Well, the appearance of the coefficients of the characteristic polynomial on the right is very suggestive.  Those who know a little matrix theory realize that the trace of $A^r$ is the sum of the $r^{th}$ powers of the roots of the characteristic polynomial and so Newton's identities leap to mind.  Let $s_r$ denote the sum of the $r^{th}$ powers of roots of the characteristic polynomial.  Thus, for k = 2, 3, ..., n+1, 

\begin{center}
$tr\left(AB_{k-1}\right) = s_k + c_1s_{k-1} + \cdots + c_{k-2}s_2 + c_{k-1}s_1$ .
\end{center}

## Digression on Newton's Identities

Newton's identities go back aways.  They relate the sums of powers of the roots of a polynomial recursively to the coefficients of the polynomial.  Many proofs are available.  Some involve the algebra of symmetric functions, but we do not want to take the time to go there.  Instead, we will use a calculus-baed argument following the ideas of [Eidswick 1968].  First, we need to recall some facts about polynomials.  Let $p\left(x\right) = a_0 + a_1 x + \cdots + a_n x^n$.  Then the coefficients of $p$ can be expressed in terms of derivatives of $p$ evaluated at zero (remember Taylor polynomials?):

\begin{center}
$p\left(x\right) = p\left(0\right) + p^{'}\left(0\right)x + \frac{p^{''}\left(0\right)}{2!}x^2 + \cdots + \frac{p^{\left(n\right)}x^n}{n!}x^n$.
\end{center}

Now here is something really slick.  Let's illustrate a general fact.  Suppose $p\left(x\right) = \left(x-1\right)\left(x-2\right)\left(x-3\right) = -6 + 11x - 6x^2 + x^3$.  Do a wild and crazy thing.  Reverse the rolls [*sic roles*] of the coefficients and form the new reversed polynomial $q\left(x\right) = -6x^3 + 11x^2 - 6x + 1$.  Clearly $q\left(1\right) = 0$ but, more amazingly, $q\left(\frac{1}{2}\right) = -\frac{6}{8} + \frac{11}{4} - \frac{6}{2} + 1= \frac{-6+22-24+8}{8} = 0$.  You can also check $q\left(\frac{1}{3}\right) = 0$.  So the reversed polynomial has as roots the reciprocals of the roots of the original polynomial.  Of course, the roots are not zero for this to work.  This fact is generally true.  Suppose $p\left(x\right) = a_0 + a_1 x + \cdots + a_n x^n$ and the reversed polynomial is $q\left(x\right) = a_n + a_{n-1} x + \cdots + a_0 x^n$.  Note

\begin{center}
$q\left(0\right) = a_n, q^{'}\left(0\right) = a_{n-1}, \cdots , \frac{q^{\left(n\right)}\left(0\right)}{n!} = a_0$.
\end{center}

Then $r \neq 0$ is a root of p iff $\frac{1}{r}$ is a root of q.

Suppose $p\left(x\right) = a_0 + a_1 x + \cdots + a_n x^n = a_n \left(x-r_1\right)\left(x-r_2\right)\cdots\left(x-r_n\right)$.  The $r_i$s are, of course, the roots of $p$, which we assume to be nonzero but not necessarily distinct.  Then the reversed polynomial $q\left(x\right) = a_n + a_{n-1} x + \cdots + a_0 x^n = a_0 \left(x-\frac{1}{r_1}\right)\left(x-\frac{1}{r_2}\right)\cdots\left(x-\frac{1}{r_n}\right)$.  For the sake of illustration, suppose $n=3$.  

Then form $$f\left(x\right) = \frac{q^{'}\left(x\right)}{q\left(x\right)} = \frac{ \left(x-r_1^{-1}\right) \left[ \left( x-r_2^{-1} \right) + \left( x-r_3^{-1} \right) \right] \left[ \left( x-r_2^{-1} \right) + \left( x-r_3^{-1} \right) \right] }{ \left( r-r_1 \right) \left( r-r_2 \right) \left( r-r_3 \right) }$$
$$= \frac{1}{x-r_1^{-1}} + \frac{1}{x-r_2^{-1}} + \frac{1}{x-r_3^{-1}}$$.  Generally then,

\begin{center}
$f\left(x\right) = \sum\limits_{k=1}^{n}\frac{1}{\left(x-r_k^{-1}\right)}$.
\end{center}

Let's introduce more notation.  Let $s_m = \sum\limits_{k=1}^m$ for $m = 1,2,3,\cdots$.  Thus, $s_m$ is the sum of the $m^{th}$ powers of roots of $p$.  The derivatives of $f$ are intimately related to the $s$s.  Basi differentiation yields

$$\begin{array}{cccc}
           &                                                                & f(0)      & = -s_1       \\
f(^{'}(x)  & = \sum\limits_{k=1}^n\frac{-1}{\left(x-r_k^{-1}\right)^2}      & f^{'}(0)  & = -s_2       \\
f(^{''}(x) & = \sum\limits_{k=1}^n\frac{-2}{\left(x-r_k^{-1}\right)^3}      & f^{''}(0) & = -2s_3      \\
\vdots     \\
f(^{k}(x)  & = \sum\limits_{k=1}^n\frac{-k!}{\left(x-r_k^{-1}\right)^{k+1}} & f^{k}(0)  & = -k!s_{k+1} \\
\end{array}$$.

The last piece of the puzzle is the rule of taking the derivative of a product;  this is the so-called *Leibnitz rule* for differentiating a product:

\begin{center}
$D^n(F(x)G(x)) = \sum\limits_{j=0}^n{n \choose j}F^{(j)}G^{(n-j)}(x)$.
\end{center}

All right, let's do the argument.  We have $f\left(x\right) = \frac{q^{'}\left(x\right)}{q\left(x\right)}$, so $q^{'}\left(x\right) = f\left(x\right)q\left(x\right)$.

Therefore, using Leibnitz rule

\begin{equation*}
q^{\left(m\right)}\left(x\right) = \left[ f\left(x\right) q\left(x\right) \right]^{\left(m-1\right)} = \sum\limits_{k=0}^{m-1}{m-1 \choose k} f\left(x\right) q^{\left(m-1-k\right)}\left(x\right).
\end{equation*}

Plugging in zero, we get

\begin{center}
\end{center}


\begin{equation*}
\begin{split}
q^{\left(m\right)}\left(0\right) &= \sum\limits_{k=0}^{m-1}{m-1 \choose k} f\left(0\right) q^{\left(m-1-k\right)}\left(0\right) \\
                                 &= \sum\limits_{k=0}^{m-1} \frac{\left(m-1\right)!}{k!\left(m-1-k\right)!} \left(-k!\right) s_{k+1} q^{\left(m-1-k\right)}\left(0\right).
\end{split}
\end{equation*}

Therefore,

\begin{center}
$\frac{q^{\left(m\right)}\left(0\right)}{m!} = - \frac{1}{m} \sum\limits_{k=0}^{m-1} \frac{q^{\left(m-1-k\right)}\left(0\right)}{\left(m-1-k\right)!} s_{k+1}$.
\end{center}

One more substitution and we have the *Newton identities*

\begin{equation*}
\begin{split}
0 &= ma_{n-m} = \sum\limits_{k=0}^{m-1}a_{n-m+k+1}s_{k+1} \mbox{ if } 1 \leq m \leq n \\
0 &= \sum\limits_{k=m-n-1}^{m-1}a_{n-m+k+1}s_{k+1} \mbox{ if } m > n. \\
\end{split}
\end{equation*}

{# *EOF* #}
