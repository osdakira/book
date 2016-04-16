"""
 到着 し た 順番 に 1 列 に 並ん で、 入場 を 待っ て い ます。
 2 つ の グループ の いずれ かは 男女 の 人数 が 均等 に なる よう に 分け たい
男性 20 人、 女性 10 人 が 到着 し た 場合、 どこ で 区切っ ても 2 つ の グループ の いずれ かで 男女 の 数 が 異なっ て しまう よう な 到着 順 が 何 通り ある かを 求め て ください。
"""


'''
力押し 失敗版
alls = []
(0..20).each do |male_i|
 (0..10).each do |female_i|
   alls << ["M"] * male_i + ["F"] * female_i + ["M"] * (20 - male_i) + ["F"] * (10 - female_i)
 end
end
puts alls.map { |x| x.join(",") }
cnt = 0
alls.each do |line|
 (1..30).step(2).each do |sep|
   g1 = line[0..sep]
   next cnt += 1 if g1.count("M") != g1.count("F")
   g2 = line[sep..-1]
   cnt += 1 if g2.count("M") != g2.count("F")
 end
end
p cnt
p alls.size
'''

# 反省
# 失敗した
# 全ての経路を考えられていない？
# => 男性と、女性が連続で繋がっていることしか考えていないことがわかった
#
# 初期化の仕方が便利
# Array.new(21 * 10) {0}
# 回答が理解できない

# おそらく、
# 2次元配列を、1次元で表現。
# (boy * g) で girl 側のオフセットを表現している？
# ary[0] = boy でも girl でもない
# ary[1] = boy 1番目
# ary[2] = boy 2番目
# ...
# ary[21] = girl 1番目
# ary[22] = girl 2番目
# ...
# ary[31] = boy 1番目 x 2周目？

# ルートを表現しているだけのようだ。
# わからん……

boy, girl = 20, 10
boy, girl = boy + 1, girl + 1
ary = Array.new(boy * girl) {0}
ary[0] = 1
girl.times { |g|
  boy.times { |b|
    # p ["g, b", g, b]
    if b != g && (boy - b != girl - g)
      if b > 0
        ary[b + boy * g] += ary[b - 1 + boy * g]
        p ["b", b, b + boy * g, b - 1 + boy * g]
      end
      if g > 0
        ary[b + boy * g] += ary[b + boy * (g - 1)]
        p ["g", g, b + boy * g, b + boy * (g - 1)]
      end
    end
  }
}
puts ary[-2], ary[-boy-1]
puts ary[-2] + ary[-boy-1]
puts ary.each_slice(10).map {|x| x.map {|x| x.to_s.rjust(8, " ")}.join(",")}
