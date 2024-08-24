---
title: "GN_model_NLI"
date: 2024-02-20T14:48:54+01:00
draft: true
tags: 
- Photonics and electromagnetics
---

The Gaussian Noise model for nonlinear impairments in optical fiber generation is a useful model to compute the amount of nonlinear interference noise (NLI) in an transmission system.
We review here the paper on the arXiv providing detailed calculations by [Poggiolini et al.](https://arxiv.org/abs/1209.0394).

We start from the basic requirement for optical system to determine the bit-error rate (BER), as
```math
\mathrm{BER} = \Psi(\mathrm{SNR})  
```
with $\Psi$ depending on the modulation format
If the system uses polarization multplexing, we expect the signal to be 4-dimensional, as there are four possible independent quadratures. Also the noise is expected to be iid in all the quadratures, with statistical power
```math
  \sigma_{xI}^2 = \sigma_{yI}^2 = \sigma_{xQ}^2 = \sigma_{yQ}^2 
```
ASE noise can be computed as
```math
  \sigma^2_{\mathrm{ASE}} = \int \mathrm{d}{f}  \ G_{\mathrm{ASE}} |H_{Rx}|^2
```
where $G_{\mathrm{ASE}}$ is the PSD of the noise and $H_{Rx}$ the (baseband) transfer function of the receiver. 
Assuming matched filtering after a long span of dispersion uncompensated fiber, and neglecting ISI, average square signal amplitude is 
```math
  \langle A^2\rangle  = P_{Rx} \ T_S \int \mathrm{d}f \ |H_{Rx} |^2 
```
with $T_S$ symbol period.
It is simple to prove that
```math
\mathrm{SNR} = B_N  \ T_S \ \mathrm{OSNR}
``` 
the ratio between optical powers in the band $B_N$. 
An important assumption is to implement matched filtering
>"typical adaptive equalizers present in
>the Rx DSPs tend to converge to matched filtering"

## NLI noise
One of the fundamental assumptions on which the GN model is
based is that the effect of NLI on WDM signals can be modeled as additive Gaussian noise, statistically independent of ASE noise. 
We have therefore 
```math
\sigma^2_{\mathrm{NLI}} = \int \mathrm{d}f \ G_{\mathrm{NLI}}  | H_{Rx}|^2
```
and we aim now the determination of the NLI PSD. 
We assume that dispersion causes the signal of each channel to appear as a complex zero-mean Gaussian distribution, with a variance determined by the signal power. We will require that the PSD shape is matching the one of the input PSD $G_{Tx}$.

We use a Karhunen-Loeve expansion in the assumption of a periodic signal. 

