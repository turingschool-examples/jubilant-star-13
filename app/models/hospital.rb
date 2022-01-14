class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities
    Doctor.find_by_sql("
      WITH temp AS (SELECT DISTINCT hospital_id, university FROM doctors),
           temp2 AS (SELECT temp.university, count(temp.university) FROM temp GROUP BY university)

      SELECT temp.university FROM temp
      JOIN temp2 ON temp.university = temp2.university
      WHERE temp2.count = 1 AND hospital_id = #{self.id}
    ").pluck(:university)
  end
end
