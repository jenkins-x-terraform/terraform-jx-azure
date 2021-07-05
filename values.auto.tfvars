jx_git_url = "https://github.com/spring-financial-group/JX3_Azure_Vault_Dev_Cluster"
cluster_name = "jx3-mqube-build"
location="uksouth"
network_resource_group_name="mqubejx3build-network_rsg"
cluster_resource_group_name="mqubejx3build-cluster_rsg"
cluster_node_resource_group_name="jx3build-cluster-nodes-rsg"
network_name="jx3-build-networks"
apex_domain_integration_enabled=true
apex_domain="mqube.build"
subdomain="jx"
apex_resource_group_name="jx3build-apex-dns-rsg"
dns_resource_group_name="jx3build-dns-rsg"
key_vault_enabled=false
key_vault_resource_group_name="jx3key-vault-rsg"
key_vault_name="k8secrets-vault"

# Machines
min_node_count=10
max_node_count=30
node_size="Standard_D4s_v3"
min_ml_node_count=2
max_ml_node_count=5
ml_node_size="Standard_NV24s_v3"

# Bot stuff in now in terraform

# External registry not used at the moment
external_registry_url = ""
