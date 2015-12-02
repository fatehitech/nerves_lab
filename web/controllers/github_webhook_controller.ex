defmodule NervesLab.GithubWebhookController do
  use NervesLab.Web, :controller

  alias NervesLab.GithubWebhook
  alias NervesLab.Job

  def handle(conn, params) do
    job = Job.changeset(%Job{}, %{
      clone_url: params["repository"]["clone_url"],
      commit_hash: params["head_commit"]["id"],
      ref: params["ref"]
    })
    Repo.insert!(job)
    send_resp(conn, 201, "")
  end
end
