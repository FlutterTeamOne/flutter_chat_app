## Domain - business layer:

 <!-- - dao (Data Access Object to work with the database) -->
 - data
   <!-- - databases (db classes with db entities (database models)) -->
   - dto
 - entities (model class to execute the network calls: this model is a copy of the data that we will receive from the remote server)

 <!-- - repositories (provide data from the database if any, or from the remote server) -->

<!-- ## why so many models/entities :
 - Each model of each layer responds to different needs, with which they have different evolutions. 
 - Creating several models, even if they are the same at first, assures us that they will be able to have different evolutions and transformations as new requirements arise. 
 - In this way we are reducing the coupling of layers. -->