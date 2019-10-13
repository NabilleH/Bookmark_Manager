feature 'Adding and viewing comments' do
  scenario 'a comment is added to a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in 'comment', with: 'This is a search engine'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content 'This is a search engine'
  end
end
