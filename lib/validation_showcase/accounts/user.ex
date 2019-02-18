defmodule ValidationShowcase.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :email_confirmation, :string, virtual: true
    field :password, :string, virtual: true
    field :password_digest, :string

    field :terms_of_service, :boolean, virtual: true

    timestamps()
  end

  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :terms_of_service])
    |> validate_required([:email, :password])
    |> validate_confirmation(:email)
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8)
    |> validate_acceptance(:terms_of_service)
    |> hash_password()
  end

  defp hash_password(changeset) do
    password = get_change(changeset, :password)
    IO.puts "--------------- hasshinggg #{password} --------------"
    put_change(changeset, :password_digest, password)
  end
end
