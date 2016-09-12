describe User do
  let!(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }

  it { should validate_length_of(:password).is_at_least(6).on(:create) }
  it { should validate_presence_of(:password_digest) }

  it { should have_many(:goals) }

  describe '#password=' do
    it 'sets password instance variable' do
      expect(user.password).to eq('a_very_secure_password')
    end

    it 'sets password digest' do
      expect(user.password_digest).to_not be(nil)
    end
  end

  describe '#password_matches?' do
    it 'returns true if password_digest matches password' do
      expect(user.password_matches?('a_very_secure_password')).to be(true)
    end

    it 'returns false if password_digest does not match password' do
      expect(user.password_matches?('wrong_password')).to be(false)
    end
  end

  describe '::find_by_credentials' do
    it 'returns the user with matching credentials' do
      expect(User::find_by_credentials('alex', 'a_very_secure_password')).to eq(user)
    end

    it 'returns nil if no matching users found' do
      expect(User::find_by_credentials('waldo', 'a_very_secure_pa55word')).to be(nil)
    end
  end

  describe '#reset_session_token!' do
    it 'resets the user session token' do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end

    it 'returns the new session token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

end
