function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: "https://lista-compras-api.herokuapp.com/api/v1",
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  karate.configure("headers", { 
    ambiente: "treinamento"
  });
  // karate.configure("proxy", "http://SEU_PROXY_AQUI");
  return config;
}