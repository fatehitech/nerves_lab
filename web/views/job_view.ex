defmodule NervesLab.JobView do
  use NervesLab.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, NervesLab.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, NervesLab.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      agent_id: job.agent_id}
  end
end
