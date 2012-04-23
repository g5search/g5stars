class ActivitiesController < ApplicationController
  def index
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
