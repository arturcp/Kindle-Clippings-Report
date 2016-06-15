require 'fileutils'

class Report
  def initialize
    @notes = {}
  end

  def add_note(note)
    return unless note.title

    key = note.title.strip

    unless @notes.include?(key)
      @notes[key] = []
    end

    @notes[key] << note
  end

  def save
    @notes.each do |key, notes|
      author = notes.first.author
      title = notes.first.title
      period = "De #{notes.first.date} até #{notes.last.date}"
      content = notes.map { |note| "- #{note.content}\r\n" }

      create_file(author, title, period, content)
    end
  end

  def log
    puts '*' * 50
    @notes.each do |key, notes|
      puts "#{notes.first.author} - #{notes.first.title}"
      puts "De #{notes.first.date} até #{notes.last.date}"
      puts ''

      notes.each do |note|
        puts "- #{note.content}"
        puts ''
      end

      puts '*' * 50
      puts ''
    end
  end

  private

  def create_file(author, title, period, content)
    folder = Date.today.strftime('%Y%m%d')
    path = "reports/#{folder}"
    FileUtils::mkdir_p(path)

    File.open("#{path}/#{file_name(title)}.txt", 'w') do |file|
      file.write [
        "#{author} - #{title}",
        period,
        "\r\n",
        content
      ].join("\r\n")
    end
  end

  def file_name(title)
    title.downcase.strip.gsub(' ', '-')
  end
end
