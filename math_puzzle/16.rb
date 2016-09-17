# 写経。正答が出た

MAX = 500

answer = []

(1 .. MAX/4).each do |c|
  edge = (1 .. (c-1)).to_a.map { |tate| tate * (2 * c - tate) }
  edge.combination(2) do |a, b|
    if a + b == c * c
      answer.push([1, b / a.to_f, c * c / a.to_f])
      # puts [1, b / a.to_f, c * c / a.to_f].join ","
    end
  end
end
# puts answer.map { |x| x.join(",") }

# puts answer.size
answer.uniq!
puts answer.size
# puts answer.map { |x| x.join(",") }
