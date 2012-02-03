require 'optparse'
require 'date'

help = <<HELP
Jekyll is a blog-aware, static site generator.

Basic Command Line Usage:
  jekyll                                                   # . -> ./_site
  jekyll <path to write generated site>                    # . -> <path>
  jekyll <path to source> <path to write generated site>   # <path> -> <path>
  jekyll import <importer name> <options>                  # imports posts using named import script
  
  Configuration is read from '<source>/_config.yml' but can be overriden
  using the following options:

HELP

# Add Dates as a new option type
OptionParser.accept(Date, /(\d+)-(\d+)-(\d+)/) do |d, mon, day, year|
  Date.new(year.to_i, mon.to_i, day.to_i) 
end
options={}
opts = OptionParser.new
opts.banner=help
opts.on("-x")                        {|val| puts "-x seen";options["x"]=val }
opts.on("-s", "--size VAL", Integer) {|val| puts "-s #{val}"; options["the_number"]=val}
opts.on("-a", "--at DATE",  Date)    {|val| puts "-a #{val}";options["incident_date"]=val }

#my_argv = [ "--size", "1234", "-x", "-a", "12-25-2008", "fred", "wilma" ]

#rest = opts.parse(*my_argv)
#puts "Remainder = #{rest.join(', ')}"
 opts.program_name = 'myprog'
opts.parse!
p options

if ARGV.size > 0
  if ARGV[0] == 'import'
    migrator = ARGV[1]
	
	if migrator.nil?
      puts "Invalid options. Run `jekyll --help` for assistance."
      exit(1)
    else
      migrator = migrator.downcase
    end
	
  end
end

puts migrator
#puts File.read(__FILE__)
