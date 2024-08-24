---
title: "Canonical nonlinear dynamics is described by Nonlinear Schrödinger equation"
date: 2023-08-14
draft: false
math: true
tags: 
  - mathematics
---
Nonlinear Schrödinger equations appears in numerous physical setups, like nonlinear optics, condensed matter physics and plasma physics.
In all of these scenarios, it describes the dynamics of wave envelopes in the presence of dispersion and weak nonlinearity. A natural question is to understand if it is possible to write the equation regardless of the physical details, starting from a purely mathematical assumptions on the evolution of the fields. This is illuminating from the mathematical point of view, besides being an useful exercise.

In this post we explore a method to derive the NLSE in general, starting from a generic partial differential equation and assuming properties of the evolution operator.

Let us condiser a partial differential equation in $d$ dimensions for a scalar field $u$, 
$$
    L(\partial_t, \nabla)u = G(u),
$$
where $L$ is a linear operator, and $G$ a generic (nonlinear) function of $u$ and its derivatives.
For low-amplitude solutions, the nonlienar term can be neglected, so solutions are 
$$
    u = \epsilon\psi \exp[i(\mathbf{k} \cdot \mathbf{r} - \omega t)],
$$
with $\omega$ and $\mathbf{k}$ linked by the dispersion relation
$$
    L(-i\omega, i\mathbf{k}) = 0.
$$
in general, this relation admits a number of solutions $\omega$ given a fixed $\mathbf{k}$. Let $\omega(\mathbf{k})$ be one of those solutions.
Considering the solution in Eq. (\ref{solution}), the dispersion relation can be written as 
$$
    [i\partial_t - \omega(i\partial_{\mathbf{r}})] \ \epsilon\psi\exp[i(\mathbf{k} \cdot \mathbf{r} - \omega t)],
$$
by promoting $\omega$ to an operator.
We now introduce a correction: for small nonlinearity, the angular frequency will depend on $\epsilon^2 |\psi|^2$. Therefore we substitute $\omega(\mathbf{k})$ with $\Omega(\mathbf{k}, \epsilon^2|\psi|^2)$. Notice that  $\Omega(\mathbf{k}, 0)=\omega(\mathbf{k})$.
Moreover, the amplitude $\psi$ becomes dependent on the slow variables $T=\epsilon t$ and $\mathbf{X} = \epsilon \mathbf{x}$. We can formally substitute $\partial_t \longrightarrow \partial_t + \epsilon\partial_T$ and $\partial_{\mathbf{x}} \longrightarrow \partial_{x}+\epsilon \nabla$, where $\nabla$  is the gradient with respect to the slow variable. 
The dispersion relation Eq. (\ref{dispersion}) becomes

$$
    [i\omega + \epsilon \partial_T - \Omega(\mathbf{k}-i\epsilon\nabla, \epsilon^2|\psi|^2)]\psi = 0.
$$

Since $\epsilon$ is considered small, we can expand the equation in power series around $\epsilon=0$, writing

$$
    i(\partial_T + \mathbf{v}_g \cdot \nabla)\psi + \epsilon[\nabla \cdot (D\nabla\psi) + \gamma|\psi|^2\psi]=0
$$

where $ \mathbf{v}_g=\nabla\mathbf{k} \omega $ is the group velocity, and $D$ the half Hessian matrix of $\omega$. 
 Furthermore, by scaling the spatial coordinate $\mathbf{\zeta} = \mathbf{X} - T\mathbf{v}_g$, and $\tau = \epsilon T$, we obtain

$$
    i\partial_\tau +\nabla \cdot (D\nabla\psi) + \gamma |\psi|^2 \psi = 0
$$

that is exactly the NLSE in a generic medium. In isotropic media, $ \nabla \cdot (D\nabla) = \nabla^2 $ .