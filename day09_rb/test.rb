require 'minitest/autorun'
require './code'

class AoCDay09Test < Minitest::Test
  def test_next_sequence
    aoc_day09 = AoCDay09.new('')
    assert_equal aoc_day09.next_sequence([0, 3, 6, 9, 12, 15]), [3, 3, 3, 3, 3]
    assert_equal aoc_day09.next_sequence([1, 3, 6, 10, 15, 21]), [2, 3, 4, 5, 6]
    assert_equal aoc_day09.next_sequence([10, 13, 16, 21, 30, 45]), [3, 3, 5, 9, 15]
  end

  def test_find_sequences
    aoc_day09 = AoCDay09.new('')
    assert_equal aoc_day09.find_sequences([0, 3, 6, 9, 12, 15]), [[3, 3, 3, 3, 3], [0, 0, 0, 0]]
    assert_equal aoc_day09.find_sequences([1, 3, 6, 10, 15, 21]), [[2, 3, 4, 5, 6], [1, 1, 1, 1], [0, 0, 0]]
    assert_equal aoc_day09.find_sequences([10, 13, 16, 21, 30, 45]), [[3, 3, 5, 9, 15], [0, 2, 4, 6], [2, 2, 2], [0, 0]]
  end

  def test_task_01
    aoc_day09 = AoCDay09.new('0 3 6 9 12 15
                              1 3 6 10 15 21
                              10 13 16 21 30 45')
    assert_equal aoc_day09.task_01, 114
  end

  def test_task_02
    aoc_day09 = AoCDay09.new('0 3 6 9 12 15
                              1 3 6 10 15 21
                              10 13 16 21 30 45')
    assert_equal aoc_day09.task_02, 2
  end
end
