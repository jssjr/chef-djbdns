action :add do
  data = new_resource.data
  tag = new_resource.tag
  cwd = new_resource.cwd ? new_resource.cwd : "#{node['djbdns']['tinydns_internal_dir']}/root"

  dns_data = IO.readlines("#{cwd}/data").delete_if{|l| l =~ /^#{data}$/}
  dns_data.push("#{data}\n")
  ::File.write("#{cwd}/data", dns_data.join(""))

  new_resource.updated_by_last_action(true)
end
