require_relative '../lib/prime_finder'

describe PrimeFinder do
  describe ".get_up_to" do
    it "should return the correct amount of primes" do
      PrimeFinder.get_up_to(5).size.should    == 5
      PrimeFinder.get_up_to(50).size.should   == 50
      PrimeFinder.get_up_to(500).size.should  == 500
      PrimeFinder.get_up_to(5000).size.should == 5000
    end

    it "should return an empty array if there exists no primes" do
      PrimeFinder.get_up_to(0).should be_empty
    end
  end
end