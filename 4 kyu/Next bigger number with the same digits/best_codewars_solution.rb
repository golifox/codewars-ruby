class BestCodewarsSolution
  def next_bigger(n)
    chars = n.to_s.chars

    (0..chars.length - 2).reverse_each do |i|
      (i + 1..chars.length - 1).reverse_each do |j|
        if chars[i] < chars[j]
          chars[i], chars[j] = chars[j], chars[i]
          return (chars.first(i + 1) + chars.last(chars.length - 1 - i).sort).join.to_i
        end
      end
    end
    -1
  end
end