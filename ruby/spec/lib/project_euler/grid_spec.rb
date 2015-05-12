require 'spec_helper'

module ProjectEuler
  RSpec.describe ProjectEuler::Grid do

    let(:grid) do
      Grid.new(4, [
         1,  2,  3,  4,
         5,  6,  7,  8,
         9, 10, 11, 12,
        13, 14, 15, 16
      ])
    end

    describe '#[]' do
      context 'corners' do
        it 'gets the right number for the top-left corner' do
          expect(grid[0, 0]).to eq(1)
        end

        it 'gets the right number for the top-right corner' do
          expect(grid[0, 3]).to eq(4)
        end

        it 'gets the right number for the bottom-right corner' do
          expect(grid[3, 3]).to eq(16)
        end

        it 'gets the right number for the bottom-left corner' do
          expect(grid[3, 0]).to eq(13)
        end
      end

      context 'negative indices' do
        it 'returns nil' do
          expect(grid[-1, 0]).to be_nil
          expect(grid[0, -1]).to be_nil
        end
      end

      context 'out-of-bounds indices' do
        it 'returns nil' do
          expect(grid[2984924587935839, 0]).to be_nil
          expect(grid[0, 2984924587935839]).to be_nil
        end
      end
    end

    describe '#all_rows' do
      it 'returns an array of arrays representing the rows of the grid' do
        expect(grid.all_rows).to eq([
          [  1,  2,  3,  4 ],
          [  5,  6,  7,  8 ],
          [  9, 10, 11, 12 ],
          [ 13, 14, 15, 16 ]
        ])
      end
    end

    describe '#all_columns' do
      it 'returns an array of arrays representing the columns of the grid' do
        expect(grid.all_columns).to eq([
          [  1,  5,  9, 13 ],
          [  2,  6, 10, 14 ],
          [  3,  7, 11, 15 ],
          [  4,  8, 12, 16 ]
        ])
      end
    end

    describe '#all_diagonals' do
      it 'returns an array of arrays representing the diagonals of the grid' do
        expect(grid.all_diagonals).to eq([
          [ 1 ],
          [ 5, 2 ],
          [ 9, 6, 3 ],
          [ 13, 10, 7, 4 ],
          [ 14, 11, 8 ],
          [ 15, 12 ],
          [ 16 ]
        ])
      end
    end

    describe '#all_antidiagonals' do
      it 'returns an array of arrays representing the antidiagonals of the grid' do
        expect(grid.all_antidiagonals).to eq([
          [ 13 ],
          [ 9, 14 ],
          [ 5, 10, 15 ],
          [ 1, 6, 11, 16 ],
          [ 2, 7, 12 ],
          [ 3, 8 ],
          [ 4 ]
        ])
      end
    end

    describe '#by_antidiagonal' do
      [
        [ 13 ],
        [ 9, 14 ],
        [ 5, 10, 15 ],
        [ 1, 6, 11, 16 ],
        [ 2, 7, 12 ],
        [ 3, 8 ],
        [ 4 ]
      ].each_with_index do |expected_value, index|
        it "finds the correct value for diagonal number #{index}" do
          expect(grid.by_antidiagonal(index)).to eq(expected_value)
        end
      end
    end

    describe '#by_diagonal' do
      [
        [ 1 ],
        [ 5, 2 ],
        [ 9, 6, 3 ],
        [ 13, 10, 7, 4 ],
        [ 14, 11, 8 ],
        [ 15, 12 ],
        [ 16 ]
      ].each_with_index do |expected_value, index|
        it "finds the correct value for diagonal number #{index}" do
          expect(grid.by_diagonal(index)).to eq(expected_value)
        end
      end
    end

    describe '#by_column' do
      it 'grabs a column out of the grid' do
        expect(grid.by_column(2)).to eq([ 3, 7, 11, 15 ])
      end
    end

    describe '#by_row' do
      it 'grabs a row out of the grid' do
        expect(grid.by_row(2)).to eq([ 9, 10, 11, 12 ])
      end
    end

  end
end
