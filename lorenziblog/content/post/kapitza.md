---
title: "The Kapitza pendulum"
date: 2024-02-11
draft: false
---

The Kapitza pendulum is a model in classical mechanics that exhibits counterintuitive behaviour. It is a pendulum with a pivot point that oscillates vertically. 

![Normal pendulum and Kapitza pendulum](../../images/kapitza/kapitza.jpg)

If $\phi$ is the angle the pendulum have with respect to the vertical downward position, for some values of the driving frequency and amplitude, it can be stable in the inverted position $\phi = \pi$, and unstable in the upright position $\phi = 0$. 

This is the opposite of what happens for a normal pendulum, which has always a stable equilibrium point with $\phi=0$ and unstable one with $\phi=\pi$.


The equation of motion in the moving frame contains a fictitious force term
$$
mL\ddot{\phi} = mg\sin\phi - Am\omega^2 \cos(\omega t) \sin \phi
$$
that in our case is equivalent to 
$$
 \ddot{\phi} = -\frac{1}{L}(g+A\omega^2\cos(\omega t))\sin \phi
$$
[to be continued...]