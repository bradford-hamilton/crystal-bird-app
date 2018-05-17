class Bird < Granite::ORM::Base
  adapter pg
  table_name birds


  # id : Int64 primary key is created for you
  field name : String
  field age : Int32
  timestamps
end
