#!/usr/bin/env ruby

require 'benchmark'

result = Benchmark.realtime do
  ret = 0
  catch :loop do
    999.downto(100) do |n|
      n.downto(100) do |m|
        ret = n*m
        throw :loop if ret.to_s === ret.to_s.reverse 
      end
    end
  end
  p ret
end
p "results #{result}s"
