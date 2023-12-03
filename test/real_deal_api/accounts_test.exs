defmodule RealDealApi.AccountsTest do
  use RealDealApi.DataCase

  alias RealDealApi.Accounts

  describe "tb_accounts" do
    alias RealDealApi.Accounts.Acccount

    import RealDealApi.AccountsFixtures

    @invalid_attrs %{email: nil, hash_password: nil}

    test "list_tb_accounts/0 returns all tb_accounts" do
      acccount = acccount_fixture()
      assert Accounts.list_tb_accounts() == [acccount]
    end

    test "get_acccount!/1 returns the acccount with given id" do
      acccount = acccount_fixture()
      assert Accounts.get_acccount!(acccount.id) == acccount
    end

    test "create_acccount/1 with valid data creates a acccount" do
      valid_attrs = %{email: "some email", hash_password: "some hash_password"}

      assert {:ok, %Acccount{} = acccount} = Accounts.create_acccount(valid_attrs)
      assert acccount.email == "some email"
      assert acccount.hash_password == "some hash_password"
    end

    test "create_acccount/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_acccount(@invalid_attrs)
    end

    test "update_acccount/2 with valid data updates the acccount" do
      acccount = acccount_fixture()
      update_attrs = %{email: "some updated email", hash_password: "some updated hash_password"}

      assert {:ok, %Acccount{} = acccount} = Accounts.update_acccount(acccount, update_attrs)
      assert acccount.email == "some updated email"
      assert acccount.hash_password == "some updated hash_password"
    end

    test "update_acccount/2 with invalid data returns error changeset" do
      acccount = acccount_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_acccount(acccount, @invalid_attrs)
      assert acccount == Accounts.get_acccount!(acccount.id)
    end

    test "delete_acccount/1 deletes the acccount" do
      acccount = acccount_fixture()
      assert {:ok, %Acccount{}} = Accounts.delete_acccount(acccount)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_acccount!(acccount.id) end
    end

    test "change_acccount/1 returns a acccount changeset" do
      acccount = acccount_fixture()
      assert %Ecto.Changeset{} = Accounts.change_acccount(acccount)
    end
  end
end
