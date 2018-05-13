feature 'registration' do
  scenario 'a use can sign up' do
    visit '/users/new'
    fill_in 'name', with: 'Muzzi Aldean'
    fill_in 'username', with: 'demooz42'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password123'
    click_button 'Submit'
    expect(page).to have_content 'Welcome, test@test.com'
  end
end
