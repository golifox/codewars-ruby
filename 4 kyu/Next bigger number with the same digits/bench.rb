# frozen_string_literal: true

require 'benchmark'
require_relative 'solution'
require_relative 'best_codewars_solution'

class Bench
  def self.run
    number = 199_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999

    Benchmark.bmbm do |x|
      x.report('Solution.next_bigger') { Solution.new.next_bigger(number) }
      x.report('BestCodewarsSolution.next_bigger') { BestCodewarsSolution.new.next_bigger(number) }
    end
  end
end

Bench.run

# Mac M1 Pro 16 Gb
#                                        user     system      total        real
# Solution.next_bigger               0.000014   0.000000   0.000014 (  0.000014)
# BestCodewarsSolution.next_bigger   0.000290   0.000001   0.000291 (  0.000293)
