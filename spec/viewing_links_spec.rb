feature 'Viewing links' do

  before(:each) do
    Bookmark.create(address: 'http://www.makersacademy.com', name: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Bookmark.create(address: 'http://www.google.com', name: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Bookmark.create(address: 'http://www.zombo.com', name: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Bookmark.create(address: 'http://www.bubble-bobble.com', name: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
