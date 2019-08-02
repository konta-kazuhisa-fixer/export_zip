class ExportZipListener < Redmine::Hook::ViewListener
  def view_issues_index_bottom(context)
    project = context[:project]
    return '' unless User.current.allowed_to?(:export_zip, project, :global => true)
    context[:controller].send(:render_to_string, {
      :partial => 'hooks/export_zip/view_issues_index_bottom',
      :locals => {:project => project}})
  end
end
