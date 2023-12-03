class AoCDay03
  attr_accessor :schematic, :line_length

  def initialize(text)
    @schematic = add_boundaries(text)
  end

  def task_01
    sum = 0
    positions = []
    schematic.chars.each.with_index do |char, index|
      if char.match(/[0-9]/)
        positions << index
        if schematic.chars[index + 1].match(/[0-9]/)
          next
        else
          no_symbols = positions.all? do |position|
            adjacent_positions(position, line_length).all? do |adjacent_position|
              schematic[adjacent_position].match(/[0-9]|\./)
            end
          end
          sum = sum + positions.map { |p| schematic[p] }.join.to_i if !no_symbols
          positions = []
        end
      end
    end
    sum
  end

  def task_02
    positions = []
    gears = {}
    schematic.chars.each.with_index do |char, index|
      if char.match(/[0-9]/)
        positions << index
        if schematic.chars[index + 1].match(/[0-9]/)
          next
        else
          gear_symbol_position = 0
          gear_symbol = positions.any? do |position|
            adjacent_positions(position, line_length).any? do |adjacent_position|
              gear_symbol_position = adjacent_position if schematic[adjacent_position].match(/\*/)
              schematic[adjacent_position].match(/\*/)
            end
          end
          if gear_symbol
            gears[gear_symbol_position] = [] if gears[gear_symbol_position].nil?
            gears[gear_symbol_position] << positions.map { |p| schematic[p] }.join.to_i
          end
          positions = []
        end
      end
    end
    gears.filter { |gear_position, values| values.length == 2 }.map { |gear_position, values| values[0] * values[1] }.sum
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
    ]
  end
end
