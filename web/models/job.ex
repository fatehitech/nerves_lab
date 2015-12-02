defmodule NervesLab.Job do
  use NervesLab.Web, :model

  schema "jobs" do
    field :agent_id, :integer

    timestamps
  end

  @required_fields ~w(agent_id)
  @optional_fields ~w()

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
