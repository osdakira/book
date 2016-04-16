"""
フィボナッチ 数列 の うち、 各 桁 の 数字 を 足し た 数 で 割り切れる 数 を、 以下 の 例 に 続け て 小さい 方 から 5 個 求め て ください。
"""

guard = 10000

ans = []
memo = [1, 1]
n = 2
while ans.size != 11
  memo[n] = memo[n-1] + memo[n-2]
  p [n, memo[n]]
  if memo[n] % memo[n].to_s.split('').map(&:to_i).inject(:+) == 0
    ans << memo[n]
  end
  n += 1

  break puts "break" if n > guard
end

puts ans
