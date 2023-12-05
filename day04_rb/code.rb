class AoCDay04
  attr_accessor :cards

  def initialize(table)
    @cards = table.split("\n").map(&:strip)
  end

  def task_01
    cards.map { |card| winning_numbers_in_card(card) - 1 }.select { |n| n >= 0 }.map { |n| 2 ** n }.sum
  end

  def winning_numbers_in_card(card)
    winning_numbers, card_numbers = card.split('|').map { |numbers| numbers.scan(/([0-9]+)/).flatten }
    winning_numbers = winning_numbers.drop(1)
    (winning_numbers & card_numbers).count
  end

  def task_02
    multipliers = (1..cards.length).to_a.map { |n| 1 }
    cards.each.with_index do |card, index|
      matching_numbers = winning_numbers_in_card(card)
      matching_numbers.times do |n|
        multipliers[index + n + 1] += 1 * multipliers[index]
      end
    end
    multipliers.sum
  end
end
