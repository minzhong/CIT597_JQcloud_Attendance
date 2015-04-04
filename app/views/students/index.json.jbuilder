json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :pennid, :email, :note
  json.url student_url(student, format: :json)
end
