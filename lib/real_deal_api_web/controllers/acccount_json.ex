defmodule RealDealApiWeb.AcccountJSON do
  alias RealDealApi.Accounts.Acccount

  @doc """
  Renders a list of tb_accounts.
  """
  def index(%{tb_accounts: tb_accounts}) do
    %{data: for(acccount <- tb_accounts, do: data(acccount))}
  end

  @doc """
  Renders a single acccount.
  """
  def show(%{acccount: acccount}) do
    %{data: data(acccount)}
  end

  defp data(%Acccount{} = acccount) do
    %{
      id: acccount.id,
      email: acccount.email,
      hash_password: acccount.hash_password
    }
  end
end
