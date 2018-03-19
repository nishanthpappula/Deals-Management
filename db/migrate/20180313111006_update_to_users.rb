class UpdateToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users,:type,:string,default:"Manager"
  end
end
