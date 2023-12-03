defmodule RealDealApiWeb.AcccountController do
  use RealDealApiWeb, :controller

  alias RealDealApi.Accounts
  alias RealDealApi.Accounts.Acccount

  action_fallback RealDealApiWeb.FallbackController

  def index(conn, _params) do
    tb_accounts = Accounts.list_tb_accounts()
    render(conn, :index, tb_accounts: tb_accounts)
  end

  def create(conn, %{"acccount" => acccount_params}) do
    with {:ok, %Acccount{} = acccount} <- Accounts.create_acccount(acccount_params) do
      conn
      |> put_status(:created)
      |> render(:show, acccount: acccount)
    end
  end

  def show(conn, %{"id" => id}) do
    acccount = Accounts.get_acccount!(id)
    render(conn, :show, acccount: acccount)
  end

  def update(conn, %{"id" => id, "acccount" => acccount_params}) do
    acccount = Accounts.get_acccount!(id)

    with {:ok, %Acccount{} = acccount} <- Accounts.update_acccount(acccount, acccount_params) do
      render(conn, :show, acccount: acccount)
    end
  end

  def delete(conn, %{"id" => id}) do
    acccount = Accounts.get_acccount!(id)

    with {:ok, %Acccount{}} <- Accounts.delete_acccount(acccount) do
      send_resp(conn, :no_content, "")
    end
  end
end
