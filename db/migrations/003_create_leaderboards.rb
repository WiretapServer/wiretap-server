Sequel.migration do
  up do
    # create leaderboards table
    create_table(:leaderboards) do
      primary_key :id

      String  :name
      String  :type
      Boolean :reverse #if true then descending

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:leaderboards)
  end
end