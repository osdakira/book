"""
この 機械 では、 10 円 玉、 50 円 玉、 100 円 玉、 500 円 玉 の 組み合わせ に 両替 する こと が でき、
最大 で 15 枚 に なる よう に 両替 し ます。

1000 円 札 を 入れ た とき に 出 て くる 硬貨 の 組み合わせ は 何 通り ある かを 求め て ください。
"""

# 500円 3枚はおかしい
# 10円 100枚はアウト
# coins = [500, 100, 50, 10]

# 500, 500
# 500, 100, 100, 100, 100, 100
# 500, 100, 100, 100, 100, 50, 50
# 500, 100, 100, 100, 100, 50, 10, 10, 10, 10, 10
# 小銭は、分解していけるので、枚数制限を気にするだけの問題？

# 逆に、それぞれのお金を15枚ずつ使って、1000円を作れるか、という問題？

# わからないので、力押し
ok_list = []
(0..1000).step(500).each_with_index do |c500, c500i|
  (0..1000).step(100).each_with_index do |c100, c100i|
    (0..1000).step(50).each_with_index do |c50, c50i|
      (0..1000).step(10).each_with_index do |c10, c10i|
        next if c500i + c100i + c50i + c10i > 15
        if c500 + c100 + c50 + c10 == 1000
            ok_list << [c500i, c100i, c50i, c10i]
        end
      end
    end
  end
end
# p ok_list
# p ok_list.size

# 感想
# repeated_combination とかあったのか
# 再帰が直感で分からなかった。自分では書けなさそう。
# 残りの金額を、枚数制限下で払えるか？という解法みたいだが……

@cnt = 0
def change(target, coins, usable)
  p [target, coins, usable]
  coin = coins.shift
  if coins.size == 0
    if target / coin <= usable
      p ["cnt up", target/coin, usable]
      @cnt += 1
    end
  else
    (0..target/coin).each { |i|
      change(target - coin * i, coins.clone, usable -i)
    }
  end
end
change(1000, [500, 100, 50, 10], 15)
puts @cnt
