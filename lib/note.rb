class Note
  LINE_BREAK = "\r\n".freeze
  AUTHOR_REGEX = '.*\((.*)\)$'.freeze

  attr_reader :title, :author, :date, :content

  def initialize(text)
    parse!(text)
  end

  private

  def parse!(text)
    lines = text.split(LINE_BREAK).reject(&:empty?)

    unless lines.empty?
      author_line = lines.shift
      date_line = lines.shift

      match = author_line.match(AUTHOR_REGEX)
      @author = match.captures.first if match

      @date = date_line.split(',').last
      @title = author_line.gsub(" (#{@author.to_s})", '')
      @content = lines.join(LINE_BREAK)
    end
  end
end
