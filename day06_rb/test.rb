require 'minitest/autorun'
require './code'

class AoCDay06Test < Minitest::Test
  def test_possible_solutions
    aoc_day06 = AoCDay06.new('')
    assert_equal aoc_day06.possible_solutions(7, 9), 4
    assert_equal aoc_day06.possible_solutions(15, 40), 8
    assert_equal aoc_day06.possible_solutions(30, 200), 9
  end

  def test_task_01
    aoc_day06 = AoCDay06.new('Time:      7  15   30
                              Distance:  9  40  200')
    assert_equal aoc_day06.task_01, 288
  end

  def test_task_02
    aoc_day06 = AoCDay06.new('Time:      7  15   30
                              Distance:  9  40  200')
    assert_equal aoc_day06.task_02, 71503
  end
end
