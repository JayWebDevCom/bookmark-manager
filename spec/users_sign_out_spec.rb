feature 'User sign out' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

    scenario 'when signed in' do
      visit '/sessions/new'
      expect(page).to have_content 'Welcome, please sign in here'
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button 'Sign In!'
      expect(page).to have_content "Welcome #{user.email}"
      click_button 'Sign Out Now!'
      expect(page).to have_content "Goodbye #{user.email}"
      expect(page).not_to have_content "Welcome #{user.email}"
    end

    scenario 'when not signed in' do
      visit '/'
      expect(page).not_to have_link 'Sign Out Now!'
    end

end
