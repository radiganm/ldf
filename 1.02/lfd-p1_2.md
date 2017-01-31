
# Problem 1.2 

Consider the perceptron in two dimensions: $h(x) = sign(w^\intercal x)$ where $w = [w_0,w_1,w_2]$ and $x = [1,x_1,x_2]$. Technically, $x$ has three coordinates, but we call this perceptron two-dimensional because the first coordinate is fixed at 1.

(a) Show that the regions on the plane where $h(x) = +1$ and $h(x) = -1$ are separated by a line. If we express this line by the equation $x_2 = a x_1 + b$, what are the slope a and intercept $b$ in terms of $w_0$, $w_1$, $w_2$?

$w^\intercal x = 0$

$\implies w_0 x_0 + w_1 + x_1 + w_2 x_2 = 0$

$\implies w_2 x_2 = -w_1 x_1 - w_0 x_0 = -w_1 x_1 - x_0$

$\implies x_2 = -\frac{w_1}{w_2} x_2 - \frac{w_0}{w_2}$

$a = -\frac{w_1}{w_2}$

$b = -\frac{w_0}{w_2}$


(b) Draw a picture for the cases $w = [1,2,3]$ and $w = -[1,2,3]$.

In more than two dimensions, the +1 and -1 regions are separated by a hyperplane, the generalization of a line.

