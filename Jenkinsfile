pipeline {
  agent any

  stages {
    stage ('Test') {
      steps {
        sh 'bundle install'
        sh 'bundle update --bundler'
        
        sh 'bundle exec rake all'
      }
    }
  }
}