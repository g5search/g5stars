class StarsController < ApplicationController
  inherit_resources
  belongs_to :volunteer
  actions :new, :destroy, :create
  before_filter :authenticate_user!
  
  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end
end