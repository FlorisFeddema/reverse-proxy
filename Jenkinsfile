pipeline {
  agent any
  environment {
    TAG = VersionNumber(versionNumberString: '${BUILD_YEAR,XX}.${BUILD_MONTH,XX}.${BUILDS_THIS_MONTH}', versionPrefix: 'develop-')
  }
  stages {
    stage('Verify Tools') {
      steps {
        sh 'docker-compose --version'
        sh 'which docker-compose'
        sh 'docker --version'
        sh 'which docker'
      }
    }
    stage('Deploy') {
      when {
        branch 'master'
      }
      steps {
        sh 'echo "version: $TAG"'
        sh 'docker build -t reverse-proxy:$TAG .'
        sh 'docker tag reverse-proxy:$TAG docker.feddema.dev/reverse-proxy:$TAG'
        // sh 'docker login docker.feddema.dev'
        // sh 'docker push docker.feddema.dev/reverse-proxy:$TAG'
        // sh 'docker-compose -p reverseproxy up -d --force-recreate'
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
