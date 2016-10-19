class LikesController < ApplicationController
	def create
		current_user_id = session[:user_id]
		status = Status.find(params[:like][:status])
		
		if status.likes.find_by(user_id: current_user_id) == nil
			like = status.likes.new
			like.user_id = current_user_id
			if like.save
				flash[:notice] = "You liked #{status.title}!"
				redirect_to root_path
			else
		end

		else
			flash[:alert] = "You liked before!"
			redirect_to root_path
		end

	end

	def destroy
		like = Like.find(params[:id])
		status = like.status
		
		like.destroy

		flash[:notice] = "You unlike."
		redirect_to status_path(status)
	end
end
