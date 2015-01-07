#!/usr/bin/env ruby

require 'benchmark'
require 'set'

def factorize(num)
  factor = Set.new
  (2..Math.sqrt(num)).each do |n|
    while true
      break if num == 1
      if num % n == 0
        num /= n 
        factor << n
      else
        break
      end
    end
  end
  factor << num if num != 1
  factor.to_a
end
result = Benchmark.realtime do
  p factorize(600851475143).max  
end
p "results #{result}s"
