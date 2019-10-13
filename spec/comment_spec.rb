require 'database_helpers'
require 'comment'
require 'bookmark'

describe Comment do

  describe '.create' do
    it "should add a comment to a bookmark" do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      comment = Comment.create(comment: 'I like to move it', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data['id']
      expect(comment.comment).to eq 'I like to move it'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Comment.create(comment: 'This is a test comment', bookmark_id: bookmark.id)
    Comment.create(comment: 'This is a second test comment', bookmark_id: bookmark.id)

    comments = Comment.where(bookmark_id: bookmark.id)
    comment = comments.first
    persisted_data = persisted_data(table: 'comments', id: comment.id)

    expect(comments.length).to eq 2
    expect(comment.id).to eq persisted_data['id']
    expect(comment.comment).to eq 'This is a test comment'
    expect(comment.bookmark_id).to eq bookmark.id
  end
end

end
