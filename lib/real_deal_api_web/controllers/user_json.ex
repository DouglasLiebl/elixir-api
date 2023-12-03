defmodule RealDealApiWeb.UserJSON do
  alias RealDealApi.Users.User

  @doc """
  Renders a list of tb_users.
  """
  def index(%{tb_users: tb_users}) do
    %{data: for(user <- tb_users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      full_name: user.full_name,
      gender: user.gender,
      biography: user.biography
    }
  end
end
