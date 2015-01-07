#!/usr/bin/env ruby

require 'benchmark'

def fibo(n)
  n < 2? n: fibo(n-2) + fibo(n-1)
end

result = Benchmark.realtime do
  n = 1
  sum = 0
  while sum <= 4000000
    memo = fibo(n)
    sum = sum + memo if memo % 2 == 0
    n += 1
  end
  p sum
end
p "results #{result}s"

