---
title: "Second quantization of the electromagnetic field"
date: 2023-10-27
draft: false
---

La procedura di quantizzazione di un modello classico di un fenomeno fisico ha il suo passaggio cruciale nella promozione delle variabili dinamiche del modello a degli operatori nello spazio di Hilbert degli stati quantistici del sistema. La quantizzazione ha successo se questi operatori formano un insieme completo di osservabili che commutano, quindi sono compatibili (tale insieme ha l'acronimo ICOC). In tal caso, ogni stato quantistico del sistema si può esprimere come somma di autostati, e possiamo scrivere le ampiezze di probabilità, e prendere le medie di tutte le variabili dinamiche.
La descrizione quantizzata del campo elettromagnetico nel vuoto si ottiene esprimendo l'hamiltoniana del campo in un volume $V$ finito, per poi prendere il limite per $V \to \infty$. La promozione ad operatori è effettuata tramite gli operatori di posizione e momento coniugato, che sono introdotti tramite la scrittura dell'hamiltoniana del campo in termini di una somma, eventualmente infinita, di oscillatori armonici non accoppiati.

Iniziamo esprimendo l'hamiltoniana del campo in un volume di spazio $V$. 
$$
    H = \int_{V}dV \dfrac{1}{2}\varepsilon_0 |\mathbf{E}|^2 + \dfrac{1}{2\mu_0}|\mathbf{B}|^2
$$

Ora ricordiamo che è possibile esprimere i campi $\mathbf{E}$, $\mathbf{B}$ usando il potenziale vettore magnetico $\mathbf{A}$ in questo modo, scegliendo il gauge di Coulomb:
$$ 
\begin{align}
    \mathbf{E} &= - \dfrac{\partial}{\partial t}	\mathbf{A} \\\
    \mathbf{B} &= \nabla \times \mathbf{A}
\end{align} 
$$
Ricordiamo, dalle equazioni di Maxwell, l'equazione d'onda per il campo $\mathbf{A}$
$$
    \left(\nabla^2 - \dfrac{1}{c^2} \dfrac{\partial^2}{\partial t^2} \right)\mathbf{A} =0
$$
Dato che siamo in un volume limitato di spazio, possiamo imporre una condizione al contorno periodica, ed esprimiamo il campo $\mathbf{A}$ secondo la sua serie di Fourier, tramite somma di esponenziali complessi. 
Scegliamo di esprimere le onde piane componenti come onde polarizzate linearmente. Questo non inficia la generalità del procedimento, in quanto altre polarizzazioni sono esprimibili come somme di onde polarizzate linearmente, con opportuni sfasamenti.
Sia quindi $\mathbf{k}$ il vettore d'onda, ed $s$ la polarizzazione lineare ($s \in \{\alpha, \beta\}$ dove $\alpha, \beta$ sono due polarizzazioni ortogonali possibili dato il vettore d'onda $\mathbf{k}$).
Abbiamo che 

$$
    \mathbf{A} = \sum_{\mathbf{k}s} A_{\mathbf{k}s}(t) e^{i \mathbf{k} \cdot \mathbf{r}} \, \hat{\epsilon}_{\mathbf{k}s}
$$

Dove $\hat{\epsilon}_{\mathbf{k}s}$ è  il versore del campo, parallelo alla polarizzazione.
Inoltre, il campo $\mathbf{A}$ dev'essere reale, quindi abbiamo la condizione

$$
    A_{-\mathbf{k}s}(t) = A_{\mathbf{k}s}^*(t)
$$

In vista di questa condizione, a meno di ridefinire i termini $A_{\mathbf{k}s}$ dimezzandoli, possiamo riscrivere la somma come

$$
    \mathbf{A} = \sum _{\mathbf{k}s} A _{\mathbf{k}s}(t) e^{i \mathbf{k} \cdot \mathbf{r}} +  A^* _{\mathbf{k}s}(t) e^{-i \mathbf{k} \cdot \mathbf{r}} \hat{\epsilon} _{\mathbf{k}s}
$$

Sostituendo la seguente condizione

$$
    \ddot{A} _{\mathbf{k}s}(t) + \omega _\mathbf{k}^2  A _{\mathbf{k}s}(t) = 0
$$

con la __relazione di dispersione__

$$
    \omega_\mathbf{k} = c |\mathbf{k}|
$$

Dato che $\omega$, nel vuoto, dipende solamente dal modulo $|\mathbf{k}| =: k$ possiamo anche scrivere $\omega_k$ per semplicità.
Quindi l'equazione di risolve

$$
        A_{\mathbf{k}s}(t) = A_{\mathbf{k}s}(0) e^{-\omega_k t}
$$

Calcoliamo ora l'hamiltoniana in termini di questa espansione di Fourier dei campi

$$
        H = \int_{V}dV \dfrac{1}{2}\varepsilon_0 |\dfrac{\partial}{\partial t} \mathbf{A}|^2 + \dfrac{1}{2\mu_0}|\nabla \times \mathbf{A}|^2
$$

In questo modo otteniamo 

$$
    H = \sum_{\mathbf{k}s} \varepsilon_0 \omega_k^2 ( A_{\mathbf{k}s}(t) A_{\mathbf{k}s}^* (t) + A_{\mathbf{k}s}^{*} (t) A_{\mathbf{k}s}(t)) 
