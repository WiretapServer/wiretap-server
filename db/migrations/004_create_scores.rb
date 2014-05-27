Sequel.migration do
  up do
    # create scores table
    create_table(:scores) do
      primary_key :id

      Integer  :user
      Integer  :leaderboard
      Float    :score
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
