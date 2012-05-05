class VolunteersController < ApplicationController
  inherit_resources
  actions :all
  before_filter :authenticate_user!, :except => [:index, :show, :tv]
  
   def index
     @volunteers = Volunteer.by_stars
     index! do |format|
       format.html 
     end
   end
  
  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end

  def tv
    @volunteers = Volunteer.by_stars
    render :layout => 'tv'
  end
end
