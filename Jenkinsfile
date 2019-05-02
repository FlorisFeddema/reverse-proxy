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
        sh 'cp Dockerfile /home/jenkins/dev/reverseproxy/Dockerfile'
        sh 'cd /home/jenkins/dev/reverseproxy/'
        sh 'docker-compose -p reverseproxy down || true'
        sh 'docker-compose -p reverseproxy up -d'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
