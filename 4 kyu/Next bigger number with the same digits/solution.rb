# frozen_string_literal: true

# Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging
# its digits. For example:
#
#   12 ==> 21
#  513 ==> 531
# 2017 ==> 2071
# If the digits can't be rearranged to form a bigger number, return -1 (or nil in Swift, None in Rust):
#
#   9 ==> -1
# 111 ==> -1
# 531 ==> -1

class Solution
  def next_bigger(n)
    digits = n.to_s.chars
    i = digits.size - 2

    i -= 1 while i >= 0 && digits[i] >= digits[i + 1]

    return -1 if i.negative?

    j = digits.size - 1
    j -= 1 while digits[j] <= digits[i]

    digits[i], digits[j] = digits[j], digits[i]

    digits[i + 1..-1] = digits[i + 1..].reverse

    digits.join.to_i
  end
end
