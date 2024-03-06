apply:
	terraform init
	terraform apply -auto-approve
destroy:
	terraform destroy -auto-approve -var-file=input.tfvars
