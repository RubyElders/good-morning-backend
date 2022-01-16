require 'csv'

class NationalDays

  def today
    records[Date.today]
  end

  private

  def records
    @records ||= begin
      rows.each_with_object({}) do |row, all|
        date = Date.parse("#{row[0]} #{Date.today.year}")
        all[date] = {
          national: row[1]
        }
      end
    end
  end

  def rows
    @rows ||= CSV.read("./national_days.csv")
  end
end
