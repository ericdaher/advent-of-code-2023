require 'minitest/autorun'
require './code'

class AoCDay08Test < Minitest::Test
  def test_setup
    aoc_day08 = AoCDay08.new('RL

                              AAA = (BBB, CCC)
                              BBB = (DDD, EEE)
                              CCC = (ZZZ, GGG)
                              DDD = (DDD, DDD)
                              EEE = (EEE, EEE)
                              GGG = (GGG, GGG)
                              ZZZ = (ZZZ, ZZZ)')
    assert_equal aoc_day08.steps, [1, 0]
    assert_equal aoc_day08.nodes["AAA"], ["BBB", "CCC"]
    assert_equal aoc_day08.nodes["BBB"], ["DDD", "EEE"]
    assert_equal aoc_day08.nodes["GGG"], ["GGG", "GGG"]
    assert_equal aoc_day08.nodes["ZZZ"], ["ZZZ", "ZZZ"]
  end

  def test_task_01
    aoc_day08 = AoCDay08.new('RL

                              AAA = (BBB, CCC)
                              BBB = (DDD, EEE)
                              CCC = (ZZZ, GGG)
                              DDD = (DDD, DDD)
                              EEE = (EEE, EEE)
                              GGG = (GGG, GGG)
                              ZZZ = (ZZZ, ZZZ)')
    assert_equal aoc_day08.task_01, 2

    aoc_day08 = AoCDay08.new('LLR

                              AAA = (BBB, BBB)
                              BBB = (AAA, ZZZ)
                              ZZZ = (ZZZ, ZZZ)')
    assert_equal aoc_day08.task_01, 6
  end

  def test_task_02
    aoc_day08 = AoCDay08.new('LR

                              11A = (11B, XXX)
                              11B = (XXX, 11Z)
                              11Z = (11B, XXX)
                              22A = (22B, XXX)
                              22B = (22C, 22C)
                              22C = (22Z, 22Z)
                              22Z = (22B, 22B)
                              XXX = (XXX, XXX)')
    assert_equal aoc_day08.task_02, 6
  end
end
