require 'rails_helper'

RSpec.describe 'index page' do
  it "shows all the plot numbers and names of plants for those plots" do
    garden = Garden.create!(name: 'Secret Garden', organic: true)

    plot = Plot.create!(number: 54, size: 'large' , direction: 'weast', garden_id: garden.id)
    plant = Plant.create!(name: 'Tulip', description: 'Best plant', days_to_harvest: 5)
    plant2 = Plant.create!(name: 'Rose', description: 'Love plant', days_to_harvest: 10)
    PlotPlant.create!(plant_id: plant.id, plot_id: plot.id)
    PlotPlant.create!(plant_id: plant2.id, plot_id: plot.id)

    plot2 = Plot.create!(number: 20, size: 'small' , direction: 'east', garden_id: garden.id)
    plant3 = Plant.create!(name: 'Thorn bush', description: 'Pointy plant', days_to_harvest: 7)
    plant4 = Plant.create!(name: 'Bush', description: 'Bushy plant', days_to_harvest: 10)
    PlotPlant.create!(plant_id: plant3.id, plot_id: plot2.id)
    PlotPlant.create!(plant_id: plant4.id, plot_id: plot2.id)

    visit '/plots'

    expect(page).to have_content(plot.number)
    expect(page).to have_content(plant.name)
    expect(page).to have_content(plant2.name)

    expect(page).to have_content(plot2.number)
    expect(page).to have_content(plant3.name)
    expect(page).to have_content(plant4.name)
  end
end
