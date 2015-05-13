json.array!(@datetopics) do |datetopic|
  json.extract! datetopic, :id, :date, :topic, :course_id
  json.url datetopic_url(datetopic, format: :json)
end
