"""
平方根 を 小数 で 表し た とき に、 0 ～ 9 までの 数字 が 最も 早く すべて 現れる 最小 の 整数 を 求め て ください。
ただし、 ここ では 正 の 平方根 のみ を 対象 と し ます。
 整数 部分 を 含む 場合 と、 小数 部分 のみ の 場合 の それぞれについて求めてください
"""

guard = 10000

in_integer_ans = nil
only_decimal = nil

n = 2
while true
  decimal = Math.sqrt(n)
  str = decimal.to_s
  p str
  in_integer_ans = n if ("0".."9").all? { |x| str.include? x }

  decimal_str = str.split(".").last
  p decimal_str
  only_decimal = n if ("0".."9").all? { |x| decimal_str.include? x }

  break if in_integer_ans && only_decimal

  n += 1
  break puts "error" if n > guard
end

puts [in_integer_ans, only_decimal]

# 反省
# 単精度しか使ってない
# 問題文の理解ができなかった
# `もっとも速く全て現れる` の意味だと思う。
# 最も速くとはつまり、「左から10桁の中に、[0-9] が含まれる」という意味。
