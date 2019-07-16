# variables
ENV := $1
BUCKET_NAME := aws-infra-tfstate
PROFILE_NAME := ${ENV}
ENV_VARS := ${ENV}.tfvars
VARS := -var-file=${ENV_VARS}
WORKSPACE := ${ENV}

# options
ifdef MODULE
	VARS := ${VARS} -var-file=${MODULE}.tfvars
	WORKSPACE := ${WORKSPACE}-${MODULE}
endif

# commands
CD := cd terraform/components/${COMPONENT}
CREATE_ENV := terraform workspace new ${WORKSPACE}
SELECT_WS := terraform workspace select ${WORKSPACE}
REMOTE_ENABLE := terraform init -input=true -reconfigure \
		-backend-config "bucket=${BUCKET_NAME}" \
		-backend-config "profile=${PROFILE_NAME}"
PLAN := terraform plan ${VARS}
APPLY := terraform apply ${VARS}
DESTROY := terraform destroy ${VARS}


#------------------------------
# base rule
#------------------------------
create-env:
	@${CD} && ${CREATE_ENV}

remote-enable:
	@${CD} && ${REMOTE_ENABLE}

plan:
	@${CD} && ${SELECT_WS} && ${PLAN}

apply:
	@${CD} && ${SELECT_WS} && ${APPLY}

destroy:
	@${CD} && ${SELECT_WS} && ${DESTROY}

#------------------------------
# wordpress component
#------------------------------
include ./make_files/wordpress.mk

#------------------------------
# wordpress-alb component
#------------------------------
include ./make_files/wordpress-alb.mk

#------------------------------
# wordpress-ssl component
#------------------------------
include ./make_files/wordpress-ssl.mk

#------------------------------
# wordpress-ssl component
#------------------------------
include ./make_files/wordpress-route53.mk

#------------------------------
# network component
#------------------------------
include ./make_files/network.mk