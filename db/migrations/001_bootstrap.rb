Sequel.migration do
  up do
    # create users table
    create_table(:admin) do
      primary_key :id

      String  :username
      String  :name
      String  :password
      String  :password_salt
      String  :session_token

      Integer :role
      Boolean :disabled

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:admin)
  end
end
