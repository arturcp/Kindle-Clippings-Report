require 'fileutils'
require 'byebug'
require 'date'

require_relative 'lib/note'
require_relative 'lib/report'

CLIPPING_TOKEN = '=========='

def params
  @params ||= {
    path: ARGV[0]
  }
end

def generate
  disclaimer

  if params[:path].empty?
    usage
    exit 1
  end

  puts 'Starting report...'
  import
  puts 'Done!'
end

def disclaimer

end

def usage
  puts 'USAGE: ruby report.rb path/to/My Clippings.txt'
  puts ''
end

def import
  data = File.read(params[:path])
  report = Report.new
  clippings = data.split(CLIPPING_TOKEN)
  clippings.each { |clipping| report.add_note(Note.new(clipping)) }
  report.generate
end

def create_file(author, title, period, content)
end

generate
