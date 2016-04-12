class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string   :user_id
      t.string   :property_type
      t.string   :room_type
      t.integer  :accommodates
      t.integer  :bedrooms
      t.integer  :beds 
      t.integer  :bathrooms 
      t.string   :listing_name
      t.string   :summary
      t.string   :country
      t.string   :street_address
      t.string   :city
      t.string   :state
      t.string   :zip_code
      t.integer  :base_price
      t.string   :currency
      t.string   :availability
      t.timestamps null: false
    end
  end
end