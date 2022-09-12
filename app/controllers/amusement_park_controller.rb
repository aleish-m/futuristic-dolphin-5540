class AmusementParkController < ApplicationController 
  def show
    @park = AmusementPark.find(params[:id])
  end
end