class TimeController

  FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(format)
    @format = format.split(',')
  end

  def parse_date
    unknown_format = @format.reject { |format_name| FORMATS.keys.include? format_name }
    if unknown_format.empty?
      correct_format = @format.map { |format_name| FORMATS[format_name] }.join('-')
      DateTime.now.strftime(correct_format)
    else
      raise [400, "Unknown title format [#{unknown_format.join(', ')}]"]
    end
  end
end
