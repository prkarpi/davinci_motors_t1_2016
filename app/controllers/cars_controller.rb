class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update]

  def index
    @car = Car.all
  end

  def new
    @car = Car.new
    render :new
  end

  def edit
    @car = Car.find(params[:id])
    render :edit
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} #{@car.price} created"

    if @car.save
      redirect_to cars_path, notice: creation_message
    else
      render :new
    end
  end

  def update

    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end

end
