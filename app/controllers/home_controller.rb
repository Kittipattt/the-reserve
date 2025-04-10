# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    # Ensure @rooms is assigned with the list of rooms from the database
    @rooms = Room.all
  end
end
