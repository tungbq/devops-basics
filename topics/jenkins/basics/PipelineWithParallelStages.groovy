pipeline {
    agent any
    stages {
        stage('ParallelStage1') {
            steps {
                // Print a message
                echo "This is ParallelStage1"
            }
        }
        stage('ParallelStage2') {
            steps {
                // Print a message
                echo "This is ParallelStage2"
            }
        }
    }
    parallel {
        // Run the ParallelStage1 and ParallelStage2 stages in parallel
        stage 'ParallelStage1'
        stage 'ParallelStage2'
    }
}
