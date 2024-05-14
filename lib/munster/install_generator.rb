# frozen_string_literal: true

require "rails/generators"
require "rails/generators/active_record"

module Munster
  #
  # Rails generator used for setting up Munster in a Rails application.
  # Run it with +bin/rails g munster:install+ in your console.
  #
  class InstallGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration

    TEMPLATES = File.join(File.dirname(__FILE__))
    source_paths << TEMPLATES

    class_option :database, type: :string, aliases: %i[--db], desc: "The database for your migration. By default, the current environment's primary database is used."

    def create_migration_file
      migration_template "migrations/create_munster_tables.rb.erb", File.join(db_migrate_path, "create_munster_tables.rb")
    end

    private

    def migration_version
      "[#{ActiveRecord::VERSION::STRING.to_f}]"
    end
  end
end