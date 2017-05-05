feature 'Users' do

  scenario 'log in and are redirected' do

      email = 'user@example.com'
      password = 'secret*123'

      visit '/'
      click_link 'Sign Up now...'
      expect {

      fill_in 'email', with: email
      fill_in 'password', with: password
      fill_in 'checkpassword', with: password
      click_button 'Sign Up!'
      expect(page).to have_content "Welcome #{email}"

    }.to change{User.count}.by(+1)


    end

end
