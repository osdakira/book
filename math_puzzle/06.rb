"""
コラッツ予想 改

n が 偶数 の 場合、 n を 2 で 割る
n が 奇数 の 場合、 n に 3 を かけ て 1 を 足す

初期 値 が 偶数 の 場合、 初回 のみ
n に 3 を かけ て 1 を 足す こと から 始める

10000 以下 の 偶数 の うち、 上記 の 2 や 4 の よう な「 最初 の 数 に 戻る 数」 が いくつ ある か、 その 個数 を 求め て ください。
"""

def calc(n, initial = false)
  if initial || n.odd?
    n * 3 + 1
  else
    n / 2
  end
end

def recursive(cur, orig, initial = false)
  new_n = calc(cur, initial)
  case new_n
  when 1
    nil
  when orig
    new_n
  else
    recursive(new_n, orig)
  end
end

l = (2..10_000).step(2).map do |n|
  recursive(n, n, true)
end

p l.compact
p l.compact.size

# 力押しで書いたら間違えた
# 何かと思ったら、出題が 10000 なのに 1000 で計算してた。凹む
