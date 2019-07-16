# network component¥
network-remote:
	@make remote-enable ENV=${ENV} COMPONENT=network

network-create:
	@make create-env ENV=${ENV} COMPONENT=network

network-plan:
	@make plan ENV=${ENV} COMPONENT=network

network-apply:
	@make apply ENV=${ENV} COMPONENT=network

network-destroy:
	@make destroy ENV=${ENV} COMPONENT=network
