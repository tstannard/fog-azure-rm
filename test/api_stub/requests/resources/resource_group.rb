module ApiStub
  module Requests
    module Resources
      # Mock class for Resource Group Requests
      class ResourceGroup
        def self.create_resource_group_response(client)
          body = '{
            "id": "/subscriptions/########-####-####-####-############/resourceGroups/fog-test-rg",
            "name": "fog-test-rg",
            "location": "westus",
            "tags": {
              "tagkey1": "tagvalue1"
            },
            "properties": {
              "provisioning_state": "Succeeded"
            }
          }'
          result_mapper = Azure::Resources::Mgmt::V2020_06_01::Models::ResourceGroup.mapper
          client.deserialize(result_mapper, Fog::JSON.decode(body))
        end

        def self.list_resource_group_response(client)
          body = '{
            "value": [ {
              "id": "/subscriptions/########-####-####-####-############/resourceGroups/fog-test-rg",
              "name": "fog-test-rg",
              "location": "westus",
              "tags": {
                "tagname1": "tagvalue1"
              },
              "properties": {
                "provisioning_state": "Succeeded"
              }
            } ],
            "nextLink": "https://management.azure.com/subscriptions/########-####-####-####-############/resourcegroups?api-version=2015-01-01&$skiptoken=######"
          }'
          result_mapper = Azure::Resources::Mgmt::V2020_06_01::Models::ResourceGroupListResult.mapper
          client.deserialize(result_mapper, Fog::JSON.decode(body))
        end

        def self.list_resource_groups_for_zones
          resource_group = ::Azure::Resources::Mgmt::V2020_06_01::Models::ResourceGroup.new
          resource_group.id = '/subscriptions/########-####-####-####-############/resourceGroups/fog-test-resource-group'
          resource_group.name = 'fog-test-resource-group'
          resource_group.location = 'West US'
          [resource_group]
        end
      end
    end
  end
end
