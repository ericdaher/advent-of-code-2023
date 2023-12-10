class AoCDay08
  attr_accessor :steps, :nodes, :path

  def initialize(input)
    @steps = input.split("\n\n")[0].chars.map { |step| step == "L" ? 0 : 1}
    @nodes = {}
    input.split("\n\n")[1].split("\n").each { |line| nodes[line.split(" = ")[0].strip] =  line.split(" = ")[1].scan(/[A-Z0-9]+/) }
  end

  def task_01
    path = 0
    searched_value = "AAA"
    while (searched_value != "ZZZ") do
      steps.each do |step|
        searched_value = nodes.select { |key, value| key == searched_value }.values.flatten[step]
        path += 1
      end
    end
    path
  end

  def task_02
    searched_values = nodes.keys.select { |key| key.chars.last == "A" }
    paths = searched_values.map { |_| 0 }
    searched_values.each.with_index do |searched_value, index|
      while (searched_values[index].chars.last != "Z" ) do
        steps.each do |step|
          searched_values[index] = nodes.select { |key, value| key == searched_values[index] }.values.flatten[step]
          paths[index] += 1
        end
      end
    end
    paths.reduce(1, :lcm)
  end
end

