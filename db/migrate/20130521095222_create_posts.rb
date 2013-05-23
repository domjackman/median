class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :Title
      t.boolean :is_featured

      t.timestamps
    end
  end
end
