#!/usr/bin/env ruby

class MultiplcationGrid

  def self.output(array)
    output_buffer = "       " + ((" %7d" * array.size) % array) + "\n"

    array.each do |n|
      output_buffer << "%7d" % n
      array.each {|m| output_buffer << " %7d" % (n*m)}

      output_buffer << "\n"
    end

    puts output_buffer
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

