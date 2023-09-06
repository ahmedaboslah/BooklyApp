import 'package:dio/dio.dart';

abstract class Failers{
  final String ErrMessage;
  const Failers(this.ErrMessage);
}
class ServerFailers extends Failers{

ServerFailers(super.ErrMessage);
factory ServerFailers.fromDioError(DioError dioError){
  switch(dioError.type){
    case DioErrorType.connectTimeout:
      return ServerFailers('connection time out');
    case DioErrorType.sendTimeout:
      return ServerFailers('send time out');
    case DioErrorType.receiveTimeout:
      return ServerFailers('receive time out');
    case DioErrorType.response:
      return ServerFailers.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
    case DioErrorType.cancel:
      return ServerFailers('the request was canceld');
    case DioErrorType.other:
      if(dioError.message.contains('SocketException')){
        return ServerFailers('not internet connection');
      }
      return ServerFailers('unexpected error , please try again');
      default:
      return ServerFailers('Opps something went wrong');
  }
}
factory ServerFailers.fromResponse(int? Statuscode,dynamic response){
  if(Statuscode == 400 || Statuscode == 401 || Statuscode == 403){
    return ServerFailers(response['error']['message']);
  }else if(Statuscode == 404){
    return ServerFailers('Your request not found, please try again');
  }
  else if(Statuscode == 500){
    return ServerFailers('Internal server error , please try again later');
  }
  else{
    return ServerFailers('Opps something went wrong, please try again');
  }
}
}