class AoCDay09
  attr_accessor :original_inputs

  def initialize(input)
    @original_inputs = input.split("\n").map { |a| a.split.map(&:to_i) }
  end

  def task_01
    original_inputs.map do |original_input|
      find_sequences(original_input).unshift(original_input)
    end.map do |sequences|
      (0..sequences.length).to_a.reverse.each do |index|
        next if index == sequences.length
        sequences[index] << sequences[index].last + (sequences[index + 1]&.last || 0)
        puts "#{sequences[index]}"
      end
      sequences.first.last
    end.sum
  end

  def task_02
    original_inputs.map do |original_input|
      find_sequences(original_input).unshift(original_input)
    end.map do |sequences|
      (0..sequences.length).to_a.reverse.each do |index|
        next if index == sequences.length
        sequences[index].unshift(sequences[index].first - (sequences[index + 1]&.first || 0))
      end
      sequences.first.first
    end.sum
  end

  def find_sequences(initial)
    sequences = []
    sequences << next_sequence(initial)
    while (sequences.last.any? { |value| value != 0}) do
      sequences << next_sequence(sequences.last)
    end
    sequences
  end

  def next_sequence(initial)
    (0...initial.length - 1).to_a.map do |index|
      initial[index + 1].to_i - initial[index].to_i
    end
  end
end

