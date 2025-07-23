abstract class UserRepo {
  Stream<MyUser?> user;

  Future<MyUser> signUp(MyUser user, String password);

  Future<void> setUserData(MyUser user);

  Future<void> signIn(String email, String password);

  Future<void> signOut();

}
