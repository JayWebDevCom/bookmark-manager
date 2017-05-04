require './models/bookmark.rb'
DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

feature 'See links' do

  scenario 'on the home page' do

    Bookmark.create(:name => 'CNN News', :address => 'http://www.cnn.com')
    visit '/links'
    within 'ul#links' do
    expect(page).to have_link 'CNN News'

    end
  end

end
