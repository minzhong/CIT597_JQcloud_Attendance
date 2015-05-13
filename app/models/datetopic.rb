class Datetopic < ActiveRecord::Base
  belongs_to :course
  
  require 'csv'
  def self.import(file, course_id)
    if (file != nil) then
      CSV.foreach(file.path, headers: true) do |row|
        datetopic_hash = row.to_hash 
        # datetopic_hash = {"date" => "1/16", "topic" => "ORM"}
        datetopic = Datetopic.where("date = ? AND topic = ?", datetopic_hash["date"], datetopic_hash["topic"])
        if datetopic.blank? then
          @datetopic = Datetopic.create!({course_id: course_id, date: datetopic_hash["date"], topic: datetopic_hash["topic"]})
        else
          datetopic.first.course_id = course_id
          datetopic.first.date = datetopic_hash["date"]
          datetopic.first.topic = datetopic_hash["topic"]
        end
      end # end CSV
    end # end first if block
  end # end import method
end # end class 
