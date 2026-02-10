[
    {
        "Name": "nebula-network",
        "Id": "e25f2dee22821f314991d7c5dc18907f15276b4750ea7b0957dbade1813ddebd",
        "Created": "2026-02-06T20:30:58.658177295Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Options": {},
        "Labels": {},
        "Containers": {
            "3426e4a117acea0d21c36f9d55adfaa010a9b5703676c166b581dc10684de6bb": {
                "Name": "wordpress-db",
                "EndpointID": "da58fdddddb90b93f885db7382562dde695d8cb087f366d6855999dbe0c453a6",
                "MacAddress": "d6:a6:4f:a7:cb:28",
                "IPv4Address": "172.18.0.5/16",
                "IPv6Address": ""
            },
            "345ce79ae9fa5a0fd70fec628ef22483bdea3e21a359f91e6d89987e1b0cd1ca": {
                "Name": "wordpress-app",
                "EndpointID": "4d0a0bcdfca86f7913d831a8e58cfcf82c64e934d863ae4a9ee0ad180c0e402a",
                "MacAddress": "7a:72:a8:c8:19:23",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "59432df32e54660ff40d63db6aefa8e359704dc19ec218e494df2ae31a583d44": {
                "Name": "nebula-proxy",
                "EndpointID": "3787fbfdfdfb28fbf7d9a6b6d01a85bd68f0efb094115335f9bf0899558d7200",
                "MacAddress": "aa:b5:39:e8:ed:cf",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            },
            "6d912d312f637a5d3932ba30bb87c5ecfb3065e534d8945eccce15e67779e063": {
                "Name": "python-app",
                "EndpointID": "d989d2358fe8489a65119593d03f609a461bd7e45747da656eac0fd4110fc6e1",
                "MacAddress": "f2:df:0e:b2:34:ae",
                "IPv4Address": "172.18.0.6/16",
                "IPv6Address": ""
            },
            "9168eaeccc65dbb5e2f462b0a987d9b19b167e94bc064469908143d1a941262c": {
                "Name": "nebula-static",
                "EndpointID": "b095a78e34d467e04607a4b99d223ff44a39806b6eb66fdc27c3db41adcf7e2b",
                "MacAddress": "ea:2d:54:36:73:19",
                "IPv4Address": "172.18.0.4/16",
                "IPv6Address": ""
            },
            "98f50cb8341b2bf496476ec7fc44619b394487d7e7c724d25e112e1aefda2b63": {
                "Name": "nebula-monitor",
                "EndpointID": "c9917c7a84c85f739a13237b1af3cb9141f574e4323f36143fe721c15e1f800b",
                "MacAddress": "22:97:73:52:cc:b4",
                "IPv4Address": "172.18.0.7/16",
                "IPv6Address": ""
            }
        },
        "Status": {
            "IPAM": {
                "Subnets": {
                    "172.18.0.0/16": {
                        "IPsInUse": 9,
                        "DynamicIPsAvailable": 65527
                    }
                }
            }
        }
    }
]


# explicacion
La red aislada nebula-network fue inspeccionada mediante docker network inspect, confirmando que todos los contenedores comparten el mismo segmento 172.18.0.0/16 mientras mantienen IPs únicas. El proxy inverso (172.18.0.2) actúa como único punto de entrada, demostrando el aislamiento de red y la comunicación interna segura entre servicios.

## Inspección de red Docker: `nebula-network`

### Información general
- **Nombre:** nebula-network  
- **ID:** e25f2dee22821f314991d7c5dc18907f15276b4750ea7b0957dbade1813ddebd  
- **Fecha de creación:** 2026-02-06 20:30:58 UTC  
- **Scope:** local  
- **Driver:** bridge  
- **IPv4 habilitado:** Sí  
- **IPv6 habilitado:** No  
- **Red interna:** No  
- **Attachable:** No  
- **Ingress:** No  

### Configuración IPAM
- **Driver:** default  
- **Subred:** 172.18.0.0/16  
- **Gateway:** 172.18.0.1  

### Contenedores conectados

| Contenedor         | IPv4            | MAC Address         |
|--------------------|-----------------|---------------------|
| nebula-proxy       | 172.18.0.2/16   | aa:b5:39:e8:ed:cf  |
| wordpress-app      | 172.18.0.3/16   | 7a:72:a8:c8:19:23  |
| nebula-static      | 172.18.0.4/16   | ea:2d:54:36:73:19  |
| wordpress-db       | 172.18.0.5/16   | d6:a6:4f:a7:cb:28  |
| python-app         | 172.18.0.6/16   | f2:df:0e:b2:34:ae  |
| nebula-monitor     | 172.18.0.7/16   | 22:97:73:52:cc:b4  |

### Estado de la red
- **IPs en uso:** 9  
- **IPs dinámicas disponibles:** 65 527  
