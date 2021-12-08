module Main

-------------------------------
-- Define arithmetic 
-------------------------------

-- A natural number type --
data Peano = Cero | Prox Peano

-- Addition of our naturals
total
add : Peano -> Peano -> Peano
add x Cero = Cero
add x (Prox y) = Prox (add x y)

-- Multiplication of our naturals.
total 
mult : Peano -> Peano -> Peano
mult x Cero = Cero
mult x (Prox y) = add x (mult x y)

-- Differences of naturals.
total
diff: Peano -> Peano -> Maybe Peano
diff x Cero = Just x
diff Cero (Prox y) = Nothing
diff (Prox x) (Prox y) = diff x y

--------------------------------
-- Define needed relations
--------------------------------

-- A less-than type: a < b <=> exists c, a+(c+1)=b
data LT : Peano -> Peano -> Type where 
    mkLT : {a:Peano} -> 
         {b:Peano} -> 
         (c:Peano) -> 
         (pf:(add a (Prox c)) = b) -> LT a b

--------------------------------
-- Define needed subsets 
--------------------------------

-- A type PN for {n : N | 0<n}
data Pos :Type where
    mkPos: (k:Peano) -> (pf:LT Cero k) -> Pos

-- embed Pos -> Peano
total
Pos2Peano : Pos -> Peano
Pos2Peano (mkPos k pf) = Prox k


-- A type for [n]={k:N | k < n}
data Rng: Peano -> Type where
    mkRng : {n:Peano} -> (k:Peano) -> (pf: LT k n) -> Rng n

-- embed Rng -> Peano
total
Rng2Peano : Rng n -> Peano
Rng2Peano (mkRng k pf) = k


------------------------------
-- Prove division algorithm.
------------------------------

div : (m:Peano) -> (n:Pos) -> (q:Peano**(r:(Rng (Pos2Peano n))**(m=(add (mult q (Pos2Peano n)) (Rng2Peano r)))))
div m n = case (diff m n) of
            Just k =>
            Nothing => (Cero**(mkRng m n))



-- main : IO ()
-- main = return ()
