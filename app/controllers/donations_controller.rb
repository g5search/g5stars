class DonationsController < ApplicationController
  inherit_resources
  actions :all
  before_filter :authenticate_user!, :except => [:index, :show]
end
