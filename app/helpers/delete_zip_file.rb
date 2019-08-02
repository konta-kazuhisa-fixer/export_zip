require 'fileutils'

class DeleteZipFile
  attr_reader :to_path

  def initialize(path)
    @to_path = path
  end

  def each
    File.open(to_path, 'rb') do |file|
      while chunk = file.read(16384)
        yield chunk
      end
    end
  end
        
  def close
    FileUtils.rm_rf @to_path
  end
end
