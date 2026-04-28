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
        docker rm -f $(docker ps -a -q) // removes all containers by force
        docker rmi -f $(docker images -q) // removes all images by force
        docker network rm new-network
        docker network create new-netowrk 
      }
    }

    stage ("Build images") {
      steps {
        // 2) Build images ( flaskapp)

        echo "Building flask app"
        docker build --build-arg PYTHON_VERSION=3.12-slim --build-arg AUTHOR="Josh" -t flask-app .
      }
    }

    stage ("Deploy flask container") {
      steps {
        // 3) run flaskapp container

        echo "Running flask app"
        docker run -d --network new-network --name flask-app flask-app
      }
    }

    stage ("Deploy nginx container") {
      steps {
        // 5) run nginx container with bind mount for conf.

        echo "Running nginx reverse proxy"
        docker run -d -p 80:80 --network new-network --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf --name nginx nginx


      }
    }
  }
}
