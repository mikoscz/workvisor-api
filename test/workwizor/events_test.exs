defmodule Workwizor.EventsTest do
  use Workwizor.DataCase

  alias Workwizor.Events

  describe "violations" do
    alias Workwizor.Events.Violation

    @valid_attrs %{face_frame_url: "some face_frame_url", type: "some type", user_id: "some user_id", video_url: "some video_url"}
    @update_attrs %{face_frame_url: "some updated face_frame_url", type: "some updated type", user_id: "some updated user_id", video_url: "some updated video_url"}
    @invalid_attrs %{face_frame_url: nil, type: nil, user_id: nil, video_url: nil}

    def violation_fixture(attrs \\ %{}) do
      {:ok, violation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_violation()

      violation
    end

    test "list_violations/0 returns all violations" do
      violation = violation_fixture()
      assert Events.list_violations() == [violation]
    end

    test "get_violation!/1 returns the violation with given id" do
      violation = violation_fixture()
      assert Events.get_violation!(violation.id) == violation
    end

    test "create_violation/1 with valid data creates a violation" do
      assert {:ok, %Violation{} = violation} = Events.create_violation(@valid_attrs)
      assert violation.face_frame_url == "some face_frame_url"
      assert violation.type == "some type"
      assert violation.user_id == "some user_id"
      assert violation.video_url == "some video_url"
    end

    test "create_violation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_violation(@invalid_attrs)
    end

    test "update_violation/2 with valid data updates the violation" do
      violation = violation_fixture()
      assert {:ok, %Violation{} = violation} = Events.update_violation(violation, @update_attrs)
      assert violation.face_frame_url == "some updated face_frame_url"
      assert violation.type == "some updated type"
      assert violation.user_id == "some updated user_id"
      assert violation.video_url == "some updated video_url"
    end

    test "update_violation/2 with invalid data returns error changeset" do
      violation = violation_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_violation(violation, @invalid_attrs)
      assert violation == Events.get_violation!(violation.id)
    end

    test "delete_violation/1 deletes the violation" do
      violation = violation_fixture()
      assert {:ok, %Violation{}} = Events.delete_violation(violation)
      assert_raise Ecto.NoResultsError, fn -> Events.get_violation!(violation.id) end
    end

    test "change_violation/1 returns a violation changeset" do
      violation = violation_fixture()
      assert %Ecto.Changeset{} = Events.change_violation(violation)
    end
  end
end
