#!/usr/bin/env groovy
// Liquibase declarative pipeline
//
//
pipeline {
agent any
  environment {
    PATH="/root/liquibase:$PATH"
    ENVIRONMENT_STEP="${params.'Pipeline Step'}"
  }
  stages {

    stage ('Precheck liquibase version') {
		steps {
			sh '''
        		liquibase --version
			'''
		} // steps
	} // stage 'precheck'
  
  stage ('running liquibase') {
      steps {
        sh '''	
	# Setting environment variables on the server side for the dev environment
	. ~/env_var/exp_lb_env_vars_postgresql_${ENVIRONMENT_STEP}.sh &>/dev/null
	
	# Running Quality Checks
	liquibase checks run
	# Checking pending changes
	echo Checking pending changes
	liquibase status --verbose
	# Applying the changes and testing for any issues
	echo Applying the changes and testing for any issues
	liquibase --logLevel=info --logFile=LB_${BUILD_NUMBER}_${BUILD_ID}.log update
	# Rolling back changes to tag to validate rollbacks
	echo Rolling back changes to validate rollbacks
	liquibase rollbackOneUpdate --force
	# Applying the changes to the database
	echo Applying the changes to the database
	liquibase update
	# Showing deployment history
	echo Showing deployment history
	liquibase history
	
	# Running drift detection in the pipeline
	echo Running drift detection in the pipeline
	liquibase diff
          '''
      }
    } 
    
  } // stages
}  // pipeline
