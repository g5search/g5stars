class VolunteersController < ApplicationController
  inherit_resources
  actions :all
  before_filter :authenticate_user!, :except => [:index, :show]
  
  
  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end
end
