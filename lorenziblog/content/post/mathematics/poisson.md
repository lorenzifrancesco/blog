---
title: "Binomial from Poisson in composite process"
date: 2023-10-27
draft: false
tags: 
- Mathematics
---

This is a classical calculation in Poisson processes, indicating how to obtain a binomial variable from two Poisson processes.

Let $X_1(t) \sim \mathcal{P}(\lambda_1 t)$ and $X_2(t) \sim \mathcal{P}(\lambda_2 t)$ be two independent Poisson processes, with parameters $\lambda_1$ and $\lambda_2$ respectively, that can be interpreted as arrivals in a second. Let us consider the following conditional
$$
\begin{align}
    & P[X_1(t)=k \ | \ X_1(t)+X_2(t) &= n+k]
    \end{align}
$$
that is the probability that there are $k$ arrivals from the variable 1, conditioned on the number of total arrivals being $n+k$.
$$
\begin{align}
    & P[X_1(t)=k \ | \  X_1(t)+X_2(t) &= n+k] = \\\
      &= \frac{P[X_1(t)=k, X_2(t)= n]}{P[X_1(t) + X_2(t)= n+k]} \\\
    &=\frac{(\lambda_1 t)^k (k!)^{-1} e^{-\lambda_1 t} (\lambda_2 t)^n (n!)^{-1} e^{-\lambda_2 t}}{((\lambda_1 + \lambda_2) t)^{n+k} ((n+k)!)^{-1} e^{-(\lambda_1+\lambda_2) t}} \\\
    &= \frac{(n+k)!}{n! k!}\frac{\lambda_1^k \lambda_2^n}{((\lambda_1 + \lambda_2))^{n+k}} \\\
    &= \binom{n+k}{k} \left(\frac{\lambda_1}{\lambda_1+\lambda_2}\right)^k \left(\frac{\lambda_2}{\lambda_1+\lambda_2}\right)^n.
\end{align}
$$
Here we found that this probability distribution coincides to the one of a binomial variable
$$
Y \sim \text{Bin}(n+k, p)
$$
where
$$
p = \frac{\lambda_1}{\lambda_1+ \lambda_2}
$$
This result is well rooted in our intuition: every arrival comes from process 1 or process 2, with a probability which is proportional to the arrival rate of the two processes. Expressing this results with the rates $\lambda_i$, we obtain a sum of Bernoulli variables, that boils down to the binomial variable we found.



