require 'minitest/autorun'
require './code'

class AoCDay02Test < Minitest::Test
  def test_max_cubes_in_game
    aoc_day02 = AoCDay02.new('')
    assert_equal aoc_day02.max_cubes_in_game('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'), { red: 4, green: 2, blue: 6 }
    assert_equal aoc_day02.max_cubes_in_game('Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue'), { red: 1, green: 3, blue: 4 }
    assert_equal aoc_day02.max_cubes_in_game('Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red'), { red: 20, green: 13, blue: 6 }
    assert_equal aoc_day02.max_cubes_in_game('Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red'), { red: 14, green: 3, blue: 15 }
    assert_equal aoc_day02.max_cubes_in_game('Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green'), { red: 6, green: 3, blue: 2 }
  end

  def test_task_01
    aoc_day02 = AoCDay02.new('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
                              Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
                              Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
                              Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
                              Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green')
    assert_equal aoc_day02.task_01, 8
  end

  def test_task_02
    aoc_day02 = AoCDay02.new('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
                              Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
                              Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
                              Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
                              Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green')
    assert_equal aoc_day02.task_02, 2286
  end
end
