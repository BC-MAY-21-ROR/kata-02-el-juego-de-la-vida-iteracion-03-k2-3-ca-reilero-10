require 'rspec'
require_relative 'game_of_life'

describe Grid do
  describe 'say_hi' do
    it 'return string message hi' do
      expect(Grid.say_hi).to eq('hi')
    end
  end
end
