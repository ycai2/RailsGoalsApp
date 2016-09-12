feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("New User")
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'capybara'
      fill_in 'Password', with: 'password'
      click_button 'Sign Up'
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content('Users')
      expect(page).to have_content('Logged in as capybara')
    end
  end
end

feature "logging in" do
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: 'alex'
    fill_in 'Password', with: 'a_very_secure_password'
    click_button 'Sign In'
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content('Users')
    expect(page).to have_content('Logged in as alex')
  end

end

feature "logging out" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).to_not have_content('Log Out')
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_session_url
    fill_in 'Username', with: 'alex'
    fill_in 'Password', with: 'a_very_secure_password'
    click_button 'Sign In'
    click_button 'Sign Out'
    expect(page).to_not have_content('Logged in as alex')
  end

end
