defmodule NervesLab.Job do
  use NervesLab.Web, :model

  schema "jobs" do
    field :agent_id, :integer
    field :clone_url, :string
    field :commit_hash, :string
    field :ref, :string

    timestamps
  end

  @required_fields ~w(clone_url commit_hash ref)
  @optional_fields ~w(agent_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
