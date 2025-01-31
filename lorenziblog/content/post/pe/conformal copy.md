---
title: "Conformal mapping and Helmholtz equation"
date: 2024-08-31
draft: false
tags: 
- Photonics and electromagnetics
---

Inspired by __[10.1126/science.1126493]__.

### Conformal transformation and Helmholtz equation
Consider the Helmholtz equation describing a scalar phasor field $\psi$ in a 2D space filled by a isotropic medium of index $n(\mathbf{r})$.
$$
(\nabla^2 + n^2k_0^2)\psi = 0.
$$
the phasor field is corresponding to a given light polarization.
We can introduce the complex variable $z=x+iy$, and we have the relations
$$
\partial_x = \partial_z+\partial_{\bar{z}},
$$
$$
\partial_y = i\left(\partial_z-\partial_{\bar{z}}\right).
$$
By substitution, $\nabla^2 = 4\partial_z\partial_{\bar{z}}$.
Consider now an analytical function $w(z)$. We have 
$$
\partial_z\partial_{\bar{z}} = \left|\partial_z w\right|^2 \partial_w\partial_{\bar{w}}.
$$
We can map the Helmholtz equation into
$$
(4\partial_w\partial_{\bar{w}} + n'^2k_0^2)\psi = 0
$$
where the new index is $n' = n |\partial_z w|$.
Then, we can map again the Helmholtz equation into new variables $u, v$, having $w=u+iv$, obtaining
$$
(\partial_u^2+\partial_v^2 + n'^2k_0^2)\psi = 0
$$
therefore mapping the previous electromagnetic problem into a new problem with a transformed index.

### Ray equation
We can perform the Geometrical optics approximation to Helmholtz equation. We define 
$$
\psi(\mathbf{r}) = C(\mathbf{r})e^{ik_0S(\mathbf{r})}
$$
With $C$ and $S$ real functions.
Substituting into Hemholtz equation, and approximating $C$ as a slowly varying function of space, namely $\nabla C(\mathbf{r})\ll k_0 C(\mathbf{r})$, we obtain the *Eikonal* equation (from the greek $\varepsilon \iota \kappa \tilde{\omega}\nu$, "image"),
$$
|\nabla S|^2 = n^2.
$$
Introducing a curvilinear coordinate $u$ (the coordinate along the ray), with versor $\hat{u} = \frac{d u}{d\mathbf{r}}$. The versor $\hat{u}$ is everywhere normal to the constant-phase surface, therefore, 
$$
\nabla S = n \hat{u},
$$
from which, after some vector algebra (Someda sec. 5.4), we can derive the *ray equation*,
$$
\frac{d}{du} \left(n\frac{d\mathbf{r}}{du}\right) = \nabla n.
$$
We can solve for rays in both the original and the mapped problem! Also, the mapping function $w(z)$ can have branch cuts, and therefor it can be interesting to see what happens to rays going through Riemann sheets of the mapped space.