class ActivitiesController < ApplicationController

  before_filter :process_stars_attrs, only: [:create, :update]

  def process_stars_attrs
    params[:activity][:stars_attributes].values.each do |star_attr|
      star_attr[:_destroy] = true if star_attr[:enable] != '1'
    end
  end

  def index
    activities = Activity.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: activities.map(&:name)
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
    @volunteers = Volunteer.all
  end

  def update
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      redirect_to @activity
    else
      render action: "new"
    end
  end
end


 
