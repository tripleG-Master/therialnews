class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :headline
      t.string :drophead
      t.text :body

      t.timestamps
    end
  end
end
