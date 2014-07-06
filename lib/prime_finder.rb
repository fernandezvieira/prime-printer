class PrimeFinder
  def self.get_up_to(n)
    return [] unless n > 0

    # first get the maximum range of numbers to find n primes
    range = prime_range_for(n)

    # sieve out the primes
    sieve_up_to(range).slice(0, n)
  end

  private

  def self.prime_range_for(n)
    ( (n * Math.log(n)) + (n * Math.log( Math.log(n) )) ).ceil
  end

  def self.sieve_up_to(n)
    # first create an array of the amount of primes wanted
    primes = (0..n).to_a
    primes[0] = primes[1] = nil

    primes.each do |number|
      unless number.nil?
        # iterate over each nth element the array
        number.step(n, number) do |stepped_number|
          # set all non-primes to nil 
          primes[stepped_number] = nil unless stepped_number == number
        end
      end
    end

    # remove all non-primes
    primes.compact!
  end
end