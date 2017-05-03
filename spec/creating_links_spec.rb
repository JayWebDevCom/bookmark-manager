DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

feature 'Create links' do

  scenario 'on the links page ' do

      DatabaseCleaner.start

      visit '/links/new'
      expect(page).to have_content 'Add A Link'
      fill_in 'name', with: 'Sky News'
      fill_in 'address', with: 'http://www.skynews.co.uk'
      click_button 'Save Link!'
      expect(page).to have_link 'Sky News'
      click_link 'Sky News'
      expect(page.status_code).to eq 200

      DatabaseCleaner.clean

    end

end
