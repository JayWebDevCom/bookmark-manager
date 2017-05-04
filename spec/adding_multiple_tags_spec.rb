feature 'multiple tags' do

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'address',   with: 'http://www.makersacademy.com/'
    fill_in 'name', with: 'Makers Academy'
    fill_in 'tags',  with: 'education ruby'
    click_button 'Save Link!'
    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include('education', 'ruby')
  end

end
