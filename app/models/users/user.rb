class User < ApplicationRecord

	 # geocoded_by :address

	 # after_validation :geocode
	 # 
	 has_many :manager_id,:class_name => "Upload",:foreign_key => 'uploaded_by_id'

	 EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	before_save {self.email = email.downcase }

	has_secure_password

	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	validates :email, presence: true,format: { with: EMAIL_REGEX }

	validates :username, presence: true, uniqueness:true, length: { :in => 3..20 } 

	# validates :password, presence: true, length: {minimum: 5,maximum: 50}, on: :create

	validates :phone_number, presence: true, length: { minimum: 10, maximum: 10}

	validates :store_name, presence: true

	validates :type_of_store, presence: true

	validates :location, presence: true

	validates :street, presence: true

	validates :pincode, presence: true, length: { minimum: 6, maximum: 6}










	# geocoded_by :address

	# def address
	#   [street, city, state, country].compact.join(', ')
	# end
end