class Comment

  def self.create(comment: comment, bookmark_id: bookmark_id)
    result = DatabaseConnection.query("INSERT INTO comments (bookmark_id, comment) VALUES('#{bookmark_id}', '#{comment}') RETURNING id, bookmark_id, comment;")
    Comment.new(id: result[0]['id'], bookmark_id: result[0]['bookmark_id'], comment: result[0]['comment'])
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};")
    result.map do |comment|
    Comment.new(
      id: comment['id'],
      comment: comment['comment'],
      bookmark_id: comment['bookmark_id']
    )
    end
  end

  attr_reader :id, :bookmark_id, :comment

  def initialize(id:, bookmark_id:, comment:)
    @id = id
    @bookmark_id = bookmark_id
    @comment = comment
  end

end
