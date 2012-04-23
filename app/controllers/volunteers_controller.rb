class VolunteersController < ApplicationController
  inherit_resources
  actions :all
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # def index
  #   index! do |format|
  #     format.tv { render "meh" }
  #   end
  # end
  
  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end
end
