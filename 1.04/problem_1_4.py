#!/usr/bin/env python
## problem_1_4.py
## Mac Radigan

"""problem_1_4.py
"""

import argparse
from sys import stdout
from perceptron import pla
import numpy as np

def main(verbose):
  'problem 1.4'
  dim = 20
  test(dim)

def case(dim):
  'problem 1.4'
  outdir = '1.4/figures/'
  p = pla.PLA(2)
  x = p.rand_data(dim)
  w_star = p.rand_target()
  y = p.target(x, w_star)
  outfile = '%s/%s' % (outdir, 'p1.4a_target.png')
  p.plot(x, w_star, y, outfile)
  w = p.train(x, y)
  y_hat = p.classify(x)
  y_err = y_hat - y;
  err = 0 != np.sum(y_err)
  outfile = '%s/%s' % (outdir, 'p1.4a_classify.png')
  p.plot(x, w, y_hat, outfile)
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
 parser = argparse.ArgumentParser(description='problem 1.4')
 parser.add_argument('-v', '--verbose', action='store_true', dest='verbose',   default=False,   help='verbose output to stdout')
 args = parser.parse_args()
 main(args.verbose)

## *EOF*