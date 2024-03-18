# frozen_string_literal: true

require 'benchmark'
require_relative 'solution'
require_relative 'best_codewars_solution'

class Bench
  class << self
    def run
      [simple_arrays, hard_arrays].each do |ary|
        Benchmark.bmbm do |x|
          x.report('Solution.sum_of_intervals') { Solution.new.sum_of_intervals(ary) }
          x.report('BestCodewarsSolution.sum_of_intervals') { BestCodewarsSolution.new.sum_of_intervals(ary) }
        end
      end
    end

    private

    def simple_arrays
      [
        [1, 2], [6, 10], [11, 15], [1, 4], [7, 9], [3, 5], [1, 5],
        [10, 20], [1, 6], [16, 19], [5, 11], [0, 20], [30, 40]
      ].freeze
    end

    def hard_arrays # rubocop:disable Metrics/MethodLength
      [
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
      ].freeze
    end
  end
end

Bench.run

# Mac M1 Pro 16 Gb
# simple_arrays
#                                            user     system      total        real
# Solution.sum_of_intervals               0.000006   0.000000   0.000006 (  0.000006)
# BestCodewarsSolution.sum_of_intervals   0.000010   0.000001   0.000011 (  0.000010)
#
# hard_arrays
#                                             user     system      total        real
# Solution.sum_of_intervals               0.000022   0.000009   0.000031 (  0.000026)
# BestCodewarsSolution.sum_of_intervals  13.632827   0.930917  14.563744 ( 14.946078)
