defmodule ValidationShowcase.Repo do
  use Ecto.Repo,
    otp_app: :validation_showcase,
    adapter: Ecto.Adapters.Postgres
end
