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

  def generate
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
end
