describe UsersController do
  describe "GET #new" do
    it "renders the new users page" do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context 'with invalid params' do
      it "validates credentials" do
        post :create, user: {username: "", password: "short"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it "creates a new user" do
        post :create, user: { username: 'yisheng', password: 'asdfasdf' }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(users_url)
      end
    end
  end
end
