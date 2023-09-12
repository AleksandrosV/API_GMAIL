pipeline {
  agent any

  stages {
    stage ('Test') {
      steps {
        sh 'bundle install'
        
        sh 'bundle exec rake spec'

        publishHTML (target : [
          allowMissing: false,
          alwaysLinkToLastBuild: true,
          keepAll: true,
          reportDir: 'reports',
          reportFiles: 'rspec_results.html',
          reportName: 'HTML Report',
          reportTitles: '',
          useWrapperFileDirectly: true])
      }
    }
  }
}