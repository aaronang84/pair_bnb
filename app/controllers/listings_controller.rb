class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def form
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def index
    @listing = Listing.all
  end

  def create    
    @listing = Listing.new(listing_params)
    respond_to do |format|
    @listing.user_id = current_user.id
      if @listing.save
        format.html { redirect_to listings_path, notice: 'Your listing has been created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_path, notice: 'Your listing has been deleted.' }
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Your listing was been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:property_type,:room_type,:accommodates,:bedrooms,:beds,:bathrooms,
:listing_name,:summary,:country,:street_address,:city,:state,:zip_code,:base_price,:currency,:availability)
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

 #  # DELETE /demos/1
 #  # DELETE /demos/1.json
 #  def destroy
 #    @demo.destroy
 #    respond_to do |format|
 #      format.html { redirect_to demo_path, notice: 'Your demo has been deleted.' }
 #    end
 #  end

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