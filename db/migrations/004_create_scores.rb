Sequel.migration do
  up do
    # create scores table
    create_table(:scores) do
      primary_key :id

      Integer  :user_id
      Integer  :leaderboard_id
      Float    :value
      String   :country #2 Digit Country Code
      String   :city

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:scores)
  end
end
