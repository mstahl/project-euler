module ProjectEuler
  class Grid
    attr_reader :contents, :size

    def initialize(size, contents = [])
      @contents = contents
      @size = size
    end

    def [](row, col)
      return nil if [row, col].any? {|q| q < 0}

      @contents[row * @size + col]
    end

    def []=(row, col, val)
      @contents[row * @size + col] = val
    end

    def all_antidiagonals
      (0...2 * @size - 1).map {|i| by_antidiagonal(i)}
    end

    def all_columns
      (0...@size).map {|i| by_column(i)}
    end

    def all_diagonals
      (0...2 * @size - 1).map {|i| by_diagonal(i)}
    end

    def all_rows
      (0...@size).map {|i| by_row(i)}
    end

    def by_row(row)
      [].tap do |result|
        (0...@size).each do |col|
          result << self[row, col]
        end
      end
    end

    def by_column(column)
      [].tap do |result|
        (0...@size).each do |row|
          result << self[row, column]
        end
      end
    end

    def by_diagonal(i)
      [].tap do |diagonal|
        (0...@size).each do |col|
          row = i - col
          diagonal << self[row, col]
        end
        diagonal.compact!
      end
    end

    def by_antidiagonal(i)
      [].tap do |diagonal|
        (0...@size).each do |col|
          row = @size - 1 - (i - col)
          diagonal << self[row, col]
        end
        diagonal.compact!
      end
    end

    def inspect
      str = ""
      (0...@size).each do |row|
        str << "[ "
        (0...@size).each do |col|
          str << "%08d " % self[col, row]
        end
        str << "]\n"
      end
      str
    end
  end
end
