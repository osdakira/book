# 長 さ n［ cm］ の 1 本 の 棒 を 1［ cm］ 単位 に 切り分ける こと を 考え ます。 ただし、 1 本 の 棒 を 一度 に 切る こと が できる のは 1 人 だけ です。 切り分け られ た 棒 が 3 本 あれ ば、 同時に 3 人 で 切る こと が
# 最大 m 人 の 人 が いる とき、 最短 何回 で 切り分け られる かを 求め て ください。

# 1. n ＝ 20, m ＝ 3 の とき の 回数 を 求め て ください。
# 2. n ＝ 100, m ＝ 5 の とき の 回数 を 求め て ください。

# 20 cm の棒は、19回切ればいい
# 1人なら、19回
# 2人なら、始めの 1 回 + お互いに 9 回 => 10回
# 3人なら、2回目に切ったときに、3等分されていると良い。
#   20 => 12, 8 => 6, 6 , 7, 1 => 7回
# 4人なら、20 => 10, 10 => 5, 5, 5, 5 => 6回
# 5人なら、[4,4,4,4,4]にしたい。が、4回切らないと5つにならない
#   4回分は、余らせればいい。
# 逆から考える。
# 5人いるから、同時に繋げられる
# [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] => 20
# [2,2,2,2,2,1,1,1,1,1,1,1,1,1,1]           => 15
# [2,2,2,2,2,2,2,2,2,2]                     => 10
# [4,4,4,4,4]                               => 5
# [8,8,4]                                   => 3
# [16,4]                                    => 2
# [20]

# 逆に考えて3人なら                               size
# [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] => 20
# [2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1]       => 17
# [2,2,2,2,2,2,1,1,1,1,1,1,1,1]             => 14
# [2,2,2,2,2,2,2,2,2,1,1]                   => 11
# [4,4,2,2,2,2,2,2]                         => 8
# [4,4,4,4,4]                               => 5
# [8,8,4]                                   => 3
# [16,4]                                    => 2
# [20]                                      => 1

# 4人なら？
# [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] => 20
# [2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1]         => 16
# [2,2,2,2,2,2,2,2,1,1,1,1]                 => 12
# [4,4,2,2,2,2,2,2]                         => 8
# [8,4,4,4]                                 => 4
# [16,8]                                    => 2
# [20]

# n = 100
# m = 5
#
# count = 0
# sticks = Array.new(n, 1)
# while sticks.size > 1
#   concats = sticks.shift(m * 2)
#   concats
#   count += 1
# end
# count

# わからなかった
