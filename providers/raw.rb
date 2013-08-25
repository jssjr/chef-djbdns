action :add do
  data = new_resource.data
  tag = new_resource.tag
  cwd = new_resource.cwd ? new_resource.cwd : "#{node['djbdns']['tinydns_internal_dir']}/root"

  data = IO.readlines("#{cwd}/data").delete_if{|l| l =~ /^#{data}$/}
  data.append("#{data}\n")
  ::File.write("#{cwd}/data", data)

  new_resource.updated_by_last_action(true)
end
