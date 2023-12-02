class AoCDay02
  attr_accessor :games_array

  MAX_RED_CUBES = 12
  MAX_GREEN_CUBES = 13
  MAX_BLUE_CUBES = 14

  def initialize(games)
    @games_array = games.split("\n")
  end

  def task_01
    sum = 0
    games_array.each do |game|
      max_cubes = max_cubes_in_game(game)
      sum += game.match(/Game ([0-9]+)/)[1].to_i if possible_game?(max_cubes)
    end
    sum
  end

  def task_02
    sum = 0
    games_array.each do |game|
      max_cubes = max_cubes_in_game(game)
      sum += max_cubes[:red] * max_cubes[:green] * max_cubes[:blue]
    end
    sum
  end

  def max_cubes_in_game(game)
    cubes = {}
    %i[red green blue].each do |color|
      cubes[color] = game.scan(/([0-9]+) #{color}/).flatten.map(&:to_i).max
    end
    cubes
  end

  private

  def possible_game?(cubes)
    cubes.all? { |color, amount| amount <= AoCDay02.const_get("max_#{color}_cubes".upcase) }
  end
end
