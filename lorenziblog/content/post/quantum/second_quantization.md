---
title: "Second quantization of the electromagnetic field"
date: 2023-10-27
draft: false
tag: 
- quantum field theory
---
The procedure of quantization of a classical theory has its crucial passage in the promotion of the dynamical variables to operators in the Hilbert space of the quantum states of the system. The quantization is successful if these operators form a complete set of commuting observables (this set is called ICOC). In this case, every quantum state of the system can be expressed as a sum of eigenstates, and we can write the probability amplitudes, and take the averages of all the dynamical variables.
The quantized description of the electromagnetic field in the vacuum is obtained by expressing the field hamiltonian in a finite volume $V$, and then taking the limit for $V \to \infty$. The promotion to operators is performed by the position and conjugate momentum operators, which are introduced by writing the field hamiltonian in terms of a sum, possibly infinite, of uncoupled harmonic oscillators.
We start by expressing the hamiltonian of the field in a volume of space $V$.
$$
    H = \int_{V}dV \dfrac{1}{2}\varepsilon_0 |\mathbf{E}|^2 + \dfrac{1}{2\mu_0}|\mathbf{B}|^2.
$$
Now we remember that it is possible to express the fields $\mathbf{E}$, $\mathbf{B}$ using the magnetic vector potential $\mathbf{A}$ in this way, choosing the Coulomb gauge:
$$ 
\begin{align}
    \mathbf{E} &= - \dfrac{\partial}{\partial t}	\mathbf{A} \\\
    \mathbf{B} &= \nabla \times \mathbf{A}.
\end{align} 
$$
We recall that, from the Maxwell equations, the wave equation for the field $\mathbf{A}$
$$
    \left(\nabla^2 - \dfrac{1}{c^2} \dfrac{\partial^2}{\partial t^2} \right)\mathbf{A} =0.
$$
Since we are in a limited volume of space, we can impose a periodic boundary condition, and express the field $\mathbf{A}$ according to its Fourier series, by summing complex exponentials.
We choose to express the component plane waves as linearly polarized waves. This does not affect the generality of the procedure, as other polarizations can be expressed as sums of linearly polarized waves, with appropriate phase shifts.
Let therefore $\mathbf{k}$ be the wave vector, and $s$ the linear polarization ($s \in \{\alpha, \beta\}$ where $\alpha, \beta$ are two possible orthogonal polarizations given the wave vector $\mathbf{k}$).
We have that  

$$
    \mathbf{A} = \sum_{\mathbf{k}s} A_{\mathbf{k}s}(t) e^{i \mathbf{k} \cdot \mathbf{r}} \, \hat{\epsilon}_{\mathbf{k}s},
$$
where $\hat{\epsilon}_{\mathbf{k}s}$ is the unit vector of the field, parallel to the polarization.
Furthermore the field $\mathbf{A}$ must be real, so we have the condition 

$$
    A_{-\mathbf{k}s}(t) = A_{\mathbf{k}s}^*(t).
$$
By imposing this condition, unless we redefine the terms $A_{\mathbf{k}s}$ by halving them, we can rewrite the sum as

$$
    \mathbf{A} = \sum _{\mathbf{k}s} A _{\mathbf{k}s}(t) e^{i \mathbf{k} \cdot \mathbf{r}} +  A^* _{\mathbf{k}s}(t) e^{-i \mathbf{k} \cdot \mathbf{r}} \hat{\epsilon} _{\mathbf{k}s}.
$$

Substituting the following condition

$$
    \ddot{A} _{\mathbf{k}s}(t) + \omega _\mathbf{k}^2  A _{\mathbf{k}s}(t) = 0,
$$

with the __dispersion relation__

$$
    \omega_\mathbf{k} = c |\mathbf{k}|.
$$
Since $\omega$, in the vacuum, depends only on the modulus $|\mathbf{k}| =: k$ we can also write $\omega_k$ for simplicity.
So the equation is solved as 

$$
        A_{\mathbf{k}s}(t) = A_{\mathbf{k}s}(0) e^{-\omega_k t}.
$$

We now computer the Hamiltonian in terms of this Fourier expansion of the fields

$$
        H = \int_{V}dV \dfrac{1}{2}\varepsilon_0 |\dfrac{\partial}{\partial t} \mathbf{A}|^2 + \dfrac{1}{2\mu_0}|\nabla \times \mathbf{A}|^2.
$$
 In this way we obtain

$$
    H = \sum_{\mathbf{k}s} \varepsilon_0 \omega_k^2 ( A_{\mathbf{k}s}(t) A_{\mathbf{k}s}^* (t) + A_{\mathbf{k}s}^{*} (t) A_{\mathbf{k}s}(t)) ,
