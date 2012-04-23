class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order(:name).where("name like ?", "#{params[:term]}")
    render json: @activities.map(&:name)
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end
end
