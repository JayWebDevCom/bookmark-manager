feature 'Users' do

  scenario 'wrong password does not add a user' do

      email = 'user@example.com'
      password = 'secret*123'
      password_2 = 'secret*124'
      visit '/'
      click_link 'Sign Up now...'
      expect {
        fill_in 'email', with: email
        fill_in 'password', with: password
        fill_in 'checkpassword', with: password_2
        click_button 'Sign Up!'
        expect(page).to have_current_path ('/users')
        expect(page).to have_content 'Your Passwords do not match'
        expect(page).not_to have_content "Welcome #{email}"
      }.to_not change{User.count}

    end

end
