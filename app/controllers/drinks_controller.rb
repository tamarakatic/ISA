class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_manager!

  layout 'restaurant_home'

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.all
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @drinks = Drink.all
    @restaurant = current_manager.restaurant
  end

  # GET /drinks/new
  def new
    @drink = Drink.new
    @restaurant = current_manager.restaurant
  end

  # GET /drinks/1/edit
  def edit
    @restaurant = current_manager.restaurant
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to edit_restaurant_path(current_manager.restaurant.id), notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to list_drink_path, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to edit_restaurant_path(current_manager.restaurant.id), notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :description, :price, :restaurant_id)
    end
end
