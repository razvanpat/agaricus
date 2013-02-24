module ApplicationHelper
  def active_status path
    if request.path == path
      raw 'class="active"'
    end
  end
end
