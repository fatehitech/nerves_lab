defmodule NervesLab.Repo.Migrations.AddJobColumns do
  use Ecto.Migration

  def up do
    alter table(:jobs) do
      add :clone_url, :string
      add :commit_hash, :string
      add :ref, :string
    end
  end

  def down do
    alter table(:jobs) do
      remove :clone_url
      remove :commit_hash
      remove :ref
    end
  end
end
