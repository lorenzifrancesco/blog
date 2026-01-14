---
title: "Poisson-Boltzmann equation"
date: 2025-02-28
draft: false
tags: 
- Classical mechanics
---
How are the ions in a solution distributed in a region of space subjected to an external electric field? The Poisson-Boltzmann equation gives us a way to answer this question.
The equation is basically the Poisson equation from electrostatics
$$
\nabla^2 \phi = -\frac{\rho}{\varepsilon} \, , 
$$
where $\varepsilon$ is the dielectric constant of the solvent, but with a suitable choice of the charge density, in a self-consistent way. The charge density is given by the requirement that the solution is thermalized, and the ions distribute in the potential in a way described by the Boltzmann distribution. Assuming that the electrostatic potential is the dominant part of the energy, we have 
$$
n_i = a_i\exp[-\beta z_i\phi] \, .
$$
where $\beta = 1/k_BT$ is the inverse temperature, $z_i$ is the charge of the charge of the $i$-species present, and $a_i$ are a proportionality constant, such that
$$
\sum_i \int dV \ n_i = N \, ,
$$
the total number of ions. Because of charge neutrality,
$$
\sum_i a_i z_i = 0 \, .
$$
We take the charge density to be
$$
\rho = \sum_i z_i n_i \, ,
$$ 
and therefore the Poisson-Boltzmann equation reads
$$
\nabla^2 \phi = \frac{1}{\varepsilon} \sum_i z_i a_i \exp[-\beta z_i \phi] \, .
$$
Aha! A nice nonlinear equation! How to solve it? We can use perturbation methods.




A nice experiment can be tried at home, involving the surface distribution of polar molecules. In this case, the Poisson-Boltzmann equation needs to be modified to take into account the dipole field and the dipole energy in the electrostatic field.