class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :type
    	t.string :email
    	t.string :username
    	t.string :password_digest
    	t.bigint :phone_number
    	t.string :store_name
		t.string :type_of_store
    	t.string :location
    	t.string :street
    	t.bigint :pincode

    	
    	t.timestamps
    end
  end
end
