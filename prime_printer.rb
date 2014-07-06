#!/usr/bin/env ruby

require_relative 'lib/prime_finder'
require_relative 'lib/multiplication_grid'

def print_prime_grid(amount_of_primes)
  # get and print the prime multiplicaiton grid
  MultiplcationGrid.print(PrimeFinder.get_up_to(amount_of_primes))
end

if $0 == __FILE__
  puts "\nPRIMES\n=======\n"
  ARGV[0].to_i == 0 ? print_prime_grid(10) : print_prime_grid(ARGV[0].to_i)
end
