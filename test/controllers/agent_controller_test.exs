defmodule NervesLab.AgentControllerTest do
  use NervesLab.ConnCase

  alias NervesLab.Agent
  @valid_attrs %{token: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, agent_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing agents"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, agent_path(conn, :new)
    assert html_response(conn, 200) =~ "New agent"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, agent_path(conn, :create), agent: @valid_attrs
    assert redirected_to(conn) == agent_path(conn, :index)
    assert Repo.get_by(Agent, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, agent_path(conn, :create), agent: @invalid_attrs
    assert html_response(conn, 200) =~ "New agent"
  end

  test "shows chosen resource", %{conn: conn} do
    agent = Repo.insert! %Agent{}
    conn = get conn, agent_path(conn, :show, agent)
    assert html_response(conn, 200) =~ "Show agent"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, agent_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    agent = Repo.insert! %Agent{}
    conn = get conn, agent_path(conn, :edit, agent)
    assert html_response(conn, 200) =~ "Edit agent"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    agent = Repo.insert! %Agent{}
    conn = put conn, agent_path(conn, :update, agent), agent: @valid_attrs
    assert redirected_to(conn) == agent_path(conn, :show, agent)
    assert Repo.get_by(Agent, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    agent = Repo.insert! %Agent{}
    conn = put conn, agent_path(conn, :update, agent), agent: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit agent"
  end

  test "deletes chosen resource", %{conn: conn} do
    agent = Repo.insert! %Agent{}
    conn = delete conn, agent_path(conn, :delete, agent)
    assert redirected_to(conn) == agent_path(conn, :index)
    refute Repo.get(Agent, agent.id)
  end
end
