# wordpress component¥
wordpress-ssl-remote:
	@make remote-enable ENV=${ENV} COMPONENT=wordpress-ssl

wordpress-ssl-create:
	@make create-env ENV=${ENV} COMPONENT=wordpress-ssl

wordpress-ssl-plan:
	@make plan ENV=${ENV} COMPONENT=wordpress-ssl

wordpress-ssl-apply:
	@make apply ENV=${ENV} COMPONENT=wordpress-ssl

wordpress-ssl-destroy:
	@make destroy ENV=${ENV} COMPONENT=wordpress-ssl
