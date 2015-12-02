defmodule NervesLab.AgentTest do
  use NervesLab.ModelCase

  alias NervesLab.Agent

  @valid_attrs %{token: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Agent.changeset(%Agent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Agent.changeset(%Agent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
