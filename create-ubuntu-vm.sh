#!/bin/bash
## for creating list of UbuntuLTS  VM - managed disk by @fujute : no22th\
## az account list-locations --output table
RG=1ResourceGroupVM
VMSKUE=Standard_D2S_v3
VNETE=myVnet
STORAGEE=mystragef
VSUBNETE=mySubnet
VMPrefix=myvmtod
NUMBEROfVM="Please check line #16 for number of VMs"
MYLOCATION="southafricanorth"

az group create --name $RG --location $MYLOCATION
az network vnet create -g $RG -n $VNETE --address-prefix 10.0.0.0/16 \
                            --subnet-name $VSUBNETE --subnet-prefix 10.0.0.0/24

#az vm create --resource-group $RG --name myVM --image UbuntuLTS --admin-username azureuser --generate-ssh-keys

for myi in {1..2}
do
echo "Creating VMs... $myi "
az vm create \
  --resource-group $RG \
  --name $VMPrefix$myi \
  --image UbuntuLTS \
  --size $VMSKUE \
  --admin-username azureuser \
  --vnet-name $VNETE \
  --subnet $VSUBNETE \
  --generate-ssh-keys
done

# 
# az vm start --name {vm name} --resource-group $RG
# az vm stop --name {vm name} --resource-group $RG
# az vm deallocate --name {vm name} --resource-group $RG
