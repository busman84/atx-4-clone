require_relative '../dog.rb'

describe Dog do
  describe '#initialize' do
    it 'creates a new dog object' do
      expect(Dog.new("Spot").class).to eq(Dog)
    end

    it 'takes an argument name and sets the name of the dog' do
      expect(Dog.new("Spot").name).to eq("Spot")
    end
  end

  describe '#bark_name' do
    it 'allows the dog to bark its name' do
      expect(Dog.new("Fido").bark_name).to eq("Woof! My name is Fido!")
    end
  end
end
