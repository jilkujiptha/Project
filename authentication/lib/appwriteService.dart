import 'package:appwrite/appwrite.dart';

class appwriteService{
  late Client client;
  late Account account;


  static const endPoint="https://cloud.appwrite.io/v1";
  static const projectId="6746f9e800175a4e268d";


  appwriteService(){
    client=Client();
    client.setEndpoint(endPoint).setProject(projectId);
    account=Account(client);
  }

Future<void>registerUser(String email,String password,String name)async{
  try {
    final res=await account.create(userId: ID.unique(), email: email, password: password,name: name);
    print("User registered:${res.$id}");
  } catch (e) {
    print("Error:${e}");
  }
}

Future<void>loginUser(String email,String password)async{
  try {
    final session=await account.createEmailPasswordSession(email: email, password: password);
    print("User loggedIn:${session.userId}");
  }on AppwriteException catch(e){
     if(e.code==401){
      print("Error:Incorrect email or password");
    }else{
      print("Error:${e.message}");
      throw Exception(e.message);
    }
  }
  
  catch (e) {
   print("Unexpected error:$e");
   throw Exception("An Unexpected error Occurred");
    
  }
}

}