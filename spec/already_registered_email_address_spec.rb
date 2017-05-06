feature 'Signing up' do

  scenario 'impossible with a preregistered email address' do

      email = 'test@email.com'
      password = 'secret*123'

      visit '/'
      click_link 'Sign Up now...'
      expect {
        fill_in 'email', with: email
        fill_in 'password', with: password
        fill_in 'checkpassword', with: password
        click_button 'Sign Up!'
      }.to change { User.count }.by(+1)
      expect(page).to have_content "Welcome #{email}"

      visit '/'
      click_link 'Sign Up now...'
      expect {
        fill_in 'email', with: email
        fill_in 'password', with: password
        fill_in 'checkpassword', with: password
        click_button 'Sign Up!'
      }.not_to change { User.count }
      expect(page).to have_content('Email is already taken')


    end

end
