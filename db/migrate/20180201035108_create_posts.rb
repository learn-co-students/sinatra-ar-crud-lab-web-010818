class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |p|
      p.string :name
      p.text :content
    end
  end
end
