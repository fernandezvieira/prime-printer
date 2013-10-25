#!/usr/bin/env ruby

class Prime

  def self.sieve_up_to(n)
    # create a prime array of n size
    primes = (0..n).to_a

    # 0 and 1 set to nil as they are not primes
    primes[0] = primes[1] = nil

    # for each number in prime array
    primes.each do |number|

      # value may be nil, therefore do nothing
      unless number.nil?

        # otherwise, starting from the number
        # increment by that number and mark them as non-prime (nil)
        number.step(n, number) do |stepped_number|
          primes[stepped_number] = nil unless stepped_number == number
        end
      end
    end

    # Remove all nil values so only prime values left in the array
    return primes.compact!
  end

  def self.is_prime?(number)
    return false if number <= 1

    2.upto(Math.sqrt(number).to_i) do |n|
      return false if number % n == 0
    end

    return true
  end

  def self.first(amount_of_primes)
    primes = []

    number = 1
    while primes.size < amount_of_primes
      primes << number if self.is_prime?(number)
      number += 1
    end
  end

  def self.print_grid_up_to(n)
    primes = self.sieve_up_to(n)

    # print column headers
    primes.each {|x| print "\t#{x}" }

    puts
    # print rows
    primes.each do |x|
      line = "#{x}\t"
      primes.each do |y|
        line += "#{x * y}\t"
      end
      puts line
    end
  end
end

# def print_prime_grid(n)
#   Prime.print_grid_up_to(n)
# end

# ARGV[0].to_i == 0 ? print_prime_grid(13) : print_prime_grid(ARGV[0].to_i)
