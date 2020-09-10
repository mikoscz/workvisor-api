defmodule Workwizor.Events do
  @moduledoc """
  The Events context.
  """

  import Ecto.Query, warn: false
  alias Workwizor.Repo

  alias Workwizor.Events.Violation

  @doc """
  Returns the list of violations.

  ## Examples

      iex> list_violations()
      [%Violation{}, ...]

  """
  def list_violations do
    Repo.all(Violation)
  end

  def list_violations_for_user(id) do
    query = from v in Violation,
    where: v.user_id == ^id

    Repo.all(query)
  end

  @doc """
  Gets a single violation.

  Raises `Ecto.NoResultsError` if the Violation does not exist.

  ## Examples

      iex> get_violation!(123)
      %Violation{}

      iex> get_violation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_violation!(id), do: Repo.get!(Violation, id)

  @doc """
  Creates a violation.

  ## Examples

      iex> create_violation(%{field: value})
      {:ok, %Violation{}}

      iex> create_violation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_violation(attrs \\ %{}) do
    %Violation{}
    |> Violation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a violation.

  ## Examples

      iex> update_violation(violation, %{field: new_value})
      {:ok, %Violation{}}

      iex> update_violation(violation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_violation(%Violation{} = violation, attrs) do
    violation
    |> Violation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a violation.

  ## Examples

      iex> delete_violation(violation)
      {:ok, %Violation{}}

      iex> delete_violation(violation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_violation(%Violation{} = violation) do
    Repo.delete(violation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking violation changes.

  ## Examples

      iex> change_violation(violation)
      %Ecto.Changeset{data: %Violation{}}

  """
  def change_violation(%Violation{} = violation, attrs \\ %{}) do
    Violation.changeset(violation, attrs)
  end
end
