puts 'Starting report.'

def params
  @params ||= {
    path: ENV.fetch('PATH', './reports')
  }
end
