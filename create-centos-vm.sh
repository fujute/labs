#!/bin/bash
## for creating list of CentOS VM - unmagaged disk 
RG=ResourceGroupVM
VMSKUE=Standard_D2S_v3
VNETE=myVnet
STORAGEE=mystragef
VSUBNETE=mySubnet
VMPrefix=myvmtod
NUMBEROfVM="Please check in you for loop"

az group create --name $RG --location southeastasia
az storage account create -n $STORAGEE -g $RG -l southeastasia --sku Standard_LRS
az network vnet create -g $RG -n $VNETE --address-prefix 10.0.0.0/16 \
                            --subnet-name $VSUBNETE --subnet-prefix 10.0.0.0/24

for myi in {1..3}
do
echo "Creating VMs... $myi "
az vm create \
  --resource-group $RG \
  --name $VMPrefix$myi \
  --image CentOS \
  --size $VMSKUE \
  --admin-username azureuser \
  --vnet-name $VNETE \
  --subnet $VSUBNETE \
  --use-unmanaged-disk \
  --storage-account $STORAGEE \
  --generate-ssh-keys
done
