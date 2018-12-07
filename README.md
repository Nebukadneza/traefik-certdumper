# Single-domain traefik-certdumper for mailu

This is based on the work by Sven Dowideit on https://github.com/SvenDowideit/traefik-certdumper

## Fork?
This is a slight modification that is less flexible, but is adapted to the
usecase in mailu. If you wish to deploy mailu behind a traefik, you face many
problems. One of these is that you need to get the certificates into mailu in a
very defined manner. This will copy the certificate for the **Main:**-domain
given in the DOMAIN-environment onto `output`.

If your output happens to be mailu-front-`/certs`, the certificate-watcher in
the front-container will catch it and reload nginx. This works for mailu
`TLS_FLAVOR=[mail, cert]`


```
  certdumper:
    restart: always
    image: nebukadneza/traefik-certdumper:latest
    environment:
      - DOMAIN=mail.your.doma.in
    volumes:
      - /data/traefik:/traefik
      - /your/mailu/$ROOT/mailu/certs/:/output/
```
