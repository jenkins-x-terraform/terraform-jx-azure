jx_git_url = "https://github.com/spring-financial-group/jx3-azure-akv-Dev-Build-KeyVault"
cluster_name = "jx3-mqube-dev-build"
location="uksouth"
network_resource_group_name="mqubejx3dev-network_rsg"
cluster_resource_group_name="mqubejx3dev-cluster_rsg"
cluster_node_resource_group_name="jx3dev-cluster-nodes-rsg"
network_name="jx3dev-networks"
apex_domain_integration_enabled=true
apex_domain="mqube.build"
subdomain="dev"
apex_resource_group_name="jx3build-apex-dns-rsg"
dns_resource_group_name="jx3build-dns-rsg"
key_vault_enabled=false
key_vault_resource_group_name="jx3key-vault-rsg"
key_vault_name="k8secrets-vault"

# Machines
min_node_count=5
max_node_count=20
node_size="Standard_D4s_v3"
min_ml_node_count=0
max_ml_node_count=3
ml_node_size="Standard_NV24s_v3"

# Bot stuff in now in terraform

# External registry not used at the moment
external_registry_url = ""
