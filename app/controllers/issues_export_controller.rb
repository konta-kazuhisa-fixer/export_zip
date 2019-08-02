require_relative '../helpers/zip_file_generator'
require_relative '../helpers/make_folder'
require_relative '../helpers/delete_zip_file'
require 'fileutils'

class IssuesExportController < ApplicationController
  unloadable
  include IssuesHelper
  include MakeCSV
  include GetData
  helper :journals
  helper :projects
  include ProjectsHelper   
  helper :custom_fields
  include CustomFieldsHelper
  helper :issue_relations
  include IssueRelationsHelper
  helper :watchers
  include WatchersHelper
  helper :attachments
  include AttachmentsHelper
  helper :queries
  include QueriesHelper
  helper :sort
  include SortHelper
  include IssuesHelper
  helper :timelog
  include Redmine::Export::PDF

  before_action :find_optional_project, :only => [:export_zip]
  def export_zip
    retrieve_query
    sort_init(@query.sort_criteria.empty? ? [['id', 'desc']] : @query.sort_criteria)
    sort_update(@query.sortable_columns)
    if @query.valid?
      @issue_count = @query.issue_count
      @limit = Setting.issues_export_limit.to_i
      @issue_pages = Paginator.new self, @issue_count, @limit, params['page']
      @offset ||= @issue_pages.current.offset
      @issues = @query.issues(:include => [:assigned_to, :tracker, :priority, :category, :fixed_version],
                              :order => sort_clause, 
                              :offset => @offset, 
                              :limit => @limit)
      if respond_to?(:query_to_csv) # Redmine 2.3 later
        csv = query_to_csv(@issues, @query, params)
      else
        csv = issues_to_csv(@issues, @project, @query, params)
      end

      mf = MakeFolder.new(get_attached_file(csv))
      directory = mf.make_directory()
      file_path = './' + directory + '.zip'
      make_csv(csv, directory, mf.get_folder_name())
      #make_totalcsv(csv, directory)
      mf.save_attached_file()

      zf = ZipFileGenerator.new('./tmp/' + directory, file_path)
      zf.write()
    
      FileUtils.rm_rf('./tmp/' + directory)
    
      send_file(file_path)

      self.response_body = DeleteZipFile.new(file_path) 
    end
  end
end
