class UpdatationToUploads < ActiveRecord::Migration[5.2]
  def change
  	add_column :uploads, :location, :string
  	add_column :uploads, :street, :string
  end
end
