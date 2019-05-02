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
        sh 'cp docker-compose.yml /home/jenkins/dev/reverseproxy/docker-compose.yml'
        sh 'cd /home/jenkins/dev/reverseproxy/'
        sh 'docker-compose down -p reverseproxy || true'
        sh 'docker-compose up -p reverseproxy -d'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
