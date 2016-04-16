"""
年月日 を YYYYMMDD の 8 桁 の 整数 で 表し た とき、
 これ を 2 進数 に 変換 し て 逆 から 並べ、
 さらに 10 進数 に 戻し た とき、 元 の 日付 と 同じ 日付 に なる もの を 探し て ください。

 期間 は、 前回 の 東京 オリンピック（ 1964 年 10 月 10 日） から、 次回 の 東京 オリンピック（ 2020 年 7 月 24 日 予定） と し ます。
 """

# まずは力押し
require "date"
begin_at = Date.new(1964, 10, 10)
end_at = Date.new(2020, 07, 24)
(begin_at..end_at).each do |date|
  date_str = date.strftime("%Y%m%d").to_i
  if date_str == date_str.to_s(2).reverse.to_i(2)
    p date_str
  end
end
