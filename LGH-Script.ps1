### Created by Mark Gabryjelski for ESXi 6.0 ################
### Built with sample vSwitches as an example ###############
### v01 - 2015-06-08 ########################################
### tuned for LGH vSphere 6 Project - 2016-07-18 ############
### Tested on ESXi 5.5.0 u2a ################################



######################################################
##### vss-mngt is only for management / vmotion ######
##### vmnic0, vmnic1 - HP Blades               #######
##### vmnic2, vmnic3 - Dell Blades             #######
######################################################
esxcli network vswitch standard add --vswitch-name=vss-mngt
esxcli network vswitch standard set --mtu=9000 --cdp-status=both --vswitch-name=vss-mngt
esxcli network vswitch standard policy security set --allow-promiscuous=false --allow-mac-change=false --allow-forged-transmits=false --vswitch-name=vss-mngt



######################################################
#### vss-iscsi is used for iSCSI only ###############
#### vmnic2, vmnic3 - HP Blades            ##########
#### vmnic4, vmnic5, vmnic6, vmnic7 - Dell Blades   ##
#### Entire config in this section for VMs ###########
######################################################
esxcli network vswitch standard add --vswitch-name=vss-iscsi
esxcli network vswitch standard set --mtu=9000 --cdp-status=both --vswitch-name=vss-iscsi
esxcli network vswitch standard policy security set --allow-promiscuous=false --allow-mac-change=false --allow-forged-transmits=false --vswitch-name=vss-iscsi


#####################################################
##### Unsure if needed VMK port groups made      #####
######################################################
###esxcli network vswitch standard portgroup add --portgroup-name=vmk-vmotion --vswitch-name=vSwitch0
###esxcli network vswitch standard portgroup set --portgroup-name=vmk-vmotion --vlan-id 307
###esxcli network vswitch standard portgroup policy failover set --portgroup-name=vmk-vmotion --active-uplinks=vmnic1 --standby-uplinks=vmnic0



######################################################
#### vss-vms is used for VMs only ###################
#### vmnic4, vmnic5 - HP Blades             ##########
#### vmnic0, vmnic1 - Dell Blades           ##########
#### Entire config in this section for VMs ###########
######################################################
esxcli network vswitch standard add --vswitch-name=vss-vms
esxcli network vswitch standard set --mtu=9000 --cdp-status=both --vswitch-name=vss-vms
esxcli network vswitch standard policy security set --allow-promiscuous=false --allow-mac-change=true --allow-forged-transmits=true --vswitch-name=vss-vms
######################################################
####  The rest of this section are VM Networks #######
######################################################
esxcli network vswitch standard portgroup add --portgroup-name=10.20.1.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.1.x-tmp --vlan-id 201
esxcli network vswitch standard portgroup add --portgroup-name=10.20.4.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.4.x-tmp --vlan-id 204
esxcli network vswitch standard portgroup add --portgroup-name=10.20.5.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.5.x-tmp --vlan-id 205
esxcli network vswitch standard portgroup add --portgroup-name=10.20.6.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.6.x-tmp --vlan-id 206
esxcli network vswitch standard portgroup add --portgroup-name=10.20.7.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.7.x-tmp --vlan-id 207
esxcli network vswitch standard portgroup add --portgroup-name=10.20.8.x-tmp --vswitch-name=vss-vms
esxcli network vswitch standard portgroup set --portgroup-name=10.20.8.x-tmp --vlan-id 208
