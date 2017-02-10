Sequel.migration do
  up do
    # create users table
    create_table(:users) do
      primary_key :id

      String  :email
      String  :username
      String  :name
      String  :password
      String  :password_salt
      String  :session_token

      Integer :level
      Integer :xp
      Integer :energy
      Integer :credits
      Integer :platinum
      Integer :notoriety
      String  :achievements
      String  :quests
      String  :items

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:users)
  end
end
