---
title: "Julia"
date: 2023-12-18T15:18:36+01:00
draft: true
tag: numerics

---
We want to optimize Julia performance through type-inference analysis.

```julia
julia> @benchmark sim = InitSim(L, N, type)
BenchmarkTools.Trial: 10000 samples with 1 evaluation.
 Range (min … max):  17.467 μs …  36.698 ms  ┊ GC (min … max): 0.00% … 45.39%
 Time  (median):     21.256 μs               ┊ GC (median):    0.00%
 Time  (mean ± σ):   28.770 μs ± 367.122 μs  ┊ GC (mean ± σ):  5.79% ±  0.45%

   ▁█▃                                                          
  ▂█████▇▅▄▄▃▃▃▂▃▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁ ▂
  17.5 μs         Histogram: frequency by time           54 μs <

 Memory estimate: 14.03 KiB, allocs estimate: 220.
 ```

With type inference indicating 
```julia
     %306 = X::Tuple{Vararg{LinRange{Float64, Int64}}}
│    %307 = K::Tuple{Vararg{AbstractFFTs.Frequencies{Float64}}}
│    %308 = T::Transforms{_A, _B, Array{ComplexF64}} where {_A, _B}
│    %309 = ksquared::Array{ComplexF64}
```
we obtain a load time of 
 ```julia
 julia> @benchmark sim = InitSim(L, N, type)
BenchmarkTools.Trial: 10000 samples with 1 evaluation.
 Range (min … max):  17.035 μs …  27.692 ms  ┊ GC (min … max): 0.00% … 42.74%
 Time  (median):     18.392 μs               ┊ GC (median):    0.00%
 Time  (mean ± σ):   22.019 μs ± 276.943 μs  ┊ GC (mean ± σ):  5.38% ±  0.43%

   ▄▇██▇▅▄▃▃▂▂▁▁▁▁▁▁                                           ▂
  ▇██████████████████▇▇▆▄▆▆▆▆▆▄▄▅▅▅▅▅▄▅▄▆▆▃▄▅▅▄▄▃▅▅▅▄▄▄▃▄▃▂▂▂▄ █
  17 μs         Histogram: log(frequency) by time      35.6 μs <

 Memory estimate: 14.17 KiB, allocs estimate: 220.
 ```

 ### ``Everything can be known at compile time if the compiler is smart enough"
 So what is the purpose of running Julia?
 