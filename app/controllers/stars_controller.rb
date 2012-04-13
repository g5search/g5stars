class StarsController < ApplicationController
  inherit_resources
  belongs_to :volunteer
  actions :new, :destroy, :create
  
  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end
end