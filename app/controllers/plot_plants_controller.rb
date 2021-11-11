class PlotPlantsController < ApplicationController
  def destroy
    plot = Plot.find(params[:plot_id])
    plant = Plant.find(params[:plant_id])
    plot_plant = PlotPlant.find_by(plant_id: plant.id, plot_id: plot.id)
    plot_plant.destroy
    redirect_to '/plots'
  end
end
