Sequel.migration do
  up do
    # create leaderboards table
    create_table(:leaderboards) do
      primary_key :id

      String  :leaderboard_name
      String  :leaderboard_type
      Boolean :reverse, default: false 

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:leaderboards)
  end
end
