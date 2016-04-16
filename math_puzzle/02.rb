# ここ では、 並ん で いる 数字 の 各 桁 の 間 に 四則演算 の 演算子 を 入れ て 計算 する こと に し ます（ 演算子 を 入れ ない 場所 が あっ ても 構い ませ ん が、 最低 でも 1 つ は 入れる もの と し ます）。
# できあがっ た 式 を 計算 し た 結果、「 元 の 数 の 桁 を 逆 から 並べ た 数字」 と 同じ に なる もの を 考え ます。
# 1000 ～ 9999 の うち、 上記 の 条件 を 満たす 数 を 求め て ください。

# 1. 掛け算しか使えない
# 2. 0 が含まれるとアウト
# 3. * が入るのは、3箇所

(1000..9999).each do |n|
  s = n.to_s
  # next if s.include? "0"
  reversed = s.reverse.to_i
  (0..2).each do |index|
    # puts "#{s[0..index].to_i} * #{s[(index + 1)..-1].to_i}"
    num = s[0..index].to_i * s[(index + 1)..-1].to_i
    if reversed == num
      p n
      break n
    end
  end
end

# * が複数OKの可能性を忘れていた
