require 'open-uri'
require 'fileutils'

module MakeCSV
  def make_csv(csv,directory_name,folder_name)
    count = 0
    CSV.parse(Redmine::CodesetUtil.to_utf8(csv, 'CP932'), :headers => true, :return_headers => true) do |row|
      unless row.header_row? 
        CSV.open('./tmp/' + directory_name + '/' + folder_name[count] + '/issue.csv', 'w', encoding:"cp932") do |newcsv|
          newcsv << row.headers + [t(:label_history)]
          newcsv << row.fields + Issue.find(row.fields.first).journals.map do |j| 
            j.user.name + "\n" + j.details.map {|d| show_detail(d, true)}.join("\n") + "\n" + (j.notes.nil? ? '' :     j.notes)
          end
        end
        count += 1
      end
    end
  end

  def make_totalcsv(csv,directory_name)
    CSV.open('./tmp/' + directory_name + '/total_issue.csv', 'w', encoding:"cp932") do |newcsv|
      CSV.parse(Redmine::CodesetUtil.to_utf8(csv, 'CP932'), :headers => true, :return_headers => true) do |row|
        if row.header_row?
          newcsv << row.fields + [t(:label_history)]
        else
          newcsv << row.fields + Issue.find(row.fields.first).journals.map do |j| 
            j.user.name + "\n" + j.details.map {|d| show_detail(d, true)}.join("\n") + "\n" + (j.notes.nil? ? '' :     j.notes)
          end
        end
      end
    end
  end
end