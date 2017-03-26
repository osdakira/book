{-
Prelude> :type ['a','b','c']
['a','b','c'] :: [Char]
Prelude> :type ('a', 'b', 'c')
('a', 'b', 'c') :: (Char, Char, Char)
Prelude> :type [ (False , '0'), (True , '1') ]
[ (False , '0'), (True , '1') ] :: [(Bool, Char)]
Prelude> :type ([False,True],['0','1'])
([False,True],['0','1']) :: ([Bool], [Char])
Prelude> :type [ tail , init , reverse ]
[ tail , init , reverse ] :: [[a] -> [a]]

Prelude> let second xs = head (tail xs)
Prelude> :t second
second :: [a] -> a

Prelude> let swap (x,y) = (y,x)
Prelude> :t swap
swap :: (t1, t) -> (t, t1)

Prelude> let pair x y = (x,y)
Prelude> :t pair
pair :: t -> t1 -> (t, t1)


palindrome xs = reverse xs == xs
twice f x = f (f x)
-}

main = do
    print $ False < True
