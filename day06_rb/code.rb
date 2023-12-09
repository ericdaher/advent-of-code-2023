class AoCDay06
  attr_accessor :input, :times, :distances

  def initialize(input)
    @input = input
  end

  def task_01
    @times, @distances = input.split("\n").map { |line| line.scan(/[0-9]+/) }
    times.map.with_index do |time, index|
      possible_solutions(time.to_i, distances[index].to_i)
    end.inject(&:*)
  end

  def task_02
    @times, @distances = input.split("\n").map { |line| line.scan(/[0-9]+/).join.to_i }
    possible_solutions(times, distances)
  end

  def possible_solutions(time, dist)
    lower_bound = (time - Math.sqrt(time ** 2 - 4 * (dist + 1))) / 2
    upper_bound = (time + Math.sqrt(time ** 2 - 4 * (dist + 1))) / 2
    (lower_bound.ceil..upper_bound.floor).count
  end
end

