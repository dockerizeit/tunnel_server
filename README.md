# SSH Tunnels for Docker

## Build the image

    docker build -t tunnel_server ssh_host
    docker build -t tunnel_client ssh_client

## Launch the tunnel server in the dockerize.it's tunnels server

    docker run -d --env="SSH_KEY=$(cat file.rsa.pub.pem)" -p :22 -p :8000 tunnel_server

The port mapped to 22 will be TUNNEL_PORT in the tunnel client config. The port mapped to 8000 will be public port on tunnels.dockerize.it.

The dockerize.it tunnels server must open the firewall for all this ports.

Any client could access the tunnel server container via SSH. This container must be isolated to restrict the access to other containers or host networking.

## Launch the tunnel client in the dockerized host

SERVICE_HOST and SERVICE_PORT are the ip address and port of the service to be tunneled.

    docker run -d \
      --env="SSH_KEY=$(cat file.rsa)" \
      --env="TUNNEL_SERVER=172.17.42.1" \
      --env="TUNNEL_PORT=49153" \
      --env="SERVICE_HOST=172.17.42.1" \
      --env="SERVICE_PORT=49155" \
      tunnel_client
