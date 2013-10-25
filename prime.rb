#!/usr/bin/env ruby

class MultiplcationGrid

  def self.output(array)

    # print column headers
    puts "       " + ((" %7d" * array.size) % array)

    # print rows
    array.each_with_index do |x, index|
      print "%7d" % x
      array.each {|y| print " %7d" % (x*y)}
      puts ""
    end
  end

end

class Prime

  def self.take(amount_of_primes)
    primes = []

    number = 1
    while primes.size < amount_of_primes
      primes << number if self.is_prime?(number)
      number += 1
    end

    return primes
  end

  private

  def self.is_prime?(number)
    return false if number <= 1

    2.upto(Math.sqrt(number).to_i) do |n|
      return false if number % n == 0
    end

    return true
  end

end

def print_prime_grid(n)
  primes = Prime.take(n)
  MultiplcationGrid.output(primes)
end

if $0 == __FILE__
  ARGV[0].to_i == 0 ? print_prime_grid(10) : print_prime_grid(ARGV[0].to_i)
end

