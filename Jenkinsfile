pipeline {
  agent any
  stages {
    stage ("Hello world") {
      steps {
        echo "hello world!"

      }
    }

    stage ("Clean up / initialise") {
      steps {
        // 1) Clean up section (containers and/or images)
        echo "Removing existing containers and images"
        sh 'docker rm -f $(docker ps -aq) || true' // removes all containers by force
        sh 'docker rmi -f $(docker images -q) || true' // removes all images by force
        sh 'docker network rm new-network || true'
        sh 'docker network create new-network' 
      }
    }

    stage ("Build images") {
      steps {
        // 2) Build images ( flaskapp)

        echo "Building flask app"
        sh 'docker build --build-arg PYTHON_VERSION=3.12-slim --build-arg AUTHOR="Josh" -t flask-app .'
      }
    }

    stage ("Deploy flask container") {
      steps {
        // 3) run flaskapp container

        echo "Running flask app"
        sh 'docker run -d --network new-network --name flask-app flask-app'
      }
    }

    stage ("Deploy nginx container") {
      steps {
        // 5) run nginx container with bind mount for conf.

        echo "Running nginx reverse proxy"
        sh 'docker run -d -p 80:80 --network new-network --mount type=bind,source=$WORKSPACE/nginx.conf,target=/etc/nginx/nginx.conf --name nginx nginx'


      }
    }
  }
}
