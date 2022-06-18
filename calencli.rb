# Data
require "date"
require "colorize"
id = 0
events = [
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => %w[Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T12:45:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2021-11-16T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Diego"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => %w[Diego Andre Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-17T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2021-11-18T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => %w[Diego Teddy Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T12:00:00-05:00",
    "title" => "English for Engineers",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2021-11-20T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2021-11-20T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-25T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-26T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" }
]


# MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS
# MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS
# MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS - MAIN METHODS

days = %w[Mon Tue Wed Thu Fri Sat Sun]
months = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

# metodo para obtener lista de la semana
def get_weeklist(events, date)
  actual_day = Date.parse(date)
  week = Array.new(7)
  week.map do |_|
    arr = events.select { |e| Date.parse(e["start_date"]) == actual_day } 
    actual_day += 1
    if arr.length > 1 then sort_day_events(arr) else arr end
  end
end

def sort_day_events(week)
  week.sort { |a, b| a["end_date"] <=> b["end_date"] }
end

# metodo para mostrar lista de la semana
def show_event_weekList(list, date)
  actual_day = Date.parse(date)
  (0.. list.size - 1).each do |i|
    print actual_day.strftime("%a %b #{"%d".green}")
      if list[i].length.zero?
        puts " " * 16 + "No events"
      else
        show_event_dayList(list[i])
      end
    actual_day += 1
    puts " "
  end
  print ""
end

# metodo para mostrar eventos del dia
def show_event_dayList(day)
  (0..day.length - 1).each do |i|
    if day[i]["end_date"] == ""
      hour = " " * 13
    else
      h1 = DateTime.parse(day[i]["start_date"])
      time1 = h1.strftime("#{if h1.hour >= 12 then '%H'.green else '%H' end}:%M")

      h2 = DateTime.parse(day[i]["end_date"])
      time2 = h2.strftime("#{if h2 >= 12 then '%H'.green else '%H' end}:%M")
      hour = "#{time1} - #{time2}"
    end
    puts "  #{hour} #{day[i]['title']} (#{day[i]['id'].to_s.green})"
    print "\t  "
  end
end

def welcome_message
  puts ("-" * 29) + "Welcome to CalenCLI" + ("-" * 30)
  puts "\n"
end

def print_menufooter
  puts "-" * 78
  puts "list | create | show | update | delete | next | prev | #{"exit".green}"
  puts "\n"
end

# MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS
# MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS
# MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS - MENU METHODS

# LIST METHODS - LIST METHODS - LIST METHODS - LIST METHODS
# LIST METHODS - LIST METHODS - LIST METHODS - LIST METHODS

def show_list(events)
  actual_day = "2021-11-15T00:00:00-05:00"
  current_weeklist = get_weeklist(events, actual_day)
  show_event_weekList(current_weeklist,actual_day)
end


# CREATE METHODS - CREATE METHODS - CREATE METHODS - CREATE METHODS
# CREATE METHODS - CREATE METHODS - CREATE METHODS - CREATE METHODS

def create_event
  valid_date("")
  valid_title
  calendar
  print "start_end: "
  start_content = gets.chomp
  print "notes: "
  notes_content = gets.chomp
  print "guests: "
  guests_content = gets.chomp
  print_menufooter
  puts "\n"
end

# error con variable, toma la variable anterior por defecto
def valid_date(date)
  date1 = Date._strptime(date, "%Y-%m-%d")
  print "date: "
  date = gets.chomp
    while date1 == nil
      print "Type a valid date: YYYY-MM-DD" + "\n"
      print "date: "
      date = gets.chomp
      date1 = Date._strptime(date, "%Y-%m-%d")
    end
end

def valid_title
  print "title: "
  title_content = gets.chomp
  if title_content == ""
      print "Cannot be blank" + "\n"
      print "title: "
      date = gets.chomp
  else
  end
end

def calendar
  print "calendar: "
  calendar_content = gets.chomp
  case calendar_content
    when "tech" then puts "tech".colorize(:light_red)
    when "english" then puts "english".colorize(:light_magenta)
    when "soft skills" then puts "soft skills".colorize(:green)
  end
end



# SHOW METHODS - SHOW METHODS - SHOW METHODS - SHOW METHODS - SHOW METHODS
# SHOW METHODS - SHOW METHODS - SHOW METHODS - SHOW METHODS - SHOW METHODS

def get_id(events)
  print "Event ID: "
  id_f = gets.chomp.to_i
  search_event(events, id_f)
end

def show_event(events)
  position = get_id(events)
  date = Date.strptime("#{events[position]['start_date']}")
  puts "date: #{date.strftime("%F")}"
  puts "title: #{events[position]['title']}"
  puts "calendar: #{events[position]['calendar']}"
  puts "start: #{events[position]['start_date']}"
  puts "end: #{events[position]['end_date']}"
  puts "notes: #{events[position]['notes']}"
  puts "guests: #{events[position]['guests']}"
end

def search_event(events, id)
  (0..events.size - 1).each do |i|
    return i if events[i]['id'] == id
  end
end

# UPDATE METHODS - UPDATE METHODS - UPDATE METHODS - UPDATE METHODS - UPDATE METHODS
# UPDATE METHODS - UPDATE METHODS - UPDATE METHODS - UPDATE METHODS - UPDATE METHODS






# DELETE METHODS - DELETE METHODS - DELETE METHODS - DELETE METHODS - DELETE METHODS
# DELETE METHODS - DELETE METHODS - DELETE METHODS - DELETE METHODS - DELETE METHODS

def delete_id(events)
  print "Event ID: "
  id_d = gets.chomp.to_i
  position = search_event(events, id_d)
  events.delete_at(position)
  print_menufooter
end

# NEXT & PREV METHODS - NEXT & PREV METHODS - NEXT & PREV METHODS - NEXT & PREV METHODS
# NEXT & PREV METHODS - NEXT & PREV METHODS - NEXT & PREV METHODS - NEXT & PREV METHODS





# Main Program - Main Program - Main Program - Main Program - Main Program - Main Program - Main Program
# Main Program - Main Program - Main Program - Main Program - Main Program - Main Program - Main Program
# Main Program - Main Program - Main Program - Main Program - Main Program - Main Program - Main Program



def principal(events)
  actual_day = "2021-11-15T00:00:00-05:00"
  current_weeklist = get_weeklist(events, actual_day)
  welcome_message
  show_event_weekList(current_weeklist,actual_day)
  print_menufooter
end

principal(events)


action = nil
while action != "exit"
    print "action: "
    action = gets.chomp
    case action
      when "list" 
        puts welcome_message
        show_list(events)
        puts print_menufooter
      when "create"   
        create_event
      when "show" 
        show_event(events)
       puts print_menufooter
      when "update" 
        puts "UPDATE"
      when "delete" 
        delete_id(events)
      when "next" 
        puts "NEXT"
      when "prev"
        puts "PREV"
      else 
        puts "Enter valid action"
    end
  end
puts "Thanks for using calenCLI"
