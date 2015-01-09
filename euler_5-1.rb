#!/usr/bin/env ruby

require 'benchmark'
require 'set'

result = Benchmark.realtime do

  range = 20
  ele = Set.new
  tmp  = [1]
  ret = 1

  2.upto range do |n|
    next if ele.include? n

    ad = n
    2.upto tmp.size do |t|
      tmp.combination t do |l|
        ml = l.inject :*
        ele.add ml if ml <= range
        2.upto n do |m|
          if n == ml * m
            ad = m if m < ad
          end
        end
      end
    end
    ele.add n
    ret *= ad
    tmp << ad
    
    # break condition
    break if ele.size == range - 1
  end
  p ret
end
p "result #{result}s"
