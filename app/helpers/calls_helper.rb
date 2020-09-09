module CallsHelper
  def call_action_tags(call)
    content_tag(:div) do
      tags =  show_tag(call)
      tags += edit_tag(call)
      tags += delete_tag(call)
    end
  end

  def show_tag(call)
    link_to(call_path(call), class: 'btn btn-outline-secondary btn-sm m-1 show_model_button') do
      content_tag(:id, '', class: 'fa fa-eye', title: 'Show')
    end
  end

  def edit_tag(call)
    link_to(edit_call_path(call), class: 'btn btn-outline-primary btn-sm m-1') do
      content_tag(:id, '', class: 'fa fa-pencil', title: 'Edit')
    end
  end

  def delete_tag(call)
    link_to(call_path(call), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-outline-danger btn-sm m-1') do
      content_tag(:id, '', class: 'fa fa-trash', title: 'Delete')
    end
  end
end
