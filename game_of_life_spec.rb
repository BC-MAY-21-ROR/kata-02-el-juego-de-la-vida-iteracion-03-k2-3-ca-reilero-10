require 'rspec'
require_relative 'game_of_life'

describe Grid do
  elGrid = Grid.new('./generacion_1.txt')

  describe "Create a new grid class" do
    it 'return a new Grid class' do
      expect(elGrid).to eq(Grid.new('./generacion_1.txt'))
    end
  end

  # describe 'initialize' do
  #   it 'return string message hi' do
  #     expect().to eq('hi')
  #   end
  # end
end
