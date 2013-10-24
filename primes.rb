#!/usr/bin/env ruby

def better_sieve_upto(n)
  array = (0..n).to_a

  array[0] = nil
  array[1] = nil

  array.each do |number|
    unless number.nil?
      number.step(n, number) do |stepped_number|
        array[stepped_number] = nil unless stepped_number == number
      end
    end
  end

  return array.compact!
end

def print_primes(primes)
  print "\t" 
  primes.each { |x| print "#{x}\t"}
  puts
  primes.each do |x|
    line = "#{x}\t"
    primes.each do |y|
      line += "#{x * y}\t"
    end
    puts line
  end
end

array = better_sieve_upto(130)
puts array.inspect
print_primes(array)
