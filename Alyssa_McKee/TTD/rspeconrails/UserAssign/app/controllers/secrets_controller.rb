class SecretsController < ApplicationController
	def index
		@secrets = Secret.all
		@current_likes = current_user.secrets_liked
		@current_user = current_user
	end
	def create
		secret = Secret.create(secret_params)
		if not secret.valid?
			flash[:errors] = secret.errors.full_messages
		end
		return redirect_to :back
	end
	def destroy
		user = current_user
		secret = Secret.find_by(user: user, id: params[:id])
		
		secret.destroy if secret
		
		return redirect_to "/users/#{user.id}"
	end
	
	private
		def secret_params
			hash = params.require(:secret).permit(:content)
			hash[:user] = current_user
			return hash
		end
end
