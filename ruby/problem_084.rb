#!`which ruby`

# Constants ===================================================================

if ARGV[0] then
  NUM_TESTS = ARGV[0].to_i
else
  NUM_TESTS = 1_000
end
NUM_SIDES = 4

# Globals =====================================================================

@monopoly_board = %w{
  GO A1 CC1 A2 T1 R1 B1 CH1 B2 B3 JAIL
  C1 U1 C2 C3 R2 D1 CC2 D2 D3 FP
  E1 CH2 E2 E3 R3 F1 F2 U2 F3 G2J
  G1 G2 CC3 G3 R4 CH3 H1 H2
}

@position = 0
@rolls = []
@positions = {}

# Methods =====================================================================

def go_to(square_name)
  @position = @monopoly_board.find_index(square_name)
end

def go_to_next(pattern)
  @position = (@position + 1) % @monopoly_board.count
  until @monopoly_board[@position] =~ pattern
    @position = (@position + 1) % @monopoly_board.count
  end
end

def community_chest
  case rand(16)
  when 1
    go_to 'GO'
  when 2
    go_to 'JAIL'
  end
end

def chance
  case rand(16)
  when 1
    go_to 'GO'
  when 2
    go_to 'JAIL'
  when 3
    go_to 'C1'
  when 4
    go_to 'E3'
  when 5
    go_to 'H2'
  when 6
    go_to 'R1'
  when 7, 8
    go_to_next /^R/
  when 9
    go_to_next /^U/
  when 10
    @position = (@position + @monopoly_board.count - 3) % @monopoly_board.count
  end
end

NUM_TESTS.times do |test_num|
  # Roll
  @rolls << [rand(NUM_SIDES), rand(NUM_SIDES)]

  # If the previous three rolls have been doubles, get your ass to jail.
  if @rolls.last(3).all?{|r| r.uniq.count == 1} then
    go_to 'JAIL'
    next
  end

  # Otherwise, advance normally.
  @position = (@position + @rolls.last.reduce(&:+)) % @monopoly_board.count

  # We're not done yet. If we landed on a special square, we may need to move
  # elsewhere immediately, in which case the finishing square is different.
  case @monopoly_board[@position]
  when 'G2J'
    go_to 'JAIL'
  when /CC\d/
    community_chest
  when /CH\d/
    chance
  end

  @positions[@position] ||= 0
  @positions[@position] += 1

end

@total = @positions.values.reduce(&:+)

puts   "Square | Num. times visited"
puts   "---------------------------"
@positions.keys.sort_by{|k| @positions[k]}.reverse.each do |k|
  puts "     %02d : %06d" % [k, @positions[k]]
end
puts   "---------------------------"
puts   "Total: #{@total}"



