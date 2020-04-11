# SPHMobileDataRx

## Unit Test with DIKit  
To setup the dependency injection for unit test. The project creats a TestSetup class to init the DependencyContainer, and declare it inside info.plist file as a Principle Class.   
To avoid DI conflict with original application, the unit test cannot test with Host Application. 
