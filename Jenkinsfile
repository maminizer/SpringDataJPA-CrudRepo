pipeline {
    agent any
    parameters {
        string(name: 'branch', defaultValue: 'main', description: 'Branch')
    }
    stages {
        stage( "Checkout GIT") {
            steps {
                cleanWs()
                echo 'Pulling...';
                    git branch: '$branch',
                    url: 'https://github.com/MariemGlaa/SpringDataJPA-CrudRepo.git'
                    cleanWs()
            }
        }
            
        }
    }
}
