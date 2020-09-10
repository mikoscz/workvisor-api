defmodule WorkwizorWeb.ViolationView do
  use WorkwizorWeb, :view
  alias WorkwizorWeb.ViolationView

  def render("index.json", %{violations: violations}) do
    %{data: render_many(violations, ViolationView, "violation.json")}
  end

  def render("show.json", %{violation: violation}) do
    %{data: render_one(violation, ViolationView, "violation.json")}
  end

  def render("violation.json", %{violation: violation}) do
    %{id: violation.id,
      type: violation.type,
      user_id: violation.user_id,
      face_frame_url: violation.face_frame_url,
      video_url: violation.video_url}
  end
end
