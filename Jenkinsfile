pipeline {
  agent {
    label 'docker-builder'
  }
  stages {
    stage('Build test push') {
      steps {
        container('docker-build') {
          script {
            ansiColor('xterm') {
              withCredentials([usernamePassword(credentialsId: 'google-container-repo-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                sh '''
                  docker login -u "$USER" -p "$(echo "$PASS")" https://us.gcr.io
                  docker build -t us.gcr.io/mautic-ma/mega-fronted:master .
                  docker push us.gcr.io/mautic-ma/mega-fronted:master
                  DOCKER_TAG2="$(date +%Y%m%d%M)-$(git log --pretty=format:'%h' -n 1 "$DIR")"
                  docker tag us.gcr.io/mautic-ma/mega-fronted:master "$DOCKER_TAG2"
                  docker push "$DOCKER_TAG2"
                '''
              }
            }
          }
        }
      }
    }
  }
}
