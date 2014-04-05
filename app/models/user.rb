class User < ActiveRecord::Base

	belongs_to :account_type
	belongs_to :county
	has_many :avatar

	#extend FriendlyId
  	#friendly_id :name, use: :slugged

  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable, :confirmable

  	validates :agree, :acceptance => true, :on => :create
   
end
