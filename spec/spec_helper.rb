require "bundler/setup"
require Bundler.root + 'lib/active_model/add_validation'

require 'active_record'
require 'roles'
require 'models'
require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.order = "random"
end

ActiveRecord::Base.configurations = {
  'test' => {
    'adapter'  =>  'sqlite3',
    'database' => ':memory:'
  }
}

ActiveRecord::Base.establish_connection('test')

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string "name"
    end
    create_table(:addresses) do |t|
      t.references :user
      t.string "tel"
      t.boolean 'primary', null:false, default: false
    end
  end
end

CreateAllTables.up
