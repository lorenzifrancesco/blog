---
title: "Longitudinal and transverse relativistic dynamics"
date: 2024-07-24T18:54:44+02:00
draft: false
tags: 
- Classical mechanics
---
A very simple calculation in relativistic dynamics show an impressive aspect that differentiates the momentum change
due to a force in the direction of movement of the body and the transverse ones.
By using the definition of relativistic momentum $\mathbf{p}=\gamma m \mathbf{v}$, we can write
$$
    \frac{d\mathbf{p}}{dt} = \frac{d\gamma}{dt} m \mathbf{v} + \gamma m \frac{d\mathbf{v}}{dt},
$$
by defining the longitudinal and transverse acceleration, with respect to the vector $\mathbf{v}$ 
$$
    \frac{d\mathbf{v}}{dt} = \mathbf{a}_L +\mathbf{a}_T,
$$
it is simple to show that the first term in the first equation is only longitudinal 
$$
    \frac{d\gamma}{dt} m \mathbf{v} = \frac{v^2}{c^2} \gamma^3 m \mathbf{a}_L ,
$$
and the second term is composed of longitudinal and transverse parts
$$
    \gamma m \frac{d\mathbf{v}}{dt}=\gamma m (\mathbf{a}_L+\mathbf{a}_T).
$$
Summing the contributions, we can separate the Newton equation with respect to transverse and longitudinal forces, obtaining
$$
    \frac{d\mathbf{p}}{dt}=\gamma^3m \mathbf{a}_L+\gamma m \mathbf{a}_T.
$$