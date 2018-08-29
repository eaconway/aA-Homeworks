require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookie) {Dessert.new("sugar", 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to be_truthy
    end

    it "sets a quantity" do
      expect(cookie.quantity).to be_truthy
    end

    it "starts ingredients as an empty array" do
      expect(cookie.quantity).to be_truthy
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cinnabon", "tasty", chef)}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.add_ingredient("salt")).to be_truthy
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      i = cookie.ingredients
      expect(cookie.mix!).to_not eq(Array)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(1)
      expect(cookie.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cookie.eat(10)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cookie.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
