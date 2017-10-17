require 'rails_helper'
RSpec.describe LikesController, type: :controller do 
  before do 
    @user = create(:user)
	
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
  end
  context "when not logged in " do 
    before do 
      session[:user_id] = nil
    end
    it "cannot create a like"  do
		get :create
		expect(response).to redirect_to("/sessions/new")
	end
    it "cannot destroy a like" do
		delete :destroy
		expect(response).to redirect_to("/sessions/new")
		
	end
  end
  before do
	@user = create(:user)
	session[:user_id] = @user.id
	@secret = create(:secret, user: @user)
	
	@user2 = create(:user, :female)
    @like = create(:like, secret: @secret, user: @user2)
  end
  context "when signed in as the wrong user" do
    it "shouldn't be able to destroy a like" do
		@request.env["HTTP_REFERER"] = "/secrets"
	
		delete :destroy, secret_id: @secret.id
		expect(Like.where(id: @like.id).any?).to be(true)
	end
  end 
end