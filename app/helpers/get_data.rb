module GetData
  def get_attached_file(csv)
    urls = []
      CSV.parse(Redmine::CodesetUtil.to_utf8(csv, 'CP932'), :headers => true, :return_headers => true) do |row|
        unless row.header_row?
          ticket = Issue.find(row.fields.first).id
          url = Issue.find(row.fields.first).attachments.map do |j|
            j.diskfile
          end
          subject = Issue.find(row.fields.first).subject
          urls << {ticket:ticket,subject:subject,url:url}
        end
      end
    return urls
  end
end