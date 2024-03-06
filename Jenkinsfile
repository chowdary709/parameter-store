pipeline {
    agent {
        label 'workstation'
    }
    options {
        ansiColor('xterm')
    }
    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Select whether to apply or destroy Terraform configurations.'
        )
    }
    stages {
        stage('Terraform Operation') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        sh 'make apply'
                    } else if (params.ACTION == 'destroy') {
                        sh 'make destroy'
                    } else {
                        error "Invalid action selected: ${params.ACTION}"
                    }
                }
            }
        }
    }
}
