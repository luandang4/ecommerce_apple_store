module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Apple Store"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def admin_page_title(title)
    if title
      title
    end
  end

  def format_number_to_currency number
    number_to_currency(number, unit: '', delimiter: '.' , precision: 0)
  end
end
