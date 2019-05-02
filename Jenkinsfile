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
        sh 'cp docker-compose.yml /home/floris/dev/reverseproxy/docker-compose.yml'
        sh 'cd /home/floris/dev/reverseproxy/'
        sh 'docker-compose down -p reverseproxy'
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
