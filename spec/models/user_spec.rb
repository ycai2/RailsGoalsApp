describe User do
  subject(:user) do
    User.create!(
      username: 'alex',
      password_digest: 'a_very_secure_password',
      session_token: 'secure_session_token'
    )
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_length_of(:password) }

  it { should have_many(:goals) }


end
