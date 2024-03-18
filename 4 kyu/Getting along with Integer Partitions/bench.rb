# frozen_string_literal: true

require 'benchmark'
require_relative 'solution'
require_relative 'best_codewars_solution'

class Bench
  def self.run
    number = 50

    Benchmark.bmbm do |x|
      x.report('Solution.part') { Solution.new.part(number) }
      x.report('BestCodewarsSolution.part') { BestCodewarsSolution.new.part(number) }
    end
  end
end

Bench.run

# Mac M1 Pro 16 Gb
#                                 user     system      total        real
# Solution.part               0.000040   0.000004   0.000044 (  0.000039)
# BestCodewarsSolution.part   0.000345   0.000003   0.000348 (  0.000345)
