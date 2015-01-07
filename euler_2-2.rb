#!/usr/bin/env ruby

require 'benchmark'

def fibo(n)
  if n < 2
    n
  else
    p1 = 1
    p2 = 1
    2.upto(n) { p2, p1 = p1, p1 + p2 }
    p1
  end
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

