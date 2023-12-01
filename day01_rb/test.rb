require 'minitest/autorun'
require './code'

class AoCDay01Test < Minitest::Test
  def test_extract_first_and_last_digit
    aoc_day01 = AoCDay01.new('')
    assert_equal aoc_day01.extract_first_and_last_digit('1abc2'), 12
    assert_equal aoc_day01.extract_first_and_last_digit('pqr3stu8vwx'), 38
    assert_equal aoc_day01.extract_first_and_last_digit('a1b2c3d4e5f'), 15
    assert_equal aoc_day01.extract_first_and_last_digit('treb7uchet'), 77
  end

  def test_task_01
    aoc_day01 = AoCDay01.new('1abc2
                              pqr3stu8vwx
                              a1b2c3d4e5f
                              treb7uchet')
    assert_equal aoc_day01.task_01, 142
  end

  def test_extract_first_and_last_digit_spelled_out
    aoc_day01 = AoCDay01.new('')
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('two1nine'), 29
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('eightwothree'), 83
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('abcone2threexyz'), 13
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('xtwone3four'), 24
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('4nineeightseven2'), 42
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('zoneight234'), 14
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('7pqrstsixteen'), 76
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('eighthree'), 83
    assert_equal aoc_day01.extract_first_and_last_digit_spelled_out('sevenine'), 79
  end

  def test_task_02
    aoc_day01 = AoCDay01.new('two1nine
                              eightwothree
                              abcone2threexyz
                              xtwone3four
                              4nineeightseven2
                              zoneight234
                              7pqrstsixteen')
    assert_equal aoc_day01.task_02, 281
  end
end
