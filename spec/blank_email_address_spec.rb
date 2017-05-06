feature 'Signing up' do

  scenario 'impossible with a blank email address' do
      password = 'secret*123'
      visit '/'
      click_link 'Sign Up now...'
      expect {
        fill_in 'email', with: ''
        fill_in 'password', with: password
        fill_in 'checkpassword', with: password
        click_button 'Sign Up!'
      }.not_to change { User.count }
    end

end
