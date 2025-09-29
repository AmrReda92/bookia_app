class RegisterRequestModel {
      String name;
      String email;
      String password;
      String passwordConfirmation;
      String? address;
      String? city;

      RegisterRequestModel(
      { required this.name,required this.email,
        required this.password,
        required this.passwordConfirmation,
         this.address, this.city
     });

   toMap(){
     return {
       "name":name,
       "email": email,
       "password":password,
       "password_confirmation" : passwordConfirmation,
     };
   }
}