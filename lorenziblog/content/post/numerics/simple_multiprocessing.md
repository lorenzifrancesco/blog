---
title: "Simple Multiprocessing in Julia"
date: 2024-03-27T10:28:58+01:00
draft: false
tags: 
- computer programming
---

In this short post, we analyze the computation of a two-variable function on a grid, that is a common task for exploring physical properties of systems through phase diagrams, and similar 

```julia
using Distributed, Printf

@info @sprintf("Number of workers: %d", nprocs())
@everywhere function loop_compute(x)
	for i in 1:100000000
		x += sin(x)
	end
	return x
end
t0 = @elapsed loop_compute(1.0)
@info @sprintf("Single eval time [s]: %4.3e", t0) 

mat = rand(10, 10)
t_pmap = @elapsed pmap(loop_compute, mat)
@info @sprintf("pmap   eval time [s] : %4.3e", t_pmap)
t_sing = @elapsed loop_compute.(mat)
@info @sprintf("serial eval time [s] : %4.3e", t_sing)
@info @sprintf("Speeup ratio: %4444", t_sing/t_pmap)
```
Try to run this simple script using 

```bash
julia -p 4 script.jl
```
And check the speedup of the parallelized code. 
Keep also an eye on memory allocation.