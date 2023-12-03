defmodule RealDealApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias RealDealApi.Repo

  alias RealDealApi.Accounts.Acccount

  @doc """
  Returns the list of tb_accounts.

  ## Examples

      iex> list_tb_accounts()
      [%Acccount{}, ...]

  """
  def list_tb_accounts do
    Repo.all(Acccount)
  end

  @doc """
  Gets a single acccount.

  Raises `Ecto.NoResultsError` if the Acccount does not exist.

  ## Examples

      iex> get_acccount!(123)
      %Acccount{}

      iex> get_acccount!(456)
      ** (Ecto.NoResultsError)

  """
  def get_acccount!(id), do: Repo.get!(Acccount, id)

  @doc """
  Creates a acccount.

  ## Examples

      iex> create_acccount(%{field: value})
      {:ok, %Acccount{}}

      iex> create_acccount(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_acccount(attrs \\ %{}) do
    %Acccount{}
    |> Acccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a acccount.

  ## Examples

      iex> update_acccount(acccount, %{field: new_value})
      {:ok, %Acccount{}}

      iex> update_acccount(acccount, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_acccount(%Acccount{} = acccount, attrs) do
    acccount
    |> Acccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a acccount.

  ## Examples

      iex> delete_acccount(acccount)
      {:ok, %Acccount{}}

      iex> delete_acccount(acccount)
      {:error, %Ecto.Changeset{}}

  """
  def delete_acccount(%Acccount{} = acccount) do
    Repo.delete(acccount)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking acccount changes.

  ## Examples

      iex> change_acccount(acccount)
      %Ecto.Changeset{data: %Acccount{}}

  """
  def change_acccount(%Acccount{} = acccount, attrs \\ %{}) do
    Acccount.changeset(acccount, attrs)
  end
end
