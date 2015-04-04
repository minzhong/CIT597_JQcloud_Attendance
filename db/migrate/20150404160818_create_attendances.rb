class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :att_date
      t.time :att_time
      t.text :note
      t.references :course, index: true
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendances, :courses
    add_foreign_key :attendances, :students
  end
end
