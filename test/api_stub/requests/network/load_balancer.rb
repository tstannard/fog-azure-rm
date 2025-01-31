module ApiStub
  module Requests
    module Network
      class LoadBalancer
        def self.create_load_balancer_response(network_client)
          response = '{
            "name":"mylb1",
            "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1",
            "location":"North US",
            "tags":{
              "key":"value"
            },
            "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
            "properties":{
              "resourceGuid":"6ECBD4C1-0DC1-4D86-9F6E-4A58F83C9023",
              "provisioningState":"Succeeded",
              "frontendIPConfigurations":[
                {
                  "name":"myip1",
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/frontendIPConfigurations/myip1",
                  "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties":{
                    "provisioningState":"Succeeded",
                    "subnet":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
                    },
                    "privateIPAddress":"10.0.0.10",
                    "privateIPAllocationMethod":"Static",
                    "publicIPAddress":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPAddresses/myip1"
                    },
                    "loadBalancingRules":[
                      {
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
                      }
                    ],
                    "inboundNatRules":[
                      {
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/rule1"
                      }
                    ]
                  }
                }
              ],
              "backendAddressPools":[
                {
                  "name":"pool1",
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/backendAddressPools/pool1",
                  "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties":{
                    "provisioningState":"Succeeded",
                    "backendIPConfigurations":[
                      {
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"
                      }
                    ],
                    "loadBalancingRules":[
                      {
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
                      }
                    ]
                  }
                }
              ],
              "loadBalancingRules":[
                {
                  "name":"HTTP Traffic",
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/loadBalancingRules/rule1",
                  "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties":{
                    "provisioningState":"Succeeded",
                    "frontendIPConfiguration":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                    },
                    "backendAddressPool":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/backendAddressPool/pool1"
                    },
                    "protocol":"Tcp",
                    "frontendPort":80,
                    "backendPort":8080,
                    "probe":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/probe1"
                    },
                    "enableFloatingIP":true,
                    "idleTimeoutInMinutes":4,
                    "loadDistribution":"Default"
                  }
                }
              ],
              "probes":[
                {
                  "name":"my probe 1",
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/my probe 1",
                  "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties":{
                    "provisioningState":"Succeeded",
                    "protocol":"Tcp",
                    "port":8080,
                    "requestPath":"myprobeapp1/myprobe1.svc",
                    "intervalInSeconds":5,
                    "numberOfProbes":16,
                    "loadBalancingRules":[
                      {
                        "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
                      }
                    ]
                  }
                }
              ],
              "inboundNatRules":[
                {
                  "name":"RDP Traffic",
                  "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDP Traffic",
                  "etag":"W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties":{
                    "provisioningState":"Succeeded",
                    "frontendIPConfiguration":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                    },
                    "backendIPConfiguration":{
                      "id":"/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"
                    },
                    "protocol":"Tcp",
                    "frontendPort":3389,
                    "backendPort":3389
                  }
                }
              ],
              "inboundNatPools":[
                {
                  "name": "RDPForVMSS1",
                  "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers /Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDPForVMSS1",
                  "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                  "properties": {
                    "provisioningState": "Updating|Deleting|Failed|Succeeded",
                    "frontendIPConfiguration": {
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                    },
                    "protocol": "Tcp",
                    "frontendPortRangeStart": 50000,
                    "frontendPortRangeEnd": 50500,
                    "backendPort": 3389
                  }
                }
              ]
            }
          }'
          load_balancer_mapper = Azure::Network::Mgmt::V2020_05_01::Models::LoadBalancer.mapper
          network_client.deserialize(load_balancer_mapper, Fog::JSON.decode(response))
        end

        def self.list_load_balancers_response(network_client)
          response = '{
	          "value": [
              {
		            "name": "mylb1",
		            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1",
		            "location": "North US",
		            "tags": {
			            "key": "value"
		            },
		            "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
		            "properties": {
			            "resourceGuid": "6ECBD4C1-0DC1-4D86-9F6E-4A58F83C9023",
			            "provisioningState": "Succeeded",
			            "frontendIPConfigurations": [
                    {
				              "name": "myip1",
				              "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/frontendIPConfigurations/myip1",
				              "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
				              "properties": {
					              "provisioningState": "Succeeded",
					              "subnet": {
						              "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
					              },
					              "privateIPAddress": "10.0.0.10",
					              "privateIPAllocationMethod": "Static",
					              "publicIPAddress": {
  						            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPAddresses/myip1"
  					            },
  					            "loadBalancingRules": [
                          {
  						              "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
  					              }
                        ],
  					            "inboundNatRules": [
                          {
  						              "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/rule1"
  					              }
                        ]
  				            }
  			            }
                  ],
                  "backendAddressPools": [
                    {
                      "name": "pool1",
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/backendAddressPools/pool1",
                      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                      "properties": {
                        "provisioningState": "Succeeded",
                        "backendIPConfigurations": [
                          {
                            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"
                          }
                        ],
                        "loadBalancingRules": [
                          {
                            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
                          }
                        ]
                      }
                    }
                  ],
                  "loadBalancingRules": [
                    {
                      "name": "HTTP Traffic",
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/mylb1/loadBalancingRules/rule1",
                      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                      "properties": {
                        "provisioningState": "Succeeded",
                        "frontendIPConfiguration": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                        },
                        "backendAddressPool": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/backendAddressPool/pool1"
                        },
                        "protocol": "Tcp",
                        "frontendPort": 80,
                        "backendPort": 8080,
                        "probe": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/probe1"
                        },
                        "enableFloatingIP": true,
                        "idleTimeoutInMinutes": 4,
                        "loadDistribution": "Default"
                      }
                    }
                  ],
                  "probes": [
                    {
                      "name": "my probe 1",
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/my probe 1",
                      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                      "properties": {
                        "provisioningState": "Succeeded",
                        "protocol": "Tcp",
                        "port": 8080,
                        "requestPath": "myprobeapp1/myprobe1.svc",
                        "intervalInSeconds": 5,
                        "numberOfProbes": 16,
                        "loadBalancingRules": [
                          {
                            "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/loadBalancingRules/rule1"
                          }
                        ]
                      }
                    }
                  ],
                  "inboundNatRules": [
                    {
                      "name": "RDP Traffic",
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDP Traffic",
                      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                      "properties": {
                        "provisioningState": "Succeeded",
                        "frontendIPConfiguration": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                        },
                        "backendIPConfiguration": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/vm1nic1/ipConfigurations/ip1"
                        },
                        "protocol": "Tcp",
                        "frontendPort": 3389,
                        "backendPort": 3389
                      }
                    }
                  ],
                  "inboundNatPools": [
                    {
                      "name": "RDPForVMSS1",
                      "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers /Microsoft.Network/loadBalancers/myLB1/inboundNatRules/RDPForVMSS1",
                      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",
                      "properties": {
                        "provisioningState": "Updating|Deleting|Failed|Succeeded",
                        "frontendIPConfiguration": {
                          "id": "/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/frontendIPConfigurations/ip1"
                        },
                        "protocol": "Tcp",
                        "frontendPortRangeStart": 50000,
                        "frontendPortRangeEnd": 50500,
                        "backendPort": 3389
                      }
                    }
                  ]
                }
              }
            ]
          }'
          load_balancer_mapper = Azure::Network::Mgmt::V2020_05_01::Models::LoadBalancerListResult.mapper
          network_client.deserialize(load_balancer_mapper, Fog::JSON.decode(response))
        end

        def self.delete_load_balancer_response
          MsRestAzure::AzureOperationResponse.new(MsRest::HttpOperationRequest.new('', '', ''), Faraday::Response.new)
        end

        def self.frontend_ip_config
          fic =
            [
              {
                name: 'fic',
                private_ipallocation_method: 'Dynamic',
                public_ipaddress_id: '/subscriptions/{guid}/resourcegroups/fogRM-rg/providers/Microsoft.Network/publicIPAddresses/pip',
                subnet_id: '/subscriptions/{guid}/resourcegroups/fogRM-rg/providers/Microsoft.Network/virtualNetworks/vnet/subnets/sb1'
              }
            ]
          fic
        end

        def self.backend_address_pool
          bap =
            %w(pool1 pool2)
          bap
        end

        def self.probe
          prb =
            [
              {
                name: 'probe1',
                protocol: 'Tcp',
                port: 8080,
                request_path: 'myprobeapp1/myprobe1.svc',
                interval_in_seconds: 5,
                number_of_probes: 16
              }
            ]
          prb
        end

        def self.load_balancing_rule
          lbr =
            [
              {
                name: 'lb_rule_1',
                frontend_ip_configuration_id: '/subscriptions/{guid}/resourceGroups/fogRM-rg/providers/Microsoft.Network/loadBalancers/lb/frontendIPConfigurations/fic',
                backend_address_pool_id: '/subscriptions/{guid}/resourceGroups/fogRM-rg/providers/Microsoft.Network/loadBalancers/lb/backendAddressPools/pool1',
                protocol: 'Tcp',
                probe_id: '/subscriptions/{guid}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/loadBalancers/myLB1/probes/probe1',
                frontend_port: '80',
                backend_port: '8080',
                enable_floating_ip: false,
                idle_timeout_in_minutes: 4,
                load_distribution: 'Default'
              }
            ]
          lbr
        end

        def self.inbound_nat_rule
          inr = [
            {
              name: 'RDP-Traffic',
              frontend_ip_configuration_id: '/subscriptions/{guid}/resourceGroups/fogRM-rg/providers/Microsoft.Network/loadBalancers/lb/frontendIPConfigurations/fic',
              protocol: 'Tcp',
              frontend_port: 3389,
              backend_port: 3389
            }
          ]
          inr
        end

        def self.inbound_nat_pool
          inp = [
            {
              name: 'RDPForVMSS1',
              protocol: 'Tcp',
              frontend_port_range_start: 500,
              frontend_port_range_end: 505,
              backend_port: 3389
            }
          ]
          inp
        end
      end
    end
  end
end
