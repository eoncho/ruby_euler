#!/usr/bin/env ruby

require 'benchmark'

module Fibonacci
  @@memo = [1, 1]
  def self.[](n)
    @@memo.size.upto(n) { |i| @@memo[i] = @@memo[i-2] + @@memo[i-1] }
    @@memo[n]  
  end
end

result = Benchmark.realtime do
  n = 1
  sum = 0
  while sum <= 4000000
    memo = Fibonacci[n]
    sum = sum + memo if memo % 2 == 0
    n += 1
  end
  p sum
end
p "results #{result}s"

