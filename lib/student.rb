class Student
  attr_accessor :name, :grade
  attr_reader: :id
#  with DB[:conn]
def initialize(name, grade, id=nil)
  @id = id
  @name = name
  @grade = grade
end

def self.create_table
  sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students(
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
  )
SQL
DB[:conn].excecute(sql)
end
def self.drop_table
  sql = <<-SQL
  DROP TABLE students
  SQL
  DB[:conn].execute(sql)
end

def save
  sql = <<-SQL
  INSERT INTO students(nane, grade) VALUES (?,?)
  SQL
  DB[:conn].execute(sql, self.name, self.table)
  
end
