"""
ここ では、 同じ 場所 を 通ら ない 掃除 ロボット を 考え ます。
この ロボット は、 前後左右 に のみ 移動 する こと が でき ます。
この ロボット が 12 回 移動 する とき、 考え られる 移動 経路 の パターン が 何 通り ある かを 求め て ください。

12回移動するなら、最大前後左右12回移動するので、25 x 25 のマスを考えればOK？初期値は自分が中央
前後左右に移動して、移動できなかったら弾けば良い？

12回動かして、同じポイントを持つ経路を弾くのはどう？
(4 ^ 12 のポイントを作ればいい)
"""

# まずは力押し
n = 25
@board = n.times.to_a.map { |x| Array.new(n, false) }

def move_top(cur)
  new_p = [cur[0], cur[1] - 1]
  return false if @board[new_p[0]][new_p[1]]
  new_p
end

def move_bottom(cur)
  new_p = [cur[0], cur[1] + 1]
  return false if @board[new_p[0]][new_p[1]]
  new_p
end

def move_left(cur)
  new_p = [cur[0] - 1, cur[1]]
  return false if @board[new_p[0]][new_p[1]]
  new_p
end

def move_right(cur)
  new_p = [cur[0] + 1, cur[1]]
  return false if @board[new_p[0]][new_p[1]]
  new_p
end

@cnt = 0

def move(cur_p, depth)
  return true if depth == 12
  if new_p = move_top(cur_p)
    if move(new_p, depth + 1)
      @cnt += 1
    end
  end
  if new_p = move_bottom(cur_p)
    if move(new_p, depth + 1)
      @cnt += 1
    end
  end
  if new_p = move_left(cur_p)
    if move(new_p, depth + 1)
      @cnt += 1
    end
  end
  if new_p = move_right(cur_p)
    if move(new_p, depth + 1)
      @cnt += 1
    end
  end
end

base_point = [13, 13]
move(base_point, 1)
p @cnt

# 反省
# 全然違った。
