require_relative 'BookInStock'
reader = CsvReader.new
ARGV.each do | csv_file_name |
    p csv_file_name
    STDERR.puts "porcessing #{csv_file_name} "
    reader.read_in_csv_data(csv_file_name)
end
puts "Total value = #{reader.total_value_in_stock}"

