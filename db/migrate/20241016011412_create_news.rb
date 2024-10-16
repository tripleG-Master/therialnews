class CreateNews < ActiveRecord::Migration[7.2]
  def change
    create_table :news do |t|
      t.string :headline
      t.string :drophead
      t.text :body

      t.timestamps
    end
  end
end
