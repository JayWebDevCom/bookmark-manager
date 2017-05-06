feature 'User sign in' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

    scenario 'with correct credentials' do
      visit '/sessions/new'
      expect(page).to have_content 'Welcome, please sign in here'
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button 'Sign In!'
      expect(page).to have_content "Welcome #{user.email}"
    end

end
