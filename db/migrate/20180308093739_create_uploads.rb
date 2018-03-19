class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
    	t.string :name
    	t.string :name_of_product
    	t.bigint :original_cost
    	t.bigint :present_cost
    	t.text :description_of_product
    	t.bigint :stocks_left
    	t.bigint :offer_deadline
    	t.integer :uploaded_by_id
    	t.timestamps
    end
  end
end
