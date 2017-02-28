

module SolveSudoku
  def solve_sudoku sudoku, row, col
    clone_sudoku = deep_copy_sudoku(sudoku)
    if col == 9
      if row == 8
        print_sudoku clone_sudoku
      else
        solve_sudoku(clone_sudoku, row + 1, 0)
      end
    elsif clone_sudoku[row][col] == 0
      1.upto(9) do |number|
        clone_sudoku = deep_copy_sudoku(clone_sudoku)
        if sudoku_rules?(clone_sudoku, row, col, number)
          clone_sudoku[row][col] = number
            solve_sudoku(clone_sudoku, row, col + 1)
        end
      end
    else
      solve_sudoku(clone_sudoku, row, col + 1)
    end
  end

  def print_sudoku(sudoku)
    puts "Impossible" or return  unless sudoku
    border = " +-------+-------+-------+ \n"
    sudoku.each_with_index do |row, row_index|
      puts border if row_index%3 == 0
      row.each_with_index do |col, col_index|
        print col_index%3 == 0 ? " | " : " "
        print col == 0 ? "." : col
      end
      puts " | "
    end
    puts border
  end

  private

  def deep_copy_sudoku(sudoku)
    sudoku.map { |row| row.dup }
  end

  def sudoku_rules?( sudoku, row, col, value)
    (0..8).each do |index|
      return false if sudoku[row][index] == value
      return false if sudoku[index][col] == value
    end
    box_row = 3 * (row / 3)
    box_col= 3 * (col / 3)
    3.times do |row_index|
      3.times do |col_index|
        return false if sudoku[box_row + row_index][box_col + col_index] == value
      end
    end
    return true
  end
end

class SudokuSolver
  include SolveSudoku
end


