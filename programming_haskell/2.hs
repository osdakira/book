{-
3. 以下のプログラムにはエラーが三つある。エラーを修正し、Hugs で正し
く動くか確かめよ。
N = a ’div’ length xs where
a = 10
xs = [1,2,3,4,5]
-}

n = a `div` (length xs) where
    a = 10
    xs = [1,2,3,4,5]

--    4. この章で紹介したライブラリ関数を使って、空でないリストの最後の要素 を取り出す関数 last を定義せよ。さらに他の定義も考えよ。

last' xs = xs !! (length xs - 1)

--    5. 同様に、空でないリストから最後の要素を取り除くライブラリ関数 init が、二通りの方法で定義できることを示せ。

init_1 xs = take (length xs - 1) xs
init_2 xs = reverse (tail (reverse xs))

main = do
    print $ n == 2
    --
    print $ last' [1,2,3,4,5] == 5
    --
    print $ init_1 [1,2,3,4,5] == [1,2,3,4]
    print $ init_2 [1,2,3,4,5] == [1,2,3,4]
    --
    print $ head [1,2,3,4,5] == 1
    print $ tail [1,2,3,4,5] == [2,3,4,5]
    print $ [1,2,3,4,5]!!2 == 3
    print $ take 3 [ 1, 2, 3, 4, 5 ] == [1,2,3]
    print $ drop 3 [1, 2, 3, 4, 5] == [4,5]
    print $ length [1,2,3,4,5] == 5
    print $ sum [1,2,3,4,5] == 15
    print $ product [1, 2, 3, 4, 5] == 120
    print $ [1,2,3] ++ [4,5] == [1,2,3,4,5]
    print $ reverse [1, 2, 3, 4, 5] == [5,4,3,2,1]
