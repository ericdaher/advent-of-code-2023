class AoCDay05
  attr_accessor :almanac, :seeds

  def initialize(almanac)
    @almanac = almanac.split("\n\n")
  end

  def task_01
    @seeds = almanac[0].scan(/[0-9]+/).map(&:to_i)
    (1..almanac.length - 1).each do |map|
      seeds = map_source_to_destination(almanac[map])
    end
    seeds.min
  end

  def task_02
    @seeds = almanac[0].scan(/[0-9]+ [0-9]+/).map(&:split).map { |range| range[0].to_i...(range[0].to_i + range[1].to_i) }
    (1..almanac.length - 1).each do |map|
      seeds = map_source_to_destination_v2(almanac[map])
    end
    seeds.map(&:first).min
  end

  def map_source_to_destination(map)
    seeds.each.with_index do |seed, index|
      map.split("\n").drop(1).map(&:strip).each do |line|
        intervals = line.split(' ')
        if seed.between?(intervals[1].to_i, intervals[1].to_i + intervals[2].to_i)
          seeds[index] = intervals[0].to_i + (seed - intervals[1].to_i)
        end
      end
    end
  end

  def map_source_to_destination_v2(map)
    seeds.each.with_index do |seed_range, index|
      other_ranges = []
      map.split("\n").drop(1).map(&:strip).each do |line|
        intervals = line.split(' ')
        source_range = intervals[1].to_i...(intervals[1].to_i + intervals[2].to_i)
        destination_range = intervals[0].to_i...(intervals[0].to_i + intervals[2].to_i)
        if source_range == seed_range
          seeds[index] = destination_range
          break
        elsif source_range.include?(seed_range.first) && source_range.include?(seed_range.last - 1)
          seeds[index] = (destination_range.first + seed_range.first - source_range.first)...(destination_range.last + seed_range.last - source_range.last)
          break
        elsif source_range.include?(seed_range.first) && !source_range.include?(seed_range.last - 1)
          new_range = seed_range.first...source_range.last
          seeds[index] = (destination_range.first + new_range.first - source_range.first)...(destination_range.last + new_range.last - source_range.last)
          other_ranges.push(source_range.last...seed_range.last)
          break
        elsif !source_range.include?(seed_range.first) && source_range.include?(seed_range.last - 1)
          new_range = source_range.first...seed_range.last
          seeds[index] = (destination_range.first + new_range.first - source_range.first)...(destination_range.last + new_range.last - source_range.last)
          other_ranges.push(seed_range.first...source_range.first)
          break
        elsif seed_range.include?(source_range.first) && seed_range.include?(source_range.last - 1)
          seeds[index] = (destination_range.first)...(destination_range.last)
          other_ranges.push(seed_range.first...source_range.first)
          other_ranges.push(source_range.last...seed_range.last)
          break
        end
      end
      seeds.concat(other_ranges) if other_ranges.length > 0
    end
  end
end

