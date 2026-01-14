---
title: "Elementary view on Floquet (and Bloch) theory"
date: 2024-09-01
draft: true
tags: 
- Mathematics
---

Floquet theory gives us properties of the solution of a linear ODE that contains periodic terms. For example, the Mathieu equation
$$
\frac{d^2u}{dt^2} + (a + 2b \cos(t) )u = 0,
$$
with the obvious periodicity of $2\pi$.
If in our equation the set of all coefficients is expected to have a periodicity of period $T$, Floquet theory tells us that every solution of the form 
$$
u(t) = e^{\lambda t} \ \phi(t)
$$
where $\lambda$ is a constant, and $\phi(t)$ is a periodic function of period $T$.

Let us discuss this fact, focusing for simplicity on second-order equations like the Mathieu equation. 
Of course, the equation being linear, and being second-order, every solution can be written as a linear combination of two basis solution $u_1$ and $u_2$. Namely, 
$$
u(t) = Au_1(t)+Bu_2(t)
$$
is a solution for every $A$ and $B$ in $\mathbb{C}$.
Moreover, since the coefficients are periodic with period $T$, every time-shift of the solution function by $T$ is resulting in a new solution. And they can be decomposed in products of elementary solutions too!
$$
u_1(t+T) = a_{11} u_1(t) + a_{12}u_2(t),
$$
and
$$
u_2(t+T) = a_{21} u_1(t) + a_{22}u_2(t),
$$
Therefore
$$
\begin{align*}
u(t+T) &= A u_1(t+T) + B u_2(t+T) = \\\ &= (A \ a_{11} + B \ a_{21}) u_1(t) + (A \ a_{21} + B \ a_{22} ) u_2(t) \\\ &= A' u_1(t) + B' u_2(t)
\end{align*}
$$
Therefore, the coefficients of the linear combination of the time-shifted general solution 
$$
\begin{pmatrix} A' \\ B' \end{pmatrix} = \begin{pmatrix} a_{11} & a_{21} \\ a_{12} & a_{22} \end{pmatrix} \begin{pmatrix} A \\ B \end{pmatrix} = \mathcal{M}\begin{pmatrix} A \\ B \end{pmatrix}
$$
Consider now a solution that is such that the coefficients $A$ and $B$ are an eigenvector of the matrix $\mathcal{M}$. Let the eigenvalue be $\mu$. We have a corresponding eigenvalue relation on the time-shifted function:
$$
u(t+T) =\mu \  u(t) 
$$
Let $\lambda = ln(\mu)/(2\pi T)$. Then the solution is
$$
u(t) = e^{\lambda t} \ \phi(t)
$$ 
where $\phi(t)$ is a periodic function of period $T$.
This treatment can be generalized to generic order autonomous equation, corresponding to the system
$$
\dot{\underbar u}(t) =  A(t){\underbar u}(t)
$$
with a periodic $A(t)$.