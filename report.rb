require 'fileutils'
require 'byebug'

AUTHOR_REGEX = '.*\((.*)\)$'.freeze

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
  notes = data.split('==========')
  # lines = data.split("\r\n")

  notes.each do |note|
    lines = note.split("\r\n").reject(&:empty?)

    unless lines.empty?
      match = purge(lines[0]).match(AUTHOR_REGEX)
      if match
        puts "#{match.captures.first} --- #{lines[0]}"
      end
    end
  end
end

def purge(line)
  line.gsub('(epub)', '')
end

generate
