# Division Algorithm
`CC-BY-2021 James B. Wilson`

[ToC]

## Natural Numbers.

Use an inductive type.

#### Logical Type
\[\mathbb{N} = 0 | {\small \textrm{++}}(k:\mathbb{N})\]

#### Programming Idiom

```idris
data Nat = Z | S Nat
```

#### Categorical description.

Free in the category of $\{1\}$-algebras $A$ (i.e. one unary operator $A^1\to A$), free on one element set.
\[
\begin{array}{ccc}
 & & \langle \mathbb{N},{\small ++}\rangle\\
 & \nearrow & \downarrow\exists!\hat{f}\\
\{\bot\} & \rightarrow & \langle A,\mathrm{next}  \rangle\\
 & \forall f &\\
\end{array}
\]
I.e. the homomorphism property is just 
\[
\begin{array}{ccc}
\mathbb{N} & \overset{{\small ++}}{\longrightarrow} & \mathbb{N}\\
\downarrow f & & \downarrow f\\
A & \overset{\mathrm{next}}{\longrightarrow} & A
\end{array}
\]
So $\hat{f}(0)=f(\bot)$ and $\hat{f}({\small ++}k)=\mathrm{next}~\hat{f}(k)$.

---
## Opperations.

\[
    m+n = \left\{\begin{array}{cc} m & n=0\\ {\small ++}(m+k) & n={\small ++}k\end{array}\right.
\]

