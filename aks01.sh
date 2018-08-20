#!/bin/bash
az group create --name 1myResourceGroup --location southeastasia
az aks create --resource-group 1myResourceGroup --name myK8sCluster --node-count 1 --generate-ssh-keys
az aks install-cli
az aks get-credentials --resource-group 1myResourceGroup --name myK8sCluster
kubectl get nodes
# file location : https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
kubectl create -f https://raw.githubusercontent.com/fuju9w/labs/master/azure-vote.yaml 
#kubectl apply -f https://raw.githubusercontent.com/fuju9w/labs/master/azure-vote.yaml 
kubectl get service azure-vote-front --watch
az aks browse --resource-group 1myResourceGroup --name myAKSCluster

#https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-cluster
az aks show --resource-group 1myResourceGroup --name myAKSCluster --query "servicePrincipalProfile.clientId" --output tsv

#az group delete --name 1myResourceGroup --yes --no-wait
