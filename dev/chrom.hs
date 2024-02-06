type Gene = [Int] 
type Chromosome = [Gene]
type Population = [Chromosome]

g1,g2,g3,g4 :: Gene
c1,c2 :: Chromosome
p :: Population
g1 = [1 ,0 ,1 ,0 ,1 ,0]
g2 = [0 ,1 ,0 ,1 ,0 ,1]
g3 = [0 ,0 ,0 ,0 ,0 ,0]
g4 = [1 ,1 ,1 ,1 ,1 ,1]
c1 = [g1,g2]
c2 = [g3,g4]
c3 = [g1,g1]
p = [c1,c2]

isEqual :: (Eq a) =>a -> a -> Int
isEqual a b     | a == b = 1
                | otherwise = 0-- < 1. Replace 0 with your own code! >

geneCost :: Gene -> Gene -> Int
geneCost g1 g2 = sum $ zipWith (isEqual) g1 g2

chromCost :: Chromosome -> Chromosome -> Int
chromCost c1 c2 = sum $ zipWith (isEqual) c1 c2  
chromCostP :: Chromosome -> Chromosome -> (Int, Chromosome)
chromCostP target c = (sum $ zipWith (geneCost) target c, c)

evalPop :: Chromosome -> Population -> [ (Int, Chromosome) ]
evalPop target pop = [(6 ,c1) ,(0 ,c2) ] -- < 3. Replace output with your own code! >

sortPop :: [ (Int, Chromosome) ] -> [ (Int, Chromosome) ]
sortPop pop = [(0 ,c2) ,(6 ,c1) ] -- < 4. Replace output with your own code! >