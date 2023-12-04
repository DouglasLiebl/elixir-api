defmodule RealDealApiWeb.AccountJSON do
  alias RealDealApi.Accounts.Account

  @doc """
  Renders a list of tb_accounts.
  """
  def index(%{tb_accounts: tb_accounts}) do
    %{data: for(account <- tb_accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account}) do
    %{data: data(account)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end
end
