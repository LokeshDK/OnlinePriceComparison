class ProductinfosController < ApplicationController
  before_action :set_productinfo, only: [:show, :edit, :update, :destroy]

  # GET /productinfos
  # GET /productinfos.json
  def index
    @productinfos = Productinfo.all
  end

  # GET /productinfos/1
  # GET /productinfos/1.json
  def show
  end

  # GET /productinfos/new
  def new
    @productinfo = Productinfo.new
  end

  # GET /productinfos/1/edit
  def edit
  end

  # POST /productinfos
  # POST /productinfos.json
  def create
    @productinfo = Productinfo.new(productinfo_params)

    respond_to do |format|
      if @productinfo.save
        format.html { redirect_to @productinfo, notice: 'Productinfo was successfully created.' }
        format.json { render :show, status: :created, location: @productinfo }
      else
        format.html { render :new }
        format.json { render json: @productinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productinfos/1
  # PATCH/PUT /productinfos/1.json
  def update
    respond_to do |format|
      if @productinfo.update(productinfo_params)
        format.html { redirect_to @productinfo, notice: 'Productinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @productinfo }
      else
        format.html { render :edit }
        format.json { render json: @productinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productinfos/1
  # DELETE /productinfos/1.json
  def destroy
    @productinfo.destroy
    respond_to do |format|
      format.html { redirect_to productinfos_url, notice: 'Productinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productinfo
      @productinfo = Productinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productinfo_params
      params.require(:productinfo).permit(:productname, :storeproductid, :productprice, :branchinfo_id, :image, :categorie_id)
    end
end
