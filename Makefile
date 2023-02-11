token := $(shell gopass hetzner-api)
.SILENT: plan apply datacenters images

plan:
	TF_VAR_hcloud_token="${token}" terraform plan

apply:
	TF_VAR_hcloud_token="${token}" terraform apply

destroy:
	TF_VAR_hcloud_token="${token}" terraform destroy

datacenters:
	curl \
	-H "Authorization: Bearer ${token}" \
	'https://api.hetzner.cloud/v1/datacenters'

images:
	curl \
	-H "Authorization: Bearer ${token}" \
	'https://api.hetzner.cloud/v1/images'

server_types:
	curl \
	-H "Authorization: Bearer ${token}" \
	'https://api.hetzner.cloud/v1/images'
