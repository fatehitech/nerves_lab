defmodule NervesLab.PageController do
  use NervesLab.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
