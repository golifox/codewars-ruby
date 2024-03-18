class BestCodewarsSolution
  require 'set'
  Cache = {}

  def prods(n)
    return Cache[n] if Cache[n]
    c = Set.new([n])
    (1..(n - 1)).each do |k|
      prods(n - k).each { |x| c << (k * x) }
    end
    Cache[n] = c.to_a.sort.freeze
  end

  def part(n)
    ps = prods(n)
    range = ps[-1] - ps[0]
    avg = ps.reduce(&:+).to_f / ps.length
    median =
      if ps.length.odd?
        ps[ps.length / 2].to_f
      else
        (ps[(ps.length / 2) - 1] + ps[ps.length / 2]).to_f / 2
      end
    "Range: #{range} Average: #{'%.2f' % avg} Median: #{'%.2f' % median}"
  end
end