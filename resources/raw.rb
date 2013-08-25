actions :add
default_action :add

attribute :tag,     :kind_of => String, :name_attribute => true
attribute :data,       :kind_of => String, :required => true
attribute :cwd,      :kind_of => String
