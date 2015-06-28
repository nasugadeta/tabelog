class AddImgUrlToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :img_url, :string
  end
end
