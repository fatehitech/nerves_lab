defmodule NervesLab.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :agent_id, :integer

      timestamps
    end

  end
end
