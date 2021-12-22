# Saltstack eindopdracht Blok 2.4

Een saltstack die automatisch een Saltmaster een docker host en een Wordpress website opzet.

## Deployment

To deploy this project run

```bash
  ./bootstrap_script/bootstrap-salt.sh
```

Meld vervolgens de minions aan bij de saltmaster met

```bash
  ./bootstrap_script/bootstrap-salt.sh -M $SALTMASTERIP
```

Run vervolgens dit command op de saltmaster en de hosts worden automatisch ingesteld.
```bash
Salt '*' state.apply
```
