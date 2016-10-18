class User < ActiveRecord::Base
	# validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	# validates_presents_of :email
	# validate_uniquenness_of :email
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_secure_password 


	validates_presence_of :email
	validates_format_of :email, :with =>/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_uniqueness_of :email
	validates_presence_of :name
	

	validates_presence_of :password
	validates_presence_of :password_confirmation
	validates_length_of :password, :in => 6..20
	validates_confirmation_of :password
	validates_presence_of :password_confirmation, on: :create

	# def
	# 	if :name; :email; :password; :password_confirmation == nil
	# 	User.validates! == false
	# 	else
	# 	end
	# end

end
