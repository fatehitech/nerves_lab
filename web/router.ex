defmodule NervesLab.Router do
  use NervesLab.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/", NervesLab do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/agents", AgentController
  end


  scope "/api", NervesLab do
    pipe_through :api

    resources "/jobs", JobController, except: [:new, :edit]

    post "/webhooks/github", GithubWebhookController, :handle

    get "/work", WorkController, :give_job
  end
end
