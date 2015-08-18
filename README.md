# camunda docker consul

## Run

```
docker run -d --name consul --net=host -v $PWD/consul.d:/etc/consul.d ci1.camunda.loc/camunda-consul -dc HQ
```

# Parameters

see [Consul Docs](https://www.consul.io/docs/agent/options.html)

- `-dc HQ`
- `-client LOCAL_BIND_IP`
- `-bind GLOBAL_BIND_IP`
- `-bootstrap` (**Only single node allowed with this options**)
- `-join OTHER_NODE` (multiple times possible)

# Web UI

[http://localhost:8500/ui/](http://localhost:8500/ui/)
