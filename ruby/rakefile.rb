 namespace :morning do
 task :turn_off_alarm do
    puts "Turned off alarm. Would have liked 5 more minutes, though."
  end
 
  task :groom_myself do
    puts "Brushed teeth."
    puts "Showered."
    puts "Shaved."
  end
 
  task :make_coffee do
    cups = ENV["COFFEE_CUPS"] || 2
    puts "Made #{cups} cups of coffee. Shakes are gone."
  end
 
  task :walk_dog do
    puts "Dog walked."
  end
 
  task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
    puts "Ready for the day!"
  end
  end
  
  namespace :morning do
    task :groom_myself do
      puts "Styled hair."
    end
  end
  
  namespace :afternoon do
    task :make_coffee do
      Rake::Task['morning:make_coffee'].invoke
      puts "Ready for the rest of the day!"
    end
  end
  
  task :default => 'morning:ready_for_the_day' 