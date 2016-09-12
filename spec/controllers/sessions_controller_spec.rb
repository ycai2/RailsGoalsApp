describe SessionsController do
  describe "GET #new" do
    it "renders the new session page" do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    let!(:user) { FactoryGirl.create(:user) }
    context 'with invalid params' do
      it "validates credentials" do
        post :create, user: {username: "", password: "short"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it "signs the user in" do
        post :create, user: { username: 'alex', password: 'a_very_secure_password' }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(users_url)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { FactoryGirl.create(:user) }
    # before(:each) do

      # @session_token = user.session_token
    # end


    # it "logs the current user out" do
    #   allow(double).to receive(:reset_session_token!).and_return("asdf")
    #   session[:session_token] = user.session_token
    #   @session_token = session[:session_token].dup
    #   debugger
    #   delete :destroy
    #   debugger
    #   expect(session[:session_token]).to be(nil)
    #
    #   expect(user.session_token).not_to eq(@session_token)
    #
    #   expect(response).to have_http_status(302)
    #   expect(response).to redirect_to(new_session_url)
    # end
  end
end
