require 'minitest/autorun'
require './code'

class AoCDay04Test < Minitest::Test
  def test_winning_numbers_in_card
    aoc_day04 = AoCDay04.new('')
    assert_equal aoc_day04.winning_numbers_in_card('Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53'), 4
    assert_equal aoc_day04.winning_numbers_in_card('Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19'), 2
    assert_equal aoc_day04.winning_numbers_in_card('Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1'), 2
    assert_equal aoc_day04.winning_numbers_in_card('Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83'), 1
    assert_equal aoc_day04.winning_numbers_in_card('Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36'), 0
    assert_equal aoc_day04.winning_numbers_in_card('Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'), 0
  end

  def test_task_01
    aoc_day04 = AoCDay04.new('Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
                              Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
                              Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
                              Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
                              Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
                              Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11')
    assert_equal aoc_day04.task_01, 13
  end

  def test_task_02
    aoc_day04 = AoCDay04.new('Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
                              Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
                              Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
                              Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
                              Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
                              Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11')
    assert_equal aoc_day04.task_02, 30
  end
end
