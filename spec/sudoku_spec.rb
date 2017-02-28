require './sudoku'
RSpec.describe "Sudoku tes" do
  source = [[0, 3, 0, 0, 6, 8, 0, 0, 0],
           [0, 4, 0, 0, 0, 0, 0, 0, 1],
           [1, 0, 0, 3, 0, 0, 0, 7, 0],
           [7, 2, 0, 0, 5, 0, 8, 0, 0],
           [0, 0, 4, 0, 0, 0, 6, 0, 0],
           [8, 0, 0, 0, 0, 9, 2, 0, 0],
           [0, 0, 0, 0, 2, 0, 0, 0, 0],
           [5, 0, 1, 0, 0, 0, 0, 0, 0],
           [0, 0, 0, 0, 0, 5, 0, 9, 0]]

  target = [[9, 3, 7, 1, 6, 8, 5, 2, 4],
           [6, 4, 2, 5, 9, 7, 3, 8, 1],
           [1, 5, 8, 3, 4, 2, 9, 7, 6],
           [7, 2, 6, 4, 5, 3, 8, 1, 9],
           [3, 9, 4, 2, 8, 1, 6, 5, 7],
           [8, 1, 5, 6, 7, 9, 2, 4, 3],
           [4, 7, 9, 8, 2, 6, 1, 3, 5],
           [5, 8, 1, 9, 3, 4, 7, 6, 2],
           [2, 6, 3, 7, 1, 5, 4, 9, 8]]


  context "solve sudoku" do
    it "has some result" do
      expect { SudokuSolver.new.solve_sudoku(source, 0, 0)}.to output.to_stdout
    end

    it "pass the test" do
      expect { SudokuSolver.new.solve_sudoku(source, 0, 0)}.to output(SudokuSolver.new.print_sudoku(target)).to_stdout
    end
  end
end
