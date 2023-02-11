token := $(shell gopass hetzner-api)
.SILENT: plan apply destroy datacenters images server_types

pipenv:
	pipenv install

plan:
	TF_VAR_hcloud_token="${token}" terraform plan

apply: pipenv
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
