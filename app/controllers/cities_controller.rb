class CitiesController < ApplicationController
  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      redirect_to @city
    else
      render :new
    end
  end

  def index
    @cities = City.all
  end

  def show
    set_city
  end

  def destroy
    set_city
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end
end
