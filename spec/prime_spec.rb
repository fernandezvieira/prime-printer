require_relative '../prime'

describe Prime do

  describe ".is_prime?" do
    [3,5,7,11,13,17].each do |prime|
      it "should be a true for: #{prime}" do
        Prime.is_prime?(prime).should be_true
      end
    end

    [1,4,6,8,10].each do |non_prime|
      it "should be false for: #{non_prime}" do
        Prime.is_prime?(non_prime).should be_false
      end
    end
  end

  describe ".take" do
    it "should return the correct amount of primes" do
      Prime.take(5).size.should == 5
    end

    it "should return an empty array if there exists no primes" do
      Prime.take(0).should be_empty
    end
  end
end