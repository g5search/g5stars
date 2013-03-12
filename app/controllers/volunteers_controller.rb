class VolunteersController < ApplicationController
  inherit_resources
  actions :all
  before_filter :authenticate_user!, :except => [:index, :show, :tv]

   def index
     @volunteers = Volunteer.order(:last_name)
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
    @volunteers = Volunteer.order(:last_name)
    render :layout => 'tv'
  end
end
