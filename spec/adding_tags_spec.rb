feature 'Add tags' do

  scenario 'on the new page' do
    visit '/links/new'
    expect(page).to have_content 'Add A Link'
    fill_in 'name', with: 'CNN News'
    fill_in 'address', with: 'http://www.cnn.com'
    fill_in 'tags',  with: 'news'
    click_button 'Save Link!'
    bookmark = Bookmark.first
    expect(bookmark.tags.map(&:name)).to include('news')
    expect(page).to have_link 'CNN News'
    click_link 'CNN News'
    expect(page.status_code).to eq 200
  end

end
