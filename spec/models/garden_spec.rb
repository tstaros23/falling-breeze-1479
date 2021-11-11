require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    describe '.unique_plants_ready_to_harvest' do
      it "has a list of plants ready to harvest" do
        garden = Garden.create!(name: 'Secret Garden', organic: true)

        plot = Plot.create!(number: 54, size: 'large' , direction: 'weast', garden_id: garden.id)
        plant = Plant.create!(name: 'Tulip', description: 'Best plant', days_to_harvest: 5)
        plant2 = Plant.create!(name: 'Rose', description: 'Love plant', days_to_harvest: 102)
        PlotPlant.create!(plant_id: plant.id, plot_id: plot.id)
        PlotPlant.create!(plant_id: plant2.id, plot_id: plot.id)

        plot2 = Plot.create!(number: 54, size: 'large' , direction: 'weast', garden_id: garden.id)
        plant3 = Plant.create!(name: 'Thorn bush', description: 'Pointy plant', days_to_harvest: 99)
        PlotPlant.create!(plant_id: plant3.id, plot_id: plot2.id)

        expect(garden.unique_plants_ready_to_harvest).to eq([plant3.name, plant.name])
      end
    end
  end
end
