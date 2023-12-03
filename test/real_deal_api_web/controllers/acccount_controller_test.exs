defmodule RealDealApiWeb.AcccountControllerTest do
  use RealDealApiWeb.ConnCase

  import RealDealApi.AccountsFixtures

  alias RealDealApi.Accounts.Acccount

  @create_attrs %{
    email: "some email",
    hash_password: "some hash_password"
  }
  @update_attrs %{
    email: "some updated email",
    hash_password: "some updated hash_password"
  }
  @invalid_attrs %{email: nil, hash_password: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tb_accounts", %{conn: conn} do
      conn = get(conn, ~p"/api/tb_accounts")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create acccount" do
    test "renders acccount when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tb_accounts", acccount: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tb_accounts/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "hash_password" => "some hash_password"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/tb_accounts", acccount: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update acccount" do
    setup [:create_acccount]

    test "renders acccount when data is valid", %{conn: conn, acccount: %Acccount{id: id} = acccount} do
      conn = put(conn, ~p"/api/tb_accounts/#{acccount}", acccount: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tb_accounts/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "hash_password" => "some updated hash_password"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, acccount: acccount} do
      conn = put(conn, ~p"/api/tb_accounts/#{acccount}", acccount: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete acccount" do
    setup [:create_acccount]

    test "deletes chosen acccount", %{conn: conn, acccount: acccount} do
      conn = delete(conn, ~p"/api/tb_accounts/#{acccount}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tb_accounts/#{acccount}")
      end
    end
  end

  defp create_acccount(_) do
    acccount = acccount_fixture()
    %{acccount: acccount}
  end
end
