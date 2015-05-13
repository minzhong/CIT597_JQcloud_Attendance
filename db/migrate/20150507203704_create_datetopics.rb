class CreateDatetopics < ActiveRecord::Migration
  def change
    create_table :datetopics do |t|
      t.string :date
      t.string :topic
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :datetopics, :courses
  end
end
