# 10 進数、 2 進数、 8 進数 の いずれ で 表現 し ても 回文 数 と なる 数 の うち、 10 進数 の 10 以上 で 最小 の 値 を 求め て ください。

def isPalindrome(str)
  if str.size.even?
    center = str.size / 2
    str[0 ... center] == str[center .. -1].reverse
  else
    center = (str.size - 1) / 2
    str[0 ... center] == str[center + 1 .. -1].reverse
  end
end

def isPalindrome10(base10)
  isPalindrome base10.to_s
end

def isPalindrome8(base10)
  isPalindrome base10.to_s(8)
end

def isPalindrome2(base10)
  isPalindrome base10.to_s(2)
end

def main
  n = 10
  while true
    if isPalindrome10(n) && isPalindrome8(n) && isPalindrome2(n)
      break n
    end
    n += 1
  end
  n
end

n = main
puts n.to_s, n.to_s(8), n.to_s(2)
