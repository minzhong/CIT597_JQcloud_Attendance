json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :att_date, :att_time, :note, :course_id, :student_id
  json.url attendance_url(attendance, format: :json)
end
