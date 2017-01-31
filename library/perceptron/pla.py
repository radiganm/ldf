## pla
## Mac Radigan

"""pla.py

  Perceptron Learning Algorithm (PLA)


    initialization:

      N data dimensionality
      K number of samples in dataset

      W [Nx1] initial weights


    random dataset generation:

      X      [NxK] ~ U[a,b]  random training samples
      W_star [Nx1] ~ U[a,b]  random target function


    update step:

      y_hat   = signum( X * W' )
      
      y_err   = |y - y_hat|
      
      rhos    = x * y
      k       = argmax y_err

      err     = exist y" in y_err s.t. |y"| > 0

      W       = W + Y_k*X_k  if err


    training:

      update while err


"""

import numpy as np
import matplotlib.pyplot as plt

class PLA:

  def __init__(self, n):
    """initialize a new PLA:
         n - dimension
    """
    self.new(n)

  def new(self, n):
    """initialize a new PLA:
         n - dimension
    """
    self.n = n                       # data dimensionality
    self.t = 0                       # total iterations
    self.w = np.random.rand(1,n+1)   # initial weight

  def __str__(self):
    """print insternal state"""
    return str(self.w)

  def rand_data(self, k):
    """create random data:
         returns X, a Kx(N+1) real matrix of samples augmented as homogoneous coordinates
    """
    a = -100                        # randomization lower bound
    b = +100                        # randomization upper bound
    return np.concatenate((
        np.ones((k, 1)), 
        a + (b-a) * np.random.rand(k, self.n)
      ), axis=1)

  def rand_target(self):
    """create a random target function:
         returns a random target function
    """
    a = -100                        # randomization lower bound
    b = +100                        # randomization upper bound
    return a + (b-a) * np.random.rand(1, self.n+1)

  def target(self, x, w_star):
    """create a training set:
         x - data set, an 1xK matrix with {-1,+1} entries
         returns truth training set
    """
    return np.sign(x.dot(w_star.T))

  def train(self, x, y):
    """run the learning algorithm
         x - training data set, an NxK real matrix, augmented as homogenous coordinates
         returns the perceptron weights
    """
    while not self.update(x, y):
      pass
    return self.w

  def update(self, x, y):
    """PLA iterative update step
         x - data set
         returns a boolean indicating convergence
    """
    self.t = self.t + 1                            # increment iteration
    y_hat = np.sign(x.dot(self.w.T))               # classify training set using current weights
    y_err = np.abs(y - y_hat)                      # compute error from truth
    ks = y_err.nonzero()[0]
    err = np.any(ks)                               # did the algorihtm converge?
    if err:
      k = ks[0]
      self.w = self.w + y[k] * x[k]                # update weights
      print('t: %d' % self.t)
    return not err

  def classify(self, x):
    """classify a dataset using the internal PLA weights
         x - data set
         returns the classifification
    """
    y = np.sign(x.dot(self.w.T))
    return y

  def plot(self, x, w_star, y, outfile=None):
    """plot classification results
         x - data set
         w_star - target function
    """
    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)
    k_a  = (y > 0).nonzero()[0]
    x1_a = x[k_a, 1]
    x2_a = x[k_a, 2]
    k_b  = (y < 0).nonzero()[0]
    x1_b = x[k_b, 1]
    x2_b = x[k_b, 2]
    ax.scatter(x1_a, x2_a, color='b', marker='o')
    ax.scatter(x1_b, x2_b, color='r', marker='x')
    w0 = w_star.T[0]
    w1 = w_star.T[1]
    w2 = w_star.T[2]
    m = -w1/w2
    b = -w0/w2
    dx1 = np.linspace(-150, 150, 2)
    dx2 = m * dx1 + b
    ax.plot(dx1, dx2, color='m')
    if outfile is not None:
      print('save: %s' % (outfile))
      plt.savefig(outfile)
    else:
      plt.show()


## *EOF*
