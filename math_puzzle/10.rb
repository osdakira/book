"""
「 連続 する n 個 の 数 の 和」 が 最大 に なる 位置 を 考え ます。
2 ≦ n ≦ 36 の それぞれ の n について、 連続 する n 個 の 数 の 和 が 最大 に なる 場合 を 求め、
ヨーロピアン スタイル での 和 が アメリカン スタイル での 和 よりも 小さく なる n が いくつ ある かを 求め て ください。
"""

europa = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
american = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

europa_ring = europa + europa
american_ring = american + american

def max(ary, n)
  ary.each_cons(n).map { |x| x.inject(0, :+) }.max
end

rings = (2..36).map do |n|
  europa_max = max(europa_ring, n)
  american_max = max(american_ring, n)
  [europa_max, american_max]
end

p rings.select { |e, a| e < a }.size

# 反省
# 単純に連結すると遅い。溢れた分だけを取得することを考えるらしい
# メモ化すると速くなる
