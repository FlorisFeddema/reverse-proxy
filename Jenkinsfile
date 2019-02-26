pipeline {
  agent any
  options {
    disableConcurrentBuilds()
    timeout(time: 10, unit: 'MINUTES')
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
        sh 'docker rm -f reverse_proxy || true'
        sh 'docker rm -f reverse_proxy_master_reverseproxy_1 || true'
        sh 'docker-compose up -d --force-recreate'
        sh 'cp docker-complse.yml /home/floris/dev/docker-compose.yml'
      }
    }

  }
  post {
    always {
      cleanWs()
    }
  }
}
