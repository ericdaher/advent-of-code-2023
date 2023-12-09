require 'minitest/autorun'
require './code'

class AoCDay07Test < Minitest::Test
  def test_hand_score
    aoc_day07 = AoCDay07.new('')
    assert_equal aoc_day07.hand_score('AAAAA'), 701414141414
  end

  def test_task_01
    aoc_day07 = AoCDay07.new('32T3K 765
                              T55J5 684
                              KK677 28
                              KTJJT 220
                              QQQJA 483')
    assert_equal aoc_day07.task_01, 6440
  end

  def test_task_02
    aoc_day07 = AoCDay07.new('32T3K 765
                              T55J5 684
                              KK677 28
                              KTJJT 220
                              QQQJA 483')
    assert_equal aoc_day07.task_02, 5905
  end
end
