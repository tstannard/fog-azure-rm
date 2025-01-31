module Fog
  module Network
    class AzureRM
      # Real class for Network Request
      class Real
        def attach_route_table_to_subnet(resource_group, subnet_name, virtual_network_name, address_prefix, network_security_group_id, route_table_id)
          msg = "Attaching Route Table to Subnet: #{subnet_name}"
          Fog::Logger.debug msg
          subnet = get_subnet_object_for_attach_route_table(address_prefix, network_security_group_id, route_table_id)
          begin
            subnet_obj = @network_client.subnets.create_or_update(resource_group, virtual_network_name, subnet_name, subnet)
          rescue MsRestAzure::AzureOperationError => e
            raise_azure_exception(e, msg)
          end
          Fog::Logger.debug 'Route Table attached to Subnet #{subnet_name} successfully.'
          subnet_obj
        end

        private

        def get_subnet_object_for_attach_route_table(address_prefix, network_security_group_id, route_table_id)
          subnet = Azure::Network::Mgmt::V2020_05_01::Models::Subnet.new
          network_security_group = Azure::Network::Mgmt::V2020_05_01::Models::NetworkSecurityGroup.new
          route_table = Azure::Network::Mgmt::V2020_05_01::Models::RouteTable.new

          network_security_group.id = network_security_group_id
          route_table.id = route_table_id

          subnet.address_prefix = address_prefix
          subnet.network_security_group = network_security_group unless network_security_group_id.nil?
          subnet.route_table = route_table
          subnet
        end
      end

      # Mock class for Network Request
      class Mock
        def attach_route_table_to_subnet(*)
          subnet = {
            'id' => '/subscriptions/########-####-####-####-############/resourceGroups/fog-rg/providers/Microsoft.Network/virtualNetworks/fog-vnet/subnets/fog-subnet',
            'properties' =>
              {
                'addressPrefix' => '10.1.0.0/24',
                'routeTable' => {
                  'id' => '/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/myRT1'
                },
                'provisioningState' => 'Succeeded'
              },
            'name' => 'fog-subnet'
          }
          subnet_mapper = Azure::Network::Mgmt::V2020_05_01::Models::Subnet.mapper
          @network_client.deserialize(subnet_mapper, subnet)
        end
      end
    end
  end
end
