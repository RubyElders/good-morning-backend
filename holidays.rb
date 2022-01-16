require 'xsv'

class Holidays

  def today
    records[Date.today]
  end

  private

  def records
    @records ||= begin
      xls = Xsv::Workbook.open('holidays.xlsx')
      sheet = xls.sheets[0]
      sheet.each_with_object({}) do |row, all|
        date = Date.parse("#{row[1]} #{Date.today.year}")
        all[date] = {
          name: row[2],
          moon: row[3]
        }
      end
    end
  end
end
