class Avatar < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar,
  		:content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }, 
  		:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  		:default_url => "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
