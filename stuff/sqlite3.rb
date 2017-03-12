require 'rubygems'
require 'sqlite3'

$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true

def close_db
    $db.close
    exit
end

def create_table
    puts "Creating ppl table"
    $db.execute %q{
       CREATE TABLE people (
       id integer primary key,
       name varchar(50),
       job varchar(50),
       age integer)
    }
end

def add_person
    puts "name, job, age"
    name = gets.chomp
    job = gets.chomp
    age = gets.chomp
    $db.execute("INSERT INTO people (name, job, age) VALUES (?, ?, ?)", name, job, age)
end

def find_person
    puts "Enter name, age or ID of person to find"
    id = gets.chomp

    person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ? OR age = ?", id, id.to_i, id.to_i).first
    unless person
        puts "No result found"
        return
    end
    
    puts %Q{Name: #{person['name']}
Job: #{person['job']}
Age: #{person['age']}
            }
end

loop do
    puts %q{
Please selet an option:

1. Create people table
2. Add person
3. Look for a person
4. Quit
            }
    case gets.chomp
    when '1'
        create_table
    when '2'
        add_person
    when '3'
        find_person
    when '4'
        close_db
    end
end
        
        
        
        