$$
we notice that this Hamiltonian is independent of time, since the terms $A_{\mathbf{k}s}(t)A_{\mathbf{k}s}^* (t)$ and the complex conjugate are. For brevity we can simply write $A_{\mathbf{k}s} A_{\mathbf{k}s}^* $.
We introduce the adimensional variables $a_{\mathbf{k}s}$, and $a_{\mathbf{k}s}^*$ in such a way that

$$ 
\begin{align}
    A_{\mathbf{k}s} &= \sqrt{\dfrac{\hslash}{2\epsilon_0 \omega_k}} a_{\mathbf{k}s} \\\
    A_{\mathbf{k}s}^* &= \sqrt{\dfrac{\hslash}{2\epsilon_0 \omega_k}} a_{\mathbf{k}s}^*.
\end{align} 
$$

Therefore

$$
    H = \sum_{\mathbf{k}s} \dfrac{\hslash \omega_k}{2} (a_{\mathbf{k}s}a_{\mathbf{k}s}^* +a_{\mathbf{k}s}a_{\mathbf{k}s}^*).
$$

We can introduce other variables

$$ 
\begin{align}
    q_{\mathbf{k}s} &= \sqrt{\dfrac{2\hslash}{\omega_k}} (a_{\mathbf{k}s} + a_{\mathbf{k}s}^* )\\\
    p_{\mathbf{k}s} &= \sqrt{2\hslash \omega_k} (a_{\mathbf{k}s} - a_{\mathbf{k}s}^* ),
\end{align} 
$$
so we can express the Hamiltonian in terms of $q_{\mathbf{k}s}$ and $p_{\mathbf{k}s}$, obtaining the following, important expression

$$
    H = \sum_{\mathbf{k}s} \dfrac{p_{\mathbf{k}s}^2}{2} +  \omega_k^2 \dfrac{q_{\mathbf{k}s}^2}{2}.
$$
By observing that this Hamiltonian is exactly that of a sum of an infinite number of harmonic oscillators, one for each mode of the electromagnetic field.
We are finally at the point where we can promote the variables to operators. This is an operation possible when we establish the commutation relations between the dynamical variables. In this case we assume the fundamental commutation relations 

$$
    [ \hat{q} _{n} , \hat{p} _m ] = \delta _{nm},
$$

that is

$$
    \hat{q} _n \hat{p} _m - \hat{p} _m \hat{q} _n = i\hslash \delta _{nm},
$$

since
$$
    i\hslash [\hat{A}, \hat{B}] =  \hat{A}\hat{B}-\hat{B}\hat{A}.
$$ 
By means of the promotion operation
$$ 
\begin{align}
    q _{\mathbf{k}s} \to \hat{q} _{\mathbf{k}s} \\\
    p _{\mathbf{k}s} \to \hat{p} _{\mathbf{k}s} ,
\end{align} 
$$
we can write a quantum Hamiltonian

$$
    \hat{H} = \sum _{\mathbf{k}s} \dfrac{\hat{p} _{\mathbf{k}s}^2}{2} +  \omega _k^2 \dfrac{\hat{q} _{\mathbf{k}s}^2}{2}.
$$
We notice that it is an observable, since it is a sum of observables (we can say that this is a Hermitian operator).
We can then apply the standard procedure for the quantization of the harmonic oscillator, introducing the creation and annihilation operators

$$ 
\begin{align}
    \hat{a} _{\mathbf{k}s} &= \sqrt{\dfrac{\omega _k}{2\hslash}} \left(\hat{q} _{\mathbf{k}s} + \dfrac{i}{\omega _k}\hat{p} _{\mathbf{k}s}\right)\\\
    \hat{a} _{\mathbf{k}s}^{\dagger} &= \sqrt{\dfrac{\omega _k}{2\hslash}} \left(\hat{q} _{\mathbf{k}s} - \dfrac{i}{\omega _k}\hat{p} _{\mathbf{k}s}\right) ,
\end{align} 
$$
that satisfy the commutation relations

$$
    [\hat{a} _{\mathbf{k}s}, \hat{a} _{\mathbf{k}'s'}^\dagger] = \delta _{\mathbf{k}, \mathbf{k}'} \delta _{s, s'},
$$
we therefore obtain

$$
\hat{H} = \sum _{\mathbf{k}s} \hslash \omega_k \left(\hat{a} _{\mathbf{k}s}^\dagger \hat{a} _{\mathbf{k}s} + \dfrac{1}{2}\right).
$$

The Hilbert space of the quantum states of the system is called Fock space.
The second quantization procedure of the electromagnetic field is an example of a typical calculation of quantum field theory. This physical theory allows us to find quantum expressions for fields, be they electromagnetic, or even fields of matter.
