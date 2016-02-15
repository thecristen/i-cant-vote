class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
