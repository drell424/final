class Listing < ActiveRecord::Base
	#attr_accessor :listing_id

	belongs_to :user
	has_many :photos, :dependent => :destroy

	accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['photo'].nil? }
end
