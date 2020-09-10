defmodule Workwizor.Repo do
  use Ecto.Repo,
    otp_app: :workwizor,
    adapter: Ecto.Adapters.Postgres
end
