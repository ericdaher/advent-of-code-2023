class AoCDay03
  attr_accessor :schematic, :line_length

  def initialize(text)
    @schematic = add_boundaries(text)
  end

  def task_01
    symbols = []
    schematic.scan(/[^\.\w]/) do |c|
      symbols << adjacent_positions(Regexp.last_match.offset(0)[0], line_length).flatten
    end
    symbols.flatten!.uniq!

    numbers = {}
    schematic.scan(/[0-9]+/) do |c|
      if numbers[c].nil?
        numbers[c] = []
        c.length.times do |n|
          numbers[c] << Regexp.last_match.offset(0)[0] + n
        end
      else
        leading_zeroes = 0
        leading_zeroes += 1 until numbers['0' * leading_zeroes + c].nil?
        numbers['0' * leading_zeroes + c] = []
        c.length.times do |n|
          numbers['0' * leading_zeroes + c] << Regexp.last_match.offset(0)[0] + n
        end
      end
    end

    numbers.select { |k, v| (v & symbols).length > 0 }.keys.map(&:to_i).sum
  end

  def task_02
    symbols = []
    schematic.scan(/\*/) do |c|
      symbols << adjacent_positions(Regexp.last_match.offset(0)[0], line_length)
    end
    symbols

    numbers = {}
    schematic.scan(/[0-9]+/) do |c|
      if numbers[c].nil?
        numbers[c] = []
        c.length.times do |n|
          numbers[c] << Regexp.last_match.offset(0)[0] + n
        end
      else
        leading_zeroes = 0
        leading_zeroes += 1 until numbers['0' * leading_zeroes + c].nil?
        numbers['0' * leading_zeroes + c] = []
        c.length.times do |n|
          numbers['0' * leading_zeroes + c] << Regexp.last_match.offset(0)[0] + n
        end
      end
    end

    gears = []
    symbols.each.with_index do |symbol_position, index|
      gears[index] = []
      numbers.each do |k, v|
        gears[index] << k.to_i if (symbol_position & v).length > 0
      end
    end
    gears.select { |arr| arr.length == 2}.map { |arr| arr[0] * arr[1] }.sum
  end

  private

  def add_boundaries(text)
    text = text.gsub!(' ', '').split("\n")
    @line_length = text[0].length + 2
    ['.' * (line_length), text.map { |line| ".#{line}." }, '.' * (line_length)].flatten.join
  end

  def adjacent_positions(position, length)
    [
      position - 1 - length,
      position - 1,
      position - 1 + length,
      position - length,
      position + length,
      position + 1 - length,
      position + 1,
      position + 1 + length,
    ].select { |n| n > 0}
  end
end
