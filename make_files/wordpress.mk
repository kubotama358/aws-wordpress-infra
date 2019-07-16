# wordpress component¥
wordpress-remote:
	@make remote-enable ENV=${ENV} COMPONENT=wordpress

wordpress-create:
	@make create-env ENV=${ENV} COMPONENT=wordpress

wordpress-plan:
	@make plan ENV=${ENV} COMPONENT=wordpress

wordpress-apply:
	@make apply ENV=${ENV} COMPONENT=wordpress

wordpress-destroy:
	@make destroy ENV=${ENV} COMPONENT=wordpress
