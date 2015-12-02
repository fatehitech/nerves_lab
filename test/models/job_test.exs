defmodule NervesLab.JobTest do
  use NervesLab.ModelCase

  alias NervesLab.Job

  @valid_attrs %{agent_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
