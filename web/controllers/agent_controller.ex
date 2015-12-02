defmodule NervesLab.AgentController do
  use NervesLab.Web, :controller

  alias NervesLab.Agent

  plug :scrub_params, "agent" when action in [:create, :update]

  def index(conn, _params) do
    agents = Repo.all(Agent)
    render(conn, "index.html", agents: agents)
  end

  def new(conn, _params) do
    changeset = Agent.changeset(%Agent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"agent" => agent_params}) do
    changeset = Agent.changeset(%Agent{}, agent_params)

    case Repo.insert(changeset) do
      {:ok, _agent} ->
        conn
        |> put_flash(:info, "Agent created successfully.")
        |> redirect(to: agent_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    agent = Repo.get!(Agent, id)
    render(conn, "show.html", agent: agent)
  end

  def edit(conn, %{"id" => id}) do
    agent = Repo.get!(Agent, id)
    changeset = Agent.changeset(agent)
    render(conn, "edit.html", agent: agent, changeset: changeset)
  end

  def update(conn, %{"id" => id, "agent" => agent_params}) do
    agent = Repo.get!(Agent, id)
    changeset = Agent.changeset(agent, agent_params)

    case Repo.update(changeset) do
      {:ok, agent} ->
        conn
        |> put_flash(:info, "Agent updated successfully.")
        |> redirect(to: agent_path(conn, :show, agent))
      {:error, changeset} ->
        render(conn, "edit.html", agent: agent, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    agent = Repo.get!(Agent, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(agent)

    conn
    |> put_flash(:info, "Agent deleted successfully.")
    |> redirect(to: agent_path(conn, :index))
  end
end
