class BestCodewarsSolution
  def sum_of_intervals(intervals)
    intervals.map { |i| (i[0]...i[1]).to_a }.flatten.uniq.size
  end
end