$$

notiamo che questa hamiltoniana è indipendente dal tempo, poiché lo sono i termini  $A_{\mathbf{k}s}(t)A_{\mathbf{k}s}^* (t)$ ed il complesso coniugato. Per brevità possiamo scrivere semplicemente $A_{\mathbf{k}s} A_{\mathbf{k}s}^* $.
Introduciamo le variabili adimensionali $a_{\mathbf{k}s}$, ed $a_{\mathbf{k}s}^*$ in modo che 

$$ 
\begin{align}
    A_{\mathbf{k}s} &= \sqrt{\dfrac{\hslash}{2\epsilon_0 \omega_k}} a_{\mathbf{k}s} \\\
    A_{\mathbf{k}s}^* &= \sqrt{\dfrac{\hslash}{2\epsilon_0 \omega_k}} a_{\mathbf{k}s}^*
\end{align} 
$$

Allora

$$
    H = \sum_{\mathbf{k}s} \dfrac{\hslash \omega_k}{2} (a_{\mathbf{k}s}a_{\mathbf{k}s}^* +a_{\mathbf{k}s}a_{\mathbf{k}s}^*)
$$

Possiamo intodurre altre variabili 

$$ 
\begin{align}
    q_{\mathbf{k}s} &= \sqrt{\dfrac{2\hslash}{\omega_k}} (a_{\mathbf{k}s} + a_{\mathbf{k}s}^* )\\\
    p_{\mathbf{k}s} &= \sqrt{2\hslash \omega_k} (a_{\mathbf{k}s} - a_{\mathbf{k}s}^* )
\end{align} 
$$

quindi esprimendo l'hamiltoniana in funzione di $q_{\mathbf{k}s}$ e $p_{\mathbf{k}s}$, otteniamo la seguente, importante espressione

$$
    H = \sum_{\mathbf{k}s} \dfrac{p_{\mathbf{k}s}^2}{2} +  \omega_k^2 \dfrac{q_{\mathbf{k}s}^2}{2}
$$

Osserviamo che questa hamiltoniana è esattamente quella di una somma di un'infinità di oscillatori armonici, uno per ogni modo del campo elettromagnetico.
Siamo finalmente giunti al punto in cui possiamo promuovere le variabili ad operatori. Questa è un'operazione possibile quando stabiliamo le relazioni di commutazione tra le variabili dinamiche. In questo caso assumiamo le relazioni di commutazione fondamentali

$$
    [ \hat{q} _{n} , \hat{p} _m ] = \delta _{nm}
$$

ovvero

$$
    \hat{q} _n \hat{p} _m - \hat{p} _m \hat{q} _n = i\hslash \delta _{nm}
$$

dato che

$$
    i\hslash [\hat{A}, \hat{B}] =  \hat{A}\hat{B}-\hat{B}\hat{A}
$$ 

Tramite quindi l'operazione di promozione 

$$ 
\begin{align}
    q _{\mathbf{k}s} \to \hat{q} _{\mathbf{k}s} \\\
    p _{\mathbf{k}s} \to \hat{p} _{\mathbf{k}s} 
\end{align} 
$$

possiamo scrivere un'hamiltoniana quantistica

$$
    \hat{H} = \sum _{\mathbf{k}s} \dfrac{\hat{p} _{\mathbf{k}s}^2}{2} +  \omega _k^2 \dfrac{\hat{q} _{\mathbf{k}s}^2}{2}
$$

Notiamo che è un'osservabile, poiché è una somma di osservabili (possiamo dire che questo è un operatore hermitiano).
Possiamo applicare la procedura standard per la quantizzazione dell'oscillatore armonico, introducendo gli operatori di creazione e annichilazione

$$ 
\begin{align}
    \hat{a} _{\mathbf{k}s} &= \sqrt{\dfrac{\omega _k}{2\hslash}} \left(\hat{q} _{\mathbf{k}s} + \dfrac{i}{\omega _k}\hat{p} _{\mathbf{k}s}\right)\\\
    \hat{a} _{\mathbf{k}s}^{\dagger} &= \sqrt{\dfrac{\omega _k}{2\hslash}} \left(\hat{q} _{\mathbf{k}s} - \dfrac{i}{\omega _k}\hat{p} _{\mathbf{k}s}\right) 
\end{align} 
$$

che soddisfano alle relazioni di commutazione

$$
    [\hat{a} _{\mathbf{k}s}, \hat{a} _{\mathbf{k}'s'}^\dagger] = \delta _{\mathbf{k}, \mathbf{k}'} \delta _{s, s'}
$$

otteniamo quindi

$$
\hat{H} = \sum _{\mathbf{k}s} \hslash \omega_k \left(\hat{a} _{\mathbf{k}s}^\dagger \hat{a} _{\mathbf{k}s} + \dfrac{1}{2}\right)
$$

Lo spazio di Hilbert degli stati quantistici del sistema è chiamato spazio di Fock.
La procedura di seconda quantizzazione del campo elettromagnetico è un esempio di calcolo tipico della teoria quantistica dei campi. Questa teoria fisica permette di trovare delle espressioni quantistiche per i campi, siano essi elettromagnetici, o anche campi di materia.