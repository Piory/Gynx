// ignore_for_file: one_member_abstracts

abstract interface class CheckGynxIdExistenceUsecase {
  Future<bool> execute(String gynxId);
}
