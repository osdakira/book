"""
覆面 算 とは、 文字 で 表さ れ た 計算 式 で、 同じ 文字 には 同じ 数字 が 入り、 違う 文字 には 違う 数字 が 入り ます。 また、 最上位 の 文字 に 0 は 入り ませ ん。

以下 の 式 を 満たす よう な 数字 の 当てはめ 方 は 何 通り ある か 求め て ください。
READ ＋ WRITE ＋ TALK ＝ SKILL

READ ＋ WRITE ＋ TALK - SKILL == 0
"""

@var_counts = Hash.new { |h, k| h[k] = 0 }

def parse(str, op = 1)
  str.split("").reverse.each.with_index do |v, i|
    @var_counts[v] += 10 ** i * op
  end
end

parse("READ")
parse("WRITE")
parse("TALK")
parse("SKILL", -1)
puts @var_counts
# {"D"=>1, "A"=>110, "E"=>101, "R"=>2000, "T"=>1010, "I"=>0, "W"=>10000, "K"=>-999, "L"=>-1, "S"=>-10000}
# それぞれの英字を係数と考えた時、全加算して0になるには？
# 全ての係数が1の時、2222
cnt = 0
(0..9).each do |d|
  (0..9).each do |a|
    (0..9).each do |e|
      (1..9).each do |r|
        (1..9).each do |t|
            (1..9).each do |w|
              (0..9).each do |k|
                (0..9).each do |l|
                  (1..9).each do |s|
                    ans = @var_counts["D"] * d +
                    @var_counts["A"] * a +
                    @var_counts["E"] * e +
                    @var_counts["R"] * r +
                    @var_counts["T"] * t +
                    @var_counts["W"] * w +
                    @var_counts["K"] * k +
                    @var_counts["L"] * l +
                    @var_counts["S"] * s
                    p [d, a, e, r, t, w, k, l]
                    if ans == 0
                      cnt += 1
                    end
                  end
                end
            end
          end
        end
      end
    end
  end
end
puts cnt

# 方向を変えて考える
# READ ＋ WRITE ＋ TALK ＝ SKILL
# 結果が5桁になる必要がある。
# [S, R, W, T] は、[1-9]
# i. (D + E + K) = L  または
# ii. (D + E + K) % 10 = L
#
# i. のとき、 (A + T + L) = L
# ii. のとき、(D + E + K) / 10 + (A + T + L) = L
#
# i. のとき、A + T = 10, A + E + 1 = 10, (3桁目はI)
# ii. のとき、(D + E + K) / 10 + (A + T) = 10 (2行目は L)
