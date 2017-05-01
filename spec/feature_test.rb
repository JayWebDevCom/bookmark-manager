require './models/bookmark.rb'
require "data_mapper"
require "dm-postgres-adapter"
require "dm-migrations"

# DataMapper.finalize
# DataMapper.auto_upgrade!

feature 'See links' do

  scenario 'on the home page' do
    Bookmark.create(:name => 'CNN News', :address => 'http://www.cnn.com')
    visit '/'

    within 'ul#links' do
      expect(page).to have_link 'BBC News'
    end    
  end

end
