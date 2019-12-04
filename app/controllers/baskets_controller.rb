class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  # GET /baskets.json
  def index
    @baskets = Basket.where(user_id: current_user.id)

    renderPDF
  end

  def renderPDF
    respond_to do |format|
      # some other formats like: format.html { render :show }
      format.html
      format.pdf do
        pdf = ExportPdf.new(@baskets)
        pdf.render_file('/home/lokesh/Downloads/prawn.pdf')

        send_data pdf.render,
                  filename: "/home/lokesh/Downloads/export.pdf",
                  type: 'application/pdf'
      end
    end
  end

  helper_method :renderPDF

  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # GET /baskets/new
  def new
    @odItemIdArr = params[:odArr]
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)

    respond_to do |format|
      if @basket.save
        format.html { redirect_to root_path, notice: 'Basket was successfully created.' }
        session.delete(:order_id)
        format.json { render :show, status: :created, location: @basket }
      else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to root_path, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: root_path }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showOrders
    @storeId = params[:storeinfo_id]
    @branchId = params[:branchinfo_id]

    @basket = Basket.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params.require(:basket).permit(:name, :status, :user_id, :order)
    end
end
