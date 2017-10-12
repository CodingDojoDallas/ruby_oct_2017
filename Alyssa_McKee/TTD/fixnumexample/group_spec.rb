require_relative 'fixnum'

RSpec.describe Fixnum do
  describe "my_upto(num)" do
    it "performs block of code from self up to num amount of times" do
      output = []
      1.my_upto(5) do |i|
        output << i
      end
      expect(output).to eq([1, 2, 3, 4, 5])
    end

  end
  describe "my_times" do
    it "performs the block of code self many times" do
      output = []
      5.my_times { output << "hello" }
        expect(output).to eq(["hello","hello","hello","hello","hello"])
      end
  end


  describe "my_prev" do
	it "returns one less than self" do
		output = 5.my_prev
		
		expect(output).to eq(4)
	end
  end

  describe "my_next" do
	it "returns one more than self" do
		output = 5.my_next
		
		expect(output).to eq(6)
	end
  end
end
