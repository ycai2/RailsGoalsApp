feature 'goal-making process' do
  scenario 'has new goal page' do
    visit new_goal_url
    expect(page).to have_content('Create New Goal')
  end

  feature 'creating a new goal' do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit new_session_url
      fill_in 'Username', with: 'alex'
      fill_in 'Password', with: 'a_very_secure_password'
      click_button 'Sign In'

      visit new_goal_url
      fill_in 'Title', with: 'Murder the assessment'
      fill_in 'Details', with: '💯'
      check 'Private?'
      click_button 'New Goal'
    end

    scenario 'with valid params, shows the goal page on creation' do
      expect(page).to have_content('Goal')
      expect(page).to have_content('Murder the assessment')
      expect(page).to have_button('Complete')
    end
  end
end
