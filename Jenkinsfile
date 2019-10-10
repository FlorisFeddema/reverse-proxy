pipeline {
  agent any
  environment {
    TAG = VersionNumber(versionNumberString: '${BUILD_DATE_FORMATTED,"yy"}.${BUILDS_THIS_YEAR}', versionPrefix: 'develop-')
  }
  stages {
    stage('Verify Tools') {
      steps {
        sh 'docker-compose --version'
        sh 'which docker-compose'
      }
    }
    stage('Deploy') {
      steps {
        sh 'echo "$TAG"'
        sh 'docker-compose -p reverseproxy up -d --force-recreate --build'
      }
    }
  }
  post {
    always {
      cleanWs()

    }

  }
  options {
    disableConcurrentBuilds()
    timeout(time: 10, unit: 'MINUTES')
  }
}
