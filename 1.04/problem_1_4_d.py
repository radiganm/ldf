#!/usr/bin/env python
## problem_1_4_d.py
## Mac Radigan

"""problem_1_4_d.py
"""

import argparse
from sys import stdout
from perceptron import pla
import numpy as np

def main(verbose):
  'problem 1.4'
  dim = 100
  test(dim)

def case(dim):
  'problem 1.4'
  outdir = '1.04/figures/'
  p = pla.PLA(2)
  x = p.rand_data(dim)
  w_star = p.rand_target()
  y = p.target(x, w_star)
  w = p.train(x, y)
  y_hat = p.classify(x)
  y_err = y_hat - y;
  err = 0 != np.sum(y_err)
  outfile = '%s/%s' % (outdir, 'p1.4d.png')
  title = 'p1.4(d)  PLA, %d points, %d iterations' % (dim, p.t)
  ax = p.plot(x, w, w_star, y_hat, title, outfile)
  return (p, x, w_star, y, w, y_hat, y_err, err)

def prn(name, value):
  print('%s:\n%s\n' % (name, value))

def test(dim):
  'test'
  (p, x, w_star, y, w, y_hat, y_err, err) = case(dim)
  prn("x", x)
  prn("w_star", w_star)
  prn("y'", y.T)
  prn("w", w)
  prn("y_hat'", y_hat.T)
 #prn("y_err'", y_err.T)
  prn("err'", err)

if __name__ == '__main__':
 parser = argparse.ArgumentParser(description='problem 1.4 (a)')
 parser.add_argument('-v', '--verbose', action='store_true', dest='verbose',   default=False,   help='verbose output to stdout')
 args = parser.parse_args()
 main(args.verbose)

## *EOF*
