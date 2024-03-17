# frozen_string_literal: true

require 'benchmark'
require_relative 'solution'

def sum_of_intervals_flatten(intervals)
  intervals.map { |i| (i[0]...i[1]).to_a }.flatten.uniq.size
end

def sum_of_intervals_reduce_with_each(intervals)
  intervals.sort.reduce([0, -1.0 / 0]) { |(s, r), (a, b)| [s + [b, r].max - [a, r].max, [b, r].max] }[0]
end

# simple arrays
ary = [[1, 2], [6, 10], [11, 15], [1, 4], [7, 10], [3, 5], [1, 5], [10, 20], [1, 6], [16, 19], [5, 11], [0, 20],
       [30, 40]]

Benchmark.bmbm do |x|
  x.report('sum_of_intervals') { sum_of_intervals(ary) }
  x.report('sum_of_intervals_flatten') { sum_of_intervals_flatten(ary) }
  x.report('sum_of_intervals_reduce_with_each') { sum_of_intervals_reduce_with_each(ary) }
end

# Mac M1 Pro 16 Gb
#                                     user     system      total        real
# sum_of_intervals                    0.000006   0.000000   0.000006 (  0.000006)
# sum_of_intervals_flatten            0.000011   0.000001   0.000012 (  0.000011)
# sum_of_intervals_reduce_with_each   0.000009   0.000000   0.000009 (  0.000009)

# hard arrays
ary = [
  [-999_999_000, -999_998_000], # Длинный интервал без пересечений, близкий к минимальному лимиту
  [-100, 100], # Интервал в центре
  [50, 150], # Пересекается с предыдущим
  [200, 300], # Без пересечений с предыдущими
  [290, 350], # Пересекается с предыдущим
  [1_000_000, 2_000_000], # Отдельный большой интервал без пересечений
  [1_500_000, 2_500_000], # Пересекается с предыдущим
  [999_990_000, 999_999_000], # Длинный интервал без пересечений, близкий к максимальному лимиту
  [-500, -400], # Отдельный маленький интервал без пересечений, близкий к центру
  [-450, -350], # Пересекается с предыдущим
  [-800_000_000, -799_000_000], # Очень большой интервал далеко от центра
  [500_000_000, 600_000_000], # Очень большой интервал без пересечений в положительной области
  [-100, -50], # Маленькое пересечение в центральной части
  [999_000_000, 1_000_000_000] # Длинный интервал без пересечений, приближающийся к максимальному лимиту
]

Benchmark.bmbm do |x|
  x.report('sum_of_intervals') { sum_of_intervals(ary) }
  x.report('sum_of_intervals_flatten') { sum_of_intervals_flatten(ary) }
  x.report('sum_of_intervals_reduce_with_each') { sum_of_intervals_reduce_with_each(ary) }
end

# Mac M1 Pro 16 Gb
#                                     user     system      total        real
# sum_of_intervals                    0.000017   0.000006   0.000023 (  0.000019)
# sum_of_intervals_flatten           13.727719   0.730483  14.458202 ( 14.753968)
# sum_of_intervals_reduce_with_each   0.000033   0.000015   0.000048 (  0.000035)
