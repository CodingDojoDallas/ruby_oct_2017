class AddCommentToBlog < ActiveRecord::Migration
  def change
    add_reference :blogs, :commentable, index: true, foreign_key: true
  end
end
