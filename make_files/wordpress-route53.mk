# wordpress component¥
wordpress-route53-remote:
	@make remote-enable ENV=${ENV} COMPONENT=wordpress-route53

wordpress-route53-create:
	@make create-env ENV=${ENV} COMPONENT=wordpress-route53

wordpress-route53-plan:
	@make plan ENV=${ENV} COMPONENT=wordpress-route53

wordpress-route53-apply:
	@make apply ENV=${ENV} COMPONENT=wordpress-route53

wordpress-route53-destroy:
	@make destroy ENV=${ENV} COMPONENT=wordpress-route53
