defmodule WorkwizorWeb.ViolationControllerTest do
  use WorkwizorWeb.ConnCase

  alias Workwizor.Events
  alias Workwizor.Events.Violation

  @create_attrs %{
    face_frame_url: "some face_frame_url",
    type: "some type",
    user_id: "some user_id",
    video_url: "some video_url"
  }
  @update_attrs %{
    face_frame_url: "some updated face_frame_url",
    type: "some updated type",
    user_id: "some updated user_id",
    video_url: "some updated video_url"
  }
  @invalid_attrs %{face_frame_url: nil, type: nil, user_id: nil, video_url: nil}

  def fixture(:violation) do
    {:ok, violation} = Events.create_violation(@create_attrs)
    violation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all violations", %{conn: conn} do
      conn = get(conn, Routes.violation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create violation" do
    test "renders violation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.violation_path(conn, :create), violation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.violation_path(conn, :show, id))

      assert %{
               "id" => id,
               "face_frame_url" => "some face_frame_url",
               "type" => "some type",
               "user_id" => "some user_id",
               "video_url" => "some video_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.violation_path(conn, :create), violation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update violation" do
    setup [:create_violation]

    test "renders violation when data is valid", %{conn: conn, violation: %Violation{id: id} = violation} do
      conn = put(conn, Routes.violation_path(conn, :update, violation), violation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.violation_path(conn, :show, id))

      assert %{
               "id" => id,
               "face_frame_url" => "some updated face_frame_url",
               "type" => "some updated type",
               "user_id" => "some updated user_id",
               "video_url" => "some updated video_url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, violation: violation} do
      conn = put(conn, Routes.violation_path(conn, :update, violation), violation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete violation" do
    setup [:create_violation]

    test "deletes chosen violation", %{conn: conn, violation: violation} do
      conn = delete(conn, Routes.violation_path(conn, :delete, violation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.violation_path(conn, :show, violation))
      end
    end
  end

  defp create_violation(_) do
    violation = fixture(:violation)
    %{violation: violation}
  end
end
