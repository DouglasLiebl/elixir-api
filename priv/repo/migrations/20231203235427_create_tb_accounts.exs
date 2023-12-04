defmodule RealDealApi.Repo.Migrations.CreateTbAccounts do
  use Ecto.Migration

  def change do
    create table(:tb_accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :hash_password, :string

      timestamps(type: :utc_datetime)
    end
    
    create unique_index(:tb_accounts, [:email])
  end
end
