require 'securerandom'
require './operations/permutations'
require './operations/shifts'
require './operations/round_function'

class Des
  attr_reader :initial_block, :key, :permutations, :shifts, :round_function
  def initialize(
    random_block: -> { (1..64).map { [0, 1].sample }.join.chars },
    permutations: Permutations.new,
    shifts: Shifts.new,
    round_function: RoundFunction.new
  )
    @round_function = round_function
    @shifts = shifts
    @initial_block = random_block.call
    @key = random_block.call
    @permutations = permutations
  end

  def encrypt
    puts "Initial block             #{initial_block.join('')}"
    puts "Initial key               #{key.join('')}"

    puts "Round output #{round_encryption(1).join('')}"
  end

  def round_key(round_number)
    permutation_choice_one = permutations.permutation_choice_one(key)

    left_key_block = permutation_choice_one[0..27]
    right_key_block = permutation_choice_one[28..55]

    left_key_block = shifts.left_shift(round_number, left_key_block)
    right_key_block = shifts.left_shift(round_number, right_key_block)

    permutations.permutation_choice_two(left_key_block.push(*right_key_block))
  end

  def round_encryption(round_number)
    initial_block_permutation = permutations.initial_block_permutation(initial_block)

    first_left_block = initial_block_permutation[0..31]
    first_right_block = initial_block_permutation[32..63]

    second_left_block = first_right_block

    first_right_block = round_function.expand_block(first_right_block)

    xored = round_function.xor(first_right_block, round_key(round_number))

    input_s_boxes = xored.each_slice(6).to_a
    output_s_boxes = round_function.proceed_s_boxes(input_s_boxes)

    round_function_output = round_function.function_permute(output_s_boxes)
    second_right_block = round_function.xor(round_function_output, first_left_block)
    second_left_block.push(*second_right_block)
  end
end