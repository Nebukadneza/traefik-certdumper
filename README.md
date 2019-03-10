# Single-domain traefik-certdumper for mailu

This is based on the work by Ludovic Fernandez on https://github.com/ldez/traefik-certs-dumper

# What does it do

This wrapper around the excellent certs-dumper allows to extract certificates
from traefiks acme.json once when they changed, and optionally (using
`SCRIPT`), execute a command to make some outside service aware of the change.
This can be useful if the certificates acquired by traefik are required
elsewhere, for example for non-HTTPS protocols.

```
  certdumper:
    restart: always
    image: nebukadneza/traefik-certdumper:latest
    environment:
      - DOMAIN=mail.your.doma.in
      - SCRIPT=docker resart cool_service
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /data/traefik:/traefik
      - /some/where/certs/:/output
```
