class Movie < Granite::ORM::Base
  adapter pg
  table_name movies


  # id : Int64 primary key is created for you
  field name : String
  field release_year : Int32
  timestamps
end
