
# Problem 1.1 

We have 2 opaque bags, each containing 2 balls. One bag has 2 black balls and the other has a black and a white ball. You pick a bag at random and then pick one of the balls in that bag at random. When you look at the ball it is black. You now pick the second ball from that same bag. What is the probability that this ball is also black? [Hint: Use Bayes' Theorem:  $P[A and B] = P[A|B]P[B] =  P[B|A]P[A]$.]

$P(A|B) = \frac{P(A)P(B|A)}{P(B)}$

- $B_A$ the event that bag A was selected
- $B_B$ the event that bag B was selected
- $k_A$ the event that a black ball from bag A was selected
- $k_B$ the event that a black ball from bag B was selected
- $k_1$ the event that a black ball was selected on the first selection
- $k_2$ the event that a black ball was selected on the second selection

$k_1 = B_A k_A + B_B k_B = \frac{1}{2} \cdot 1 + \frac{1}{2} \cdot \frac{1}{2} = \frac{1}{2} \cdot \frac{1}{4} = \frac{3}{4}$

$P(B_A|k_1) = \frac{P(B_A \cap k_1)}{P(k_1)} = \frac{P(k_1|B_B) P(B_A)}{P(k_1)}$

$P(B_B|k_1) = \frac{P(B_B \cap k_1)}{P(k_1)} = \frac{P(k_1|B_B) P(B_B)}{P(k_1)}$

$P(k_1|B_A) = \frac{1}{2} \cdot 1 = \frac{1}{2}$

$P(k_1|B_B) = \frac{1}{2} \cdot \frac{1}{2} = \frac{1}{4}$

$P(B_A) = \frac{1}{2}$

$P(B_B) = \frac{1}{2}$

$P(k_1) = \frac{3}{4}$

$P(B_A|k_1) = \frac{P(k_1|B_A) P(B_A)}{P(k_1)} = \frac{\frac{1}{2} \cdot \frac{1}{2}}{\frac{3}{4}} = \frac{\frac{1}{4}}{\frac{3}{4}} = \frac{1}{3}$

$P(B_B|k_1) = \frac{P(k_1|B_B) P(B_B)}{P(k_1)} = \frac{\frac{1}{4} \cdot \frac{1}{2}}{\frac{3}{4}} = \frac{\frac{1}{8}}{\frac{3}{4}} = \frac{4}{24} = \frac{1}{6}$

$P(k_2) = P(k_1|B_B) P(k_B) + P(B_B|k_1) P(k_B) = \frac{1}{3} \cdot 1 + \frac{1}{6} \cdot \frac{1}{2} = \frac{1}{3} + \frac{1}{12} + \frac{4}{12} + \frac{1}{12} = \frac{5}{12}$

