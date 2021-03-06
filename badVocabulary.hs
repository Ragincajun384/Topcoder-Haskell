
badVocabulary a b c xs =  sum $ map (badWords a b c) xs

badWords a b c (x:xs)
   | (take (length a) (x:xs)) == a = 1
   | (drop ((length(x:xs))-(length b)) (x:xs))== b = 1
   | otherwise = find c (tail $ init (x:xs))
      where find _ [] = 0
            find z (q:qs)
                | z == (take (length z) (q:qs)) = 1
                | otherwise = find z qs






-- TopCoder problem "BadVocabulary" used in Member SRM 489 (Division II Level One)

-- Problem Statement
    	
-- Little Teddy and Little Tracy are now learning how to speak words. Their mother, of course, doesn't want them to speak bad words. According to her definition, a word W is bad if at least one of the following conditions hold (see the notes section for definitions):
-- W contains the string badPrefix as a prefix.
-- W contains the string badSuffix as a suffix.
-- W contains the string badSubstring as a contiguous substring that is neither a prefix nor a suffix of W.
-- You are given a String[] vocabulary representing the words that Teddy and Tracy are going to learn. Return the number of bad words in vocabulary.
 
-- Definition
    	
-- Class:	BadVocabulary
-- Method:	count
-- Parameters:	String, String, String, String[]
-- Returns:	int
-- Method signature:	int count(String badPrefix, String badSuffix, String badSubstring, String[] vocabulary)
-- (be sure your method is public)
    
 
-- Notes
-- -	A prefix of a string is obtained by removing zero or more contiguous characters from the end of the string.
-- -	A suffix of a string is obtained by removing zero or more contiguous characters from the beginning of the string.
 
-- Constraints
-- -	badPrefix, badSuffix, and badSubstring will each contain between 1 and 50 characters, inclusive.
-- -	vocabulary will contain between 1 and 50 elements, inclusive.
-- -	Each element vocabulary will contain between 1 and 50 characters, inclusive.
-- -	Each character of badPrefix, badSuffix, and badSubstring will be between 'a' and 'z', inclusive.
-- -	Each character in vocabulary will be between 'a' and 'z', inclusive.
-- -	All elements of vocabulary will be distinct.
 
-- Examples
-- 0)	
    	
-- "bug"
-- "bug"
-- "bug"
-- {"buggy", "debugger", "debug"}
-- Returns: 3
-- 1)	
    	
-- "a"
-- "b"
-- "c"
-- {"a", "b", "tco"}
-- Returns: 3
-- "a" is a prefix of "a". "b" is a suffix of "b". "c" is a substring of "tco". So, all words in vocabulary are bad.
-- 2)	
    	
-- "cut"
-- "sore"
-- "scar"
-- {"scary", "oscar"}
-- Returns: 0
-- Although "scar" is a substring of "scary", it is also a prefix. Thus, "scary" is not a bad word. Similarly, as "scar" is a suffix of "oscar", "oscar" is not a bad word.
-- 3)	
    	
-- "bar"
-- "else"
-- "foo"
-- {"foofoofoo", "foobar", "elsewhere"}
-- Returns: 1
-- Only the word "foofoofoo" is bad.
-- 4)	
    	
-- "pre"
-- "s"
-- "all"
-- {"all", "coders", "be", "prepared", "for", "the", "challenge", "phase"}
-- Returns: 3

