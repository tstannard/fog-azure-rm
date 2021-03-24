module Fog
  module Resources
    class AzureRM
      # This class provides the actual implementation for service calls.
      class Real
        def list_resource_groups
          msg = 'Listing Resource Groups'
          Fog::Logger.debug msg
          begin
            resource_groups = @rmc.resource_groups.list_as_lazy
          rescue  MsRestAzure::AzureOperationError => e
            raise_azure_exception(e, msg)
          end
          resource_groups.next_link = '' if resource_groups.next_link.nil?
          Fog::Logger.debug 'Resource Groups listed successfully'
          resource_groups.value
        end
      end

      # This class provides the mock implementation for unit tests.
      class Mock
        def list_resource_groups
          resource_groups = {
            'value' => [
              {
                'location' => 'westus',
                'id' => '/subscriptions/########-####-####-####-############/resourceGroups/Fog_test_rg',
                'name' => 'Fog_test_rg',
                'properties' =>
                {
                  'provisioningState' => 'Succeeded'
                }
              },
              {
                'location' => 'westus',
                'id' => '/subscriptions/########-####-####-####-############/resourceGroups/Fog_test_rg1',
                'name' => 'Fog_test_rg1',
                'properties' =>
                {
                  'provisioningState' => 'Succeeded'
                }
              }
            ]
          }
          result_mapper = Azure::Resources::Mgmt::V2020_06_01::Models::ResourceGroupListResult.mapper
          @rmc.deserialize(result_mapper, resource_groups).value
        end
      end
    end
  end
end
