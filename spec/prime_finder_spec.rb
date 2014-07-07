require_relative '../lib/prime_finder'

require 'prime'

describe PrimeFinder do
  describe ".get_up_to" do
    it "returns primes" do
      primes = PrimeFinder.get_up_to(5)

      # use actual ruby library as we know this has been tested
      primes.each do |prime|
        expect(Prime.prime?(prime)).to be_true
      end
    end

    it "returns the correct amount of primes" do
      PrimeFinder.get_up_to(5).size.should    == 5
      PrimeFinder.get_up_to(50).size.should   == 50
      PrimeFinder.get_up_to(500).size.should  == 500
      PrimeFinder.get_up_to(5000).size.should == 5000
    end

    it "returns an empty array if there exists no primes" do
      PrimeFinder.get_up_to(0).should be_empty
    end
  end
end