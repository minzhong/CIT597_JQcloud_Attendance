json.array!(@courses) do |course|
  json.extract! course, :id, :course_code, :course_name, :term, :year, :note
  json.url course_url(course, format: :json)
end
