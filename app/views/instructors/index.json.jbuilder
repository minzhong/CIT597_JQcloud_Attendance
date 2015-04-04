json.array!(@instructors) do |instructor|
  json.extract! instructor, :id, :user_name, :password
  json.url instructor_url(instructor, format: :json)
end
