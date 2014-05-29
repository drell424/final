class Photo < ActiveRecord::Base
	#attr_accessor :image, :listing_id
	# attr_accessor :photos_attributes

	belongs_to :listing

	has_attached_file :image, :styles => { :large => "800>x500", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_presence_of :image
end
