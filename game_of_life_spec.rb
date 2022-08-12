require 'rspec'
require_relative 'game_of_life'

describe Grid do
  describe "Create a new grid class" do
    it 'return a new Grid class' do
      elGrid = Grid.new('./generacion_1.txt')
      expect(elGrid).to be_an_instance_of(Grid)
    end
  end

  describe "Compare old grilla with the new generation grid" do
    it "return a new grid" do
      elGrid = Grid.new('./generacion_1.txt')
      next_generation_grilla = elGrid.next_genertion
      expect(elGrid.grilla).not_to eql(next_generation_grilla)
    end
  end

  describe "Compare two different next generation instances" do
    it 'return two equal next_generation grid' do
      grilla_1 = Grid.new('./generacion_1.txt')
      grilla_2 = Grid.new('./generacion_1.txt')
      grilla_1_next_generation = grilla_1.next_genertion
      grilla_2_next_generation = grilla_2.next_genertion
      expect(grilla_1_next_generation).to eq(grilla_2_next_generation)
    end
  end

  # describe 'initialize' do
  #   it 'return string message hi' do
  #     expect().to eq('hi')
  #   end
  # end
end
