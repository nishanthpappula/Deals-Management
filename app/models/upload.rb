class Upload < ApplicationRecord

belongs_to :uploaded_by, class_name: 'User'

	mount_uploader :name, ImageUploader

	validates :name_of_product, presence: true

	validates :original_cost, presence: true

	validates :present_cost, presence: true

	validates :description_of_product, presence: true

	validates :stocks_left, presence: true

	validates :offer_deadline, presence: true

	validates :location, presence: true

	validates :street, presence: true





	def self.search(location)
		# where(location: location)
  		where("location LIKE ? ", "#{location}%") 
	end

end