pipeline {
    agent any
    stages {
        stage('Stage Hello') {
            steps {
                echo 'Hello world!' 
            }
        }
    }
}
