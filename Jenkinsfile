node {
    def app;

    stage('Clone Repository') {
        checkout scm;
    }

    stage('Build Image') {
        app = docker.build("soundofdarkness/depot_tools")
    }

    stage('Test Image') {
        app.inside {
            sh 'gclient'
        }
    }

    stage('Push Image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-soundofdarkness') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}