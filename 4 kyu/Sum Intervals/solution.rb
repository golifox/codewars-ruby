# frozen_string_literal: true

# Write a function called sum_of_intervals/sum_intervals that accepts an array of intervals, and returns the sum of all
# the interval lengths. Overlapping intervals should only be counted once.
#
# Intervals
# Intervals are represented by a pair of integers in the form of an array. The first value of the interval will always
# be less than the second value. Interval example: [1, 5] is an interval from 1 to 5. The length of this interval is 4.
#
# Overlapping Intervals
# List containing overlapping intervals:
#
# [
# [1, 4],
# [7, 10],
# [3, 5]
# ]
# The sum of the lengths of these intervals is 7. Since [1, 4] and [3, 5] overlap, we can treat the interval as [1, 5],
# which has a length of 4.
#
# Examples:
# sum_of_intervals( [
# [1, 2],
# [6, 10],
# [11, 15]
# ] ) => 9
#
# sum_of_intervals( [
# [1, 4],
# [7, 10],
# [3, 5]
# ] ) => 7
#
# sum_of_intervals( [
# [1, 5],
# [10, 20],
# [1, 6],
# [16, 19],
# [5, 11]
# ] ) => 19
#
# sum_of_intervals( [
# [0, 20],
# [-100000000, 10],
# [30, 40]
# ] ) => 100000030
# Tests with large intervals
# Your algorithm should be able to handle large intervals.
# All tested intervals are subsets of the range [-1000000000, 1000000000].

def sum_of_intervals(intervals)
  return 0 unless intervals.is_a?(Array) && !intervals.empty?

  sorted_intervals = intervals.sort_by(&:first)
  merged_intervals = merge_intervals(sorted_intervals)
  merged_intervals.sum { |start, finish| finish - start }
end

def merge_intervals(intervals)
  intervals.each_with_object([]) do |current_interval, merged|
    if merged.empty? || current_interval.first > merged.last.last
      merged << current_interval
    else
      merged.last[1] = [merged.last.last, current_interval.last].max
    end
  end
end

# p sum_of_intervals([]).zero?
# p sum_of_intervals([[1, 2]]) == 1
# p sum_of_intervals([[1, 2],[6, 10],[11, 15]]) == 9
# p sum_of_intervals([[1, 4],[7, 10],[3, 5]]) == 7
# p sum_of_intervals([[1, 5],[10, 20],[1, 6],[16, 19],[5, 11]]) == 19
# p sum_of_intervals([[0, 20],[-100000000, 10],[30, 40]]) == 100000030
