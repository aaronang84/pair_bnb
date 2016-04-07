class ListingsController < ApplicationController
  
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def new
    @listing = Listing.new
  end

  def form
  end

  def create
    @listing = Listing.new(listing_params)
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_listin
      @demo = Demo.find(params[:id])
    end

    def listing_params
      listings.fetch(:listing, {})
    end

end








#   # GET /listings
#   # GET /listings.json
#   def index
#     @listings = Listing.all
#   end

#   # GET /listings/1
#   # GET /listings/1.json
#   def show
#   end

#   # GET /listings/new
#   def new
#     @listing = Listing.new
#   end

#   # GET /listings/1/edit
#   def edit
#   end

#   # POST /listings
#   # POST /listings.json
#   def create
#     @listing = Listing.new(demo_params)

#     respond_to do |format|
#       if @listing.save
#         format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
#         format.json { render :show, status: :created, location: @listing }
#       else
#         format.html { render :new }
#         format.json { render json: @listing.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /listings/1
#   # PATCH/PUT /listings/1.json
#   def update
#     respond_to do |format|
#       if @listing.update(listing_params)
#         format.html { redirect_to @demo, notice: 'Listing was successfully updated.' }
#         format.json { render :show, status: :ok, location: @listing }
#       else
#         format.html { render :edit }
#         format.json { render json: @demo.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /demos/1
#   # DELETE /demos/1.json
#   def destroy
#     @demo.destroy
#     respond_to do |format|
#       format.html { redirect_to demos_url, notice: 'Demo was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_demo
#       @demo = Demo.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def demo_params
#       params.fetch(:demo, {})
#     end
# end