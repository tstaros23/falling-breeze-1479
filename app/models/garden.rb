class Garden < ApplicationRecord
  has_many :plots

  def unique_plants_ready_to_harvest
    plots.joins(plants: :plot_plants).where('plants.days_to_harvest < 100').distinct.order('plants.name').pluck('plants.name')
  end
end
