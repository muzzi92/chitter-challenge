feature 'Posting a peep' do
  scenario 'Peep visible on page after posting' do
    visit('/')
    fill_in 'post_peep', with: 'Hello world!'
    click_button 'Submit'
    expect(page).to have_content('Hello world!')
  end
end
