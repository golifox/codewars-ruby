# frozen_string_literal: true

# Complete the function/method (depending on the language) to return true/True when its argument is an array that has
# the same nesting structures and same corresponding length of nested arrays as the first array.
#
# For example:
#
# # should return true
# [ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )
#
# # should return false
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] )
#
# # should return true
# [ [ [ ], [ ] ] ].same_structure_as( [ [ [ ], [ ] ] ] );
#
# # should return false
# [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )

class Array
  def same_structure_as(another)
    return false unless another.is_a? Array

    structure == another.structure
  end

  def structure
    map { |item| item.structure if item.is_a?(Array) }
  end
end

# should return true
p [1, 1, 1].same_structure_as([2, 2, 2])
p [1, [1, 1]].same_structure_as([2, [2, 2]])

# should return false
p [1, [1, 1]].same_structure_as([[2, 2], 2])
p [1, [1, 1]].same_structure_as([[2], 2])

# should return true
p [[[], []]].same_structure_as([[[], []]])

# should return false
p [[[], []]].same_structure_as([[1, 1]])
