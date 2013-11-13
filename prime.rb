#!/usr/bin/env ruby

class MultiplcationGrid

  def self.print(array)
    output_buffer = "       " + ((" %7d" * array.size) % array) + "\n"

    array.each_with_index do |n, index|
      line_spacing = "        "*index
      output_buffer  << "%7d" % n << line_spacing
      index.upto(array.size-1) do |i|
        output_buffer << " %7d" % (n*array[i])
      end

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

  def self.take_with_sieve(amount_of_primes)
    range = prime_range_for(amount_of_primes)
    sieve_up_to(range).slice(0, amount_of_primes)
  end

  private

  def self.prime_range_for(n)
    ( (n * Math.log(n)) + (n * Math.log( Math.log(n) )) ).ceil
  end

  def self.sieve_up_to(n)
    primes = (0..n).to_a
    primes[0] = primes[1] = nil

    primes.each do |number|

      unless number.nil?
        number.step(n, number) do |stepped_number|
          primes[stepped_number] = nil unless stepped_number == number
        end
      end
    end

    return primes.compact!
  end

  def self.is_prime?(number)
    return false if number <= 1

    2.upto(Math.sqrt(number).to_i) do |n|
      return false if number % n == 0
    end

    return true
  end

end

def print_prime_grid(amount_of_primes)
  primes = Prime.take_with_sieve(amount_of_primes)
  MultiplcationGrid.print(primes)
end

if $0 == __FILE__
  ARGV[0].to_i == 0 ? print_prime_grid(10) : print_prime_grid(ARGV[0].to_i)
end
