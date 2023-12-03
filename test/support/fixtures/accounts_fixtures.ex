defmodule RealDealApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RealDealApi.Accounts` context.
  """

  @doc """
  Generate a acccount.
  """
  def acccount_fixture(attrs \\ %{}) do
    {:ok, acccount} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hash_password: "some hash_password"
      })
      |> RealDealApi.Accounts.create_acccount()

    acccount
  end
end
