class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_code
      t.string :course_name
      t.string :term
      t.integer :year
      t.text :note

      t.timestamps null: false
    end
  end
end
