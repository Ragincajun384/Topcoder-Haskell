matchPatterns :: [Int] -> [Int] -> [Char] -> [Int]
matchPatterns _ _ [] = []
matchPatterns [] _ _ = []
matchPatterns (x:xs) ys (z:zs) 
	| (z=='X')&&(x `elem` ys) = matchPatterns xs ys zs
        | (z=='X')&&(not (x `elem` ys)) = x:matchPatterns xs ys zs
        | otherwise = matchPatterns xs ys zs    

extraBall card balls patterns prizes = sum $ calculatePrize ws
	where qs = map (matchPatterns card balls ) patterns
	      ns = map fromIntegral prizes
	      ws = zip qs ns
              zs = fromIntegral (75 - (length balls))
              calculatePrize [] = []
              calculatePrize ((a,b):as)
	      	| ((length a)==1) = ((1/zs)*b):calculatePrize as
                | otherwise = calculatePrize as  

-- TopCoder problem "ExtraBall" used in SRM 286 (Division I Level One , Division II Level Two)

-- Problem Statement
      
-- In a Bingo game, players have cards bearing a random selection of numbers ranging from 1 to 75. During the game, a blower containing exactly one ball for each of these numbers releases balls one at a time, without replacement, until a certain number of balls have been released. After each ball is released, the players will mark the cells on their cards that match the number on the ball. A player's objective in this game is to win prizes by matching the markings on his card with one or more predesignated patterns. Each pattern consists of the same number of cells as a card, and each cell in a pattern is either a 'X' or a '.'. A pattern is considered matched when all the cells on a card corresponding to its 'X's are marked. At the end of the game, each player wins all of the prizes corresponding to all the patterns matched by his card. For example, consider a card with four cells containing the numbers [1,10,2,3]. The winning patterns are given as "X...", "X..X", and "XXXX". If the balls released in a given game were 1, 2, 3, 4, and 5, you would mark the cells on the card containing the numbers 1, 2, and 3. The following two patterns would be matched by the card:
-- "X...", which represents a pattern that requires the first cell to be marked.
-- "X..X", a pattern that requires the cells at both ends of the card to be marked.
-- The card would not match the pattern "XXXX" because the second cell is not marked.
-- At the end of the game, one additional ball is released to give players a chance to win additional prizes. Determine the expected increase in your payout after this new ball is released. In other words, determine the expected payout of the patterns matched by the new ball, excluding all the patterns that were already matched before the new ball was released. In the example given above, there is a probability of 1/70 that the pattern "XXXX" will be matched after the additional ball is released (the additional ball would have to be 10). The expected increase in payout would therefore be 1/70 times the payout associated with that pattern.
-- You are given a int[] card containing the numbers on your card, and a int[] balls containing the sequence of balls that have already been released from the blower. You are also given a String[] patterns and a int[] prizes. The i-th element of prizes is the payout corresponding to the i-th element of patterns. As described above, one additional ball will be released from the blower. Return the expected increase in your payout after the new ball is released.
 
-- Definition
      
-- Class:  ExtraBall
-- Method: expectedPayout
-- Parameters: int[], int[], String[], int[]
-- Returns:  double
-- Method signature: double expectedPayout(int[] card, int[] balls, String[] patterns, int[] prizes)
-- (be sure your method is public)
    
 
-- Notes
-- - All available balls have the same probability of being released.
-- - Your return value must have a relative or absolute error less than 1e-9.
 
-- Constraints
-- - card will contain between 1 and 25 elements, inclusive.
-- - balls will contain between 1 and 40 elements, inclusive.
-- - Each element of card and balls will be between 1 and 75, inclusive.
-- - No two elements of card will be equal.
-- - No two elements of balls will be equal.
-- - patterns will contain between 1 and 50 elements, inclusive.
-- - prizes and patterns will contain the same number of elements.
-- - The number of characters in each element of patterns will be equal to the number of elements in card.
-- - Each element of patterns will contain only uppercase 'X' and '.' characters.
-- - Each element of patterns will contain at least one 'X' character.
-- - Each element of prizes will be between 1 and 10000, inclusive.
 
-- Examples
-- 0)  
      
-- {1,2,3}
-- {1,2,4}
-- {"XXX"}
-- {10000}
-- Returns: 138.88888888888889
-- The full card pays a 10,000 jackpot. One of the 72 remaining balls will complete the pattern, thus (1/72)*10000 = 138.888888888 is the expected payout value.
-- 1)  
      
-- {1,2,3,4,5}
-- {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26}
-- {"X.X.X"}
-- {10}
-- Returns: 0.0
-- Three balls (1, 3, and 5) are needed to get the prize, but since only one additional ball is released, the prize cannot be won.
-- 2)  
      
-- {29,16,2,35,75}
-- {75,4,16,3,21,44,2,38,11}
-- {"X....","X.X.X","XXX..","XXXXX"}
-- {10,100,300,1000}
-- Returns: 6.212121212121213
-- 3)  
      
-- {1,2,3,4,5,6,7,8,9,10}
-- {75}
-- {"X.........",".X........","..X.......","...X......","....X.....","XXXXXXXXXX"}
-- {50,40,30,20,10,1000}
-- Returns: 2.027027027027027
-- 4)  
      
-- {1,2,3,4}
-- {12,34,45,56,67,1,2,3,4}
-- {"X..X","XXXX"}
-- {10,100}
-- Returns: 0.0
