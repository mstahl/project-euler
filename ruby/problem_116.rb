#!/usr/bin/env ruby

@arrangements = {}

def a(block_size, total_blocks)
  unless @arrangements.has_key?([block_size, total_blocks])
    if block_size > total_blocks
      @arrangements[[block_size, total_blocks]] = 0
    else
      @arrangements[[block_size, total_blocks]] = (0..(total_blocks - block_size)).inject(0) do |s, i|
        s + 1 + a(block_size, i)
      end
    end
  end

  @arrangements[[block_size, total_blocks]]
end

# Main

p a(2, 50) + a(3, 50) + a(4, 50)
