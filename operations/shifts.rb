class Shifts
  ROUNDS_WITH_ONE_SHIFT = [1, 2, 9, 16].freeze

  def left_shift(round, block)
    puts "Block before left rotation #{block.join('')}"
    shift = ROUNDS_WITH_ONE_SHIFT.include?(round) ? 1 : 2
    block = block.rotate(shift)
    puts "Block after left rotation  #{block.join('')}"
    block
  end
end