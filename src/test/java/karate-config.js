function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';

  /*Variables by default across the app */
  }
  var config = {
    apiUrl: 'https://api.realworld.io/api/'
  }
  /*To create differents environment variables to be used in the project */
 
  /*USERS FOR DEV ENVIRONMENT */
  if (env == 'dev') {
    config.userEmail = 'apitestdevcl@mail.com'
    config.userPassword = 'apitestdevcl'
  } 

  if (env == 'qa') {

    /*USERS FOR QA ENVIRONMENT */
    config.userEmail = 'apitestqacl@mail.com'
    config.userPassword = 'apitestqacl'
  }
  //Variable that store the token from the TokenAuthResponse.feature with callsingle function
  var accesToken = karate.callSingle('classpath:inheritanceFeatures/createTokenForUser.feature', config).authToken
  //Function that save generic header that will be used as authorization in other test cases
  karate.configure('headers',{Authorization:'Token '+ accesToken})
    
  return config;
}