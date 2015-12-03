defmodule NervesLab.WorkController do
  use NervesLab.Web, :controller

  alias NervesLab.Work

  def give_job(conn, params) do
    # Who are you?
    # Are you eligible for this task?
    # If so, I assign it to you
    # And I return the job to you

    # nevermind this is polling
    # lets use channels!
  end
end
