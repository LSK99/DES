class Permutations
  INITIAL_BLOCK_PERMUTATION_TABLE =
    [
      58, 50, 42, 34, 26, 18, 10, 2,
      60, 52, 44, 36, 28, 20, 12, 4,
      62, 54, 46, 38, 30, 22, 14, 6,
      64, 56, 48, 40, 32, 24, 16, 8,
      57, 49, 41, 33, 25, 17, 9, 1,
      59, 51, 43, 35, 27, 19, 11, 3,
      61, 53, 45, 37, 29, 21, 13, 5,
      63, 55, 47, 39, 31, 23, 15, 7
    ].freeze

  PERMUTATION_CHOICE_1_TABLE =
    [
      57, 49, 41, 33, 25, 17, 9, 1,
      58, 50, 42, 34, 26, 18, 10, 2,
      59, 51, 43, 35, 27, 19, 11, 3,
      60, 52, 44, 36, 63, 55, 47, 39,
      31, 23, 15, 7, 62, 54, 46, 38,
      30, 22, 14, 6, 61, 53, 45, 37,
      29, 21, 13, 5, 28, 20, 12, 4
    ].freeze

  PERMUTATION_CHOICE_2_TABLE =
    [
      14, 17, 11, 24, 1, 5,
      3, 28, 15, 6, 21, 10,
      23, 19, 12, 4, 26, 8,
      16, 7, 27, 20, 13, 2,
      41, 52, 31, 37, 47, 55,
      30, 40, 51, 45, 33, 48,
      44, 49, 39, 56, 34, 53,
      46, 42, 50, 36, 29, 32
    ].freeze

  def initial_block_permutation(block)
    permutation = permute(INITIAL_BLOCK_PERMUTATION_TABLE, block)
    puts "Initial block permutation #{permutation.join('')}"
    permutation
  end

  def permutation_choice_one(key)
    permutation = permute(PERMUTATION_CHOICE_1_TABLE, key)
    puts "Permutation choice 1   #{permutation.join('')}"
    permutation
  end

  def permutation_choice_two(key)
    permutation = permute(PERMUTATION_CHOICE_2_TABLE, key)
    puts "Permutation choice 2   #{permutation.join('')}"
    permutation
  end

  def permute(table, block)
    permuted = []
    table.map { |index| permuted << block[index - 1] }
    permuted
  end
end
