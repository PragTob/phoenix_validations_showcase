defmodule ValidationShowcaseWeb.PageController do
  use ValidationShowcaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
