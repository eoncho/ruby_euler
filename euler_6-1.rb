#!/usr/bin/env ruby

require 'benchmark'

result = Benchmark.realtime do
  i = 0
  range = Array.new(100) { i += 1 }
  sum = 0
  range.combination 2 do |c|
    sum += 2 * c.inject(:*)
  end
  p sum
end
p "result #{result}s"
