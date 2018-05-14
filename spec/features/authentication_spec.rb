# feature 'authentication' do
#   it 'a user can sign in' do
#     User.create('Muzzi Aldean', 'demooz42', 'test@test.com', 'password123')
#
#     visit '/sessions/new'
#     fill_in(:email, with: 'test@test.com')
#     fill_in(:password, with: 'password123')
#     click_button('Sign in')
#
#     expect(page).to have_content 'Welcome, demooz42'
#   end
# end
