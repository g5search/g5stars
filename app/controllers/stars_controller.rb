class StarsController < ApplicationController
  inherit_resources
  actions :new, :destroy, :create
  before_filter :authenticate_user!

  def create
    create! do |format|
      format.html { redirect_to volunteers_path }
    end
  end
end
