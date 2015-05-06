class ChangeDataTypeForAttendance < ActiveRecord::Migration
  def change
    change_table :attendances do |t|
          t.change :att_date, :string
          t.change :att_time, :string
    end
  end
end
