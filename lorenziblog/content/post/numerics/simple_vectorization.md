---
title: "Simple (but nontrivial) vectorization in Numpy"
date: 2024-05-09T19:11:37+02:00
draft: false
---


```python
f(a, b, c, d)
```

Let's say we want to explore the behavior of ```f``` in some range of parameters.

How can we vectorize the function and iterate over all possible combinations? Is building a Cartesian product the best way? We expect this to be *very inefficient*, like $O(n^2)$ with respect to $O(n)$ inefficient in memory, at least. 
Let's say the parameters have a definite number of samples (```len(x)```  or ```np.shape(x)``` in pyhon, with ```x``` a parameter vector). We change the axis of the numpy vectors, making them multi-dimensional vectors (or, respecting the notion of dimension in algebra, *multi-axial*):

```python
a_vec = a[:, None, None, None]
```

Therefore the samples on each axis will be

```
(10, 1, 1, 1)
(1,  2, 1, 1)
(1,  1, 4, 1)
(1,  1, 1, 8)
```

By calling the function ```foo(a_vec, b_vec, c_vec, d_vec)```, we get a 

```
res = foo(a_vec, b_vec, c_vec, d_vec)
```

and

```
np.shape(res)
```

will give ```(10, 2, 4, 8)```. The vectorization is crucially dependent on the number of items in each axis of the multi-axis vectors.
For example, we expect that only two values are allowed in a column: ```1``` or a fixed ```N```

```
(..., 1, ...)
(..., 1, ...)
(..., N, ...)
(..., 1, ...)
(..., N, ...)
```

The vectorization routine is therefore allowed to **broadcast**.

### Example script

```python
import numpy as np
def f(x, y, z): return x+y+z
print("\nCheck the normal operation")
a = np.random.randint(0, 100, (20, 10, 1))
b = np.random.randint(0, 100, (32))
c = np.random.randint(0, 100, (20, 1, 32))
print("a   : ", np.shape(a))
print("b   : ", np.shape(b[None, None, :]))
print("c   : ", np.shape(c))
res = f(a, b[None, None, :], c)
print("res : ", np.shape(res))

print("\nNow we generate a vectorization (broadcasting) error")
b = np.random.randint(0, 100, (31))
res = f(a, b[None, None, :], c)
