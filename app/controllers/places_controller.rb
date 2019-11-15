require 'locateStore'


class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  #

  def validate regex
    !self[regex].nil?
  end

  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  #store locator page

  def locator

      @vicinity = params[:location_entered]
      @number = params[:no_of_results]
      if @vicinity
        @stores = LocateStore.find(@vicinity.to_s,@number.to_i)
      end

  end

  def details



  end



  def isNumberEven
# :check_number contains the number
#that the user entered as a text
    @number_to_check = params[:check_number]

# we use the isNumberEven.rb of the gem
#to check whether the number is even
    @is_even = CheckNumberEven.check(@number_to_check.to_i)
# recall that the method returns a boolean value,
# we can directly return it or return a customized message
    if @is_even
      @is_even = " is even"
    else
      @is_even = " is odd"
    end
  end


  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :latitude, :longitude)
    end
end
