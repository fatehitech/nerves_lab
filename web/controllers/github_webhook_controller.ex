defmodule NervesLab.GithubWebhookController do
  use NervesLab.Web, :controller

  alias NervesLab.GithubWebhook

  def handle(conn, params) do
    IO.inspect params
    send_resp(201, "")
  end
end
