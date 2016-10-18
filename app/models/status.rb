class Status < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	validates_presence_of :title
	validates_length_of :title, minimum: 8, message: "title is too short"
	validates_presence_of :content
	validates_length_of :content, minimum: 10, message:"content is too short"
end
