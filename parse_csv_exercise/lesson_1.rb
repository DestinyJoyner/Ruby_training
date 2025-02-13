#
#   - Identify the different responsibilities handled by the DataHandler class.
#   - Refactor the DataHandler class to adhere to the Single Responsibility Principle.
#   - Each responsibility should be extracted into its own class or module.
#   - Think about how the main workflow (process_data method) would be orchestrated after the refactoring.
#   - Provide the refactored code for the DataHandler and the newly created classes/modules.

# data_handler.rb
class DataHandler
  def initialize(csv_data, parsing_csv, formatting_html, logging_data)
    @csv_data = csv_data
    @parsing_csv = parsing_csv
    @formatting_html = formatting_html
    @logging_data = logging_data
  end

  def process_data
    parsed_data = @parsing_csv.parse_csv(@csv_data)
    html_output = @formatting_html.format_html(parsed_data)
    @logging_data.log_data(html_output)
  end
end

# class for parse, format and logging
#  returns from functions passed to next function parsed _data to format html to log_data

class ParseCSV
  def parse_csv(csv_data)
    # takes in csv data
    rows = csv_data.split("\n")
    headers = rows[0].split(',')
    data_rows = rows[1..-1].map { |row| row.split(',') }
    parsed_data = { headers: headers, rows: data_rows }
    puts 'CSV data parsed'
    # return parsed data
    parsed_data
  end
end

class FormatHTML
  def format_html(parsed_data)
    # takes in parsed_data
    html = '<table>'
    html += "<tr>#{parsed_data[:headers].map { |h| "<th>#{h}</th>" }.join}</tr>"
    parsed_data[:rows].each do |row|
      html += "<tr>#{row.map { |cell| "<td>#{cell}</td>" }.join}</tr>"
    end
    html += '</table>'
    html_output = html
    puts 'Data formatted as HTML'
    # return html_output
    html_output
  end
end

class LogData
  def log_data(html_output)
    puts "Data processing completed at #{Time.now}"
    puts "Output:\n#{html_output}"
  end
end

parsing_csv = ParseCSV.new
formatting_html = FormatHTML.new
logging_data = LogData.new

data = "Name,Age,City\nAlice,30,New York\nBob,25,Los Angeles\nCharlie,35,Chicago"
handler = DataHandler.new(data, parsing_csv, formatting_html, logging_data)
handler.process_data

#
# CSV data parsed
# Data formatted as HTML
# Data processing completed at 2025-01-16 15:08:56 -0500
# Output:
# <table><tr><th>Name</th><th>Age</th><th>City</th></tr><tr><td>Alice</td><td>30</td><td>New York</td></tr><tr><td>Bob</td><td>25</td><td>Los Angeles</td></tr><tr><td>Charlie</td><td>35</td><td>Chicago</td></tr></table>
#
#
# Original class:
#
# class DataHandler
#   def initialize(csv_data)
#     @csv_data = csv_data
#   end
#
#   def process_data
#     parse_csv
#     format_html
#     log_data
#   end
#
#   private
#
#   def parse_csv
#     rows = @csv_data.split("\n")
#     headers = rows[0].split(",")
#     data_rows = rows[1..-1].map { |row| row.split(",") }
#     @parsed_data = { headers: headers, rows: data_rows }
#     # puts "parsed: #{@parsed_data}"
#     puts "CSV data parsed"
#   end
#
#   def format_html
#     html = "<table>"
#     html += "<tr>#{@parsed_data[:headers].map { |h| "<th>#{h}</th>" }.join}</tr>"
#     @parsed_data[:rows].each do |row|
#       html += "<tr>#{row.map { |cell| "<td>#{cell}</td>" }.join}</tr>"
#     end
#     html += "</table>"
#     @html_output = html
#     # puts "html : #{@html_output}"
#     puts "Data formatted as HTML"
#   end
#
#   def log_data
#     puts "Data processing completed at #{Time.now}"
#     puts "Output:\n#{@html_output}"
#   end
# end
