class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :name
      t.string :content
    end

    def down
      drop_table :posts
    end
  end
end
