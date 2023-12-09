class AoCDay07
  attr_accessor :lines

  INDIVIDUAL_CARD_SCORE = {
    'A': 14,
    'K': 13,
    'Q': 12,
    'J': 11,
    'T': 10,
    '9': 9,
    '8': 8,
    '7': 7,
    '6': 6,
    '5': 5,
    '4': 4,
    '3': 3,
    '2': 2
  }

  def initialize(input)
    @lines = input.split("\n").map { |a| [a.split[0], a.split[1].to_i] }
  end

  def task_01
    lines.map { |line| [hand_score(line[0]), line[1]] }.sort_by { |line| line[0] }.map.with_index { |line, index| (index + 1) * line[1] }.sum
  end

  def task_02
    INDIVIDUAL_CARD_SCORE['J'.to_sym] = 1
    sum = lines.map { |line| [hand_score_with_replacement(line[0]), line[1]] }.sort_by { |line| line[0] }.map.with_index { |line, index| (index + 1) * line[1] }.sum
    INDIVIDUAL_CARD_SCORE['J'.to_sym] = 11
    sum
  end

  def hand_score(hand)
    case groupped_hand(hand)
    when -> (h) { h.keys.count == 1 }
      700000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 2 && h.values.any? { |v| v == 4 } }
      600000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 2 && h.values.to_set == [3, 2].to_set }
      500000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 3 && h.values.any? { |v| v == 3 }}
      400000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 3 && h.values.to_set == [2, 2, 1].to_set }
      300000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 4 }
      200000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 5 }
      100000000000 + individual_cards_score(hand)
    end
  end

  def hand_score_with_replacement(hand)
    case groupped_hand(replace_joker(hand))
    when -> (h) { h.keys.count == 1 }
      700000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 2 && h.values.any? { |v| v == 4 } }
      600000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 2 && h.values.to_set == [3, 2].to_set }
      500000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 3 && h.values.any? { |v| v == 3 }}
      400000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 3 && h.values.to_set == [2, 2, 1].to_set }
      300000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 4 }
      200000000000 + individual_cards_score(hand)
    when -> (h) { h.keys.count == 5 }
      100000000000 + individual_cards_score(hand)
    end
  end

  private

  def groupped_hand(hand)
    group = hand.chars.group_by(&:itself)
    group.each { |k, v| group[k] = v.count }
  end

  def individual_cards_score(hand)
    hand.chars.map.with_index { |card, index| INDIVIDUAL_CARD_SCORE[card.to_sym].to_s.rjust(2, "0") }.join.to_i
  end

  def replace_joker(card)
    remaining_cards = groupped_hand(card)&.reject { |k, v| k == 'J' }
    best_card = remaining_cards&.sort_by { |k, v| v }&.last&.first || "A"
    card.gsub('J', best_card)
  end
end
