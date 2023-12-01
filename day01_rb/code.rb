class AoCDay01
  attr_accessor :text_array

  DIGITS_SPELLED_OUT = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  }

  def initialize(text)
    @text_array = text.split("\n")
  end

  def task_01
    text_array.map { |line| extract_first_and_last_digit(line) }.sum
  end

  def task_02
    text_array.map { |line| extract_first_and_last_digit_spelled_out(line) }.sum
  end

  def extract_first_and_last_digit(line)
    first_and_last(line.scan(/[0-9]/)).join.to_i
  end

  def extract_first_and_last_digit_spelled_out(line)
    first_and_last(line.scan(spelled_out_digits_regexp)).map { |digit| digit.length > 1 ? DIGITS_SPELLED_OUT[digit.to_sym] : digit }.join.to_i
  end

  private

  def first_and_last(arr)
    [arr.first[0], arr.last[0]]
  end

  def spelled_out_digits_regexp
    /(?=(one|two|three|four|five|six|seven|eight|nine|zero|[0-9]))/
  end
end
