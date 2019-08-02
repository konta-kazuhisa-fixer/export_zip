require 'open-uri'
require 'fileutils'

class MakeFolder
  def initialize(data)
    @ticket = data.map do |x|
      x[:ticket]
    end
    @subject = data.map do |x|
      x[:subject]
    end
    @url = data.map do |x|
      x[:url]
    end
    @directory_name = @ticket.first.to_s + '-' + @ticket.last.to_s
    @data = data
    @file_names = []
    @folder_name = []
  end

  def get_folder_name
    return @folder_name
  end

  def make_directory
    FileUtils.mkdir_p('tmp/' + @directory_name, :mode => 0777)
    @data.each do |x|
      FileUtils.mkdir_p('tmp/' + @directory_name + '/[' + x[:ticket].to_s + ']' + x[:subject], :mode => 0777)
      @folder_name << '[' + x[:ticket].to_s + ']' + x[:subject]
    end
    return @directory_name
  end

  def save_attached_file
    count = 0
    @data.each do |files|
      files[:url].each do |url|
        path = url
        file_name = './tmp/' + @directory_name + '/' + @folder_name[count] + '/[' + files[:ticket].to_s + ']' + File.basename(path)
        @file_names << file_name
        
        open(file_name, "wb") do |output|
          open(path, "rb") do |data|
            output.write(data.read)
          end
        end
      end
      count += 1
    end
  end
end