class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.string :state
      t.integer :position
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
