# wordpress component¥
wordpress-alb-remote:
	@make remote-enable ENV=${ENV} COMPONENT=wordpress-alb

wordpress-alb-create:
	@make create-env ENV=${ENV} COMPONENT=wordpress-alb

wordpress-alb-plan:
	@make plan ENV=${ENV} COMPONENT=wordpress-alb

wordpress-alb-apply:
	@make apply ENV=${ENV} COMPONENT=wordpress-alb

wordpress-alb-destroy:
	@make destroy ENV=${ENV} COMPONENT=wordpress-alb
