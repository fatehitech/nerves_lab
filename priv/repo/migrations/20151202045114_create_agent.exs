defmodule NervesLab.Repo.Migrations.CreateAgent do
  use Ecto.Migration

  def change do
    create table(:agents) do
      add :token, :string

      timestamps
    end

  end
end
