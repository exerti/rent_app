// //封装dio 库
// // ignore_for_file: file_names

// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:ggw/app/core/constant/index.dart';
// import 'package:ggw/app/routes/app_pages.dart';
// import 'package:ggw/app/service/Storage.dart';

// class MyRequest {
//   static Dio dio = Dio();

//   String? authorization;
//   MyRequest() {
//     BaseOptions options = BaseOptions();
//     options.baseUrl = Domain.domain;
//     // 设置请求的Content-Type，默认值是[ContentType.json]
//     // 设置请求 时间 和  超时时间

//     options.responseType = ResponseType.json;
//     dio.options = options;
//     //添加请求拦截器，配置请求Token
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         //判断是否为登录请求
//         if (options.path.contains(RegExp(r'/auth/social/androidLogin$')) ||
//             options.path.contains(RegExp(r'/auth/social/iosLogin$')) ||
//             options.path.contains("/auth/social/mobileLog") ||
//             options.path.contains("/auth/social/mobileRegister") ||
//             options.path.contains("/auth/social/bind/login") ||
//             options.path.contains("/auth/social/sign/login") ||
//             options.path.contains("/captcha") ||
//             options.path.contains("https://api.weixin.qq.com/") ||
//             options.path.contains("/auth/social/app")) {
//           return handler.next(options); // 继续执行请求
//         }
//         if (authorization == null) {
//           Map<String, dynamic> token = await Storage.getData('Token');
//           authorization = '${token["token_type"]} ${token["access_token"]}';
//         }
//         options.headers["Authorization"] = authorization;
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         // 继续执行响应
//         return handler.next(response);
//       },
//       onError: (DioException e, handler) {
//         // 继续执行错误处理
//         return handler.next(e);
//       },
//     ));

//     //使用拦截处理401错误 并且出发重新刷新令牌
//     dio.interceptors.add(InterceptorsWrapper(
//       onError: (DioException error, handler) async {
//         Dio dio = Dio();
//         // 检查请求是否已经完成
//         if (error.response == null) {
//           return handler.next(error);
//         }
//         // 检查是否为401错误
//         if (error.response?.statusCode == 401) {
//           Dio tokenDio = Dio(); // 创建一个新的Dio实例，避免循环依赖
//           Map<String, dynamic> token = await Storage.getData('Token');
//           try {
//             // 使用刷新令牌请求新的访问令牌
//             final response = await tokenDio
//                 .post('https://lcglkj.gangguan.com/auth/oauth/token', data: {
//               "grant_type": "refresh_token",
//               'refreshToken': "${token["access_token"]}",
//             });
//             // 保存新的访问令牌和刷新令牌
//             var accessToken = response.data['accessToken'];
//             var refreshToken = response.data['refreshToken'];
//             Storage.setData('Token', {
//               "token_type": response.data['token_type'],
//               "access_token": response.data['accessToken'],
//               "refresh_token": response.data['refreshToken'],
//             });
//             // TokenStorage.storeToken(accessToken, refreshToken);
//             // 重试原请求
//             final opts = error.requestOptions;
//             opts.headers['Authorization'] = 'Bearer $accessToken';
//             final cloneReq = await dio.fetch(opts);
//             return handler.resolve(cloneReq);
//           } catch (e) {
//             // 刷新令牌失败，可能需要重新登录
//             handler.next(error);
//           }
//         } else if (error.response?.statusCode == 498) {
//           Get.offAllNamed(Routes.LOGIN_PAGE);
//         } else {
//           // 其他错误直接传递
//           return handler.next(error);
//         }
//       },
//     ));
//   }

//   Future<dynamic> get(
//     String api, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     void Function(int, int)? onReceiveProgress,
//   }) async {
//     try {
//       var response = dio.get(
//         api,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       print("请求数据异常");
//       return null;
//     }
//   }

//   Future<dynamic> post(
//     String api, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     void Function(int, int)? onReceiveProgress,
//   }) async {
//     try {
//       var response = dio.post(
//         api,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );

//       return response;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<dynamic> delete(
//     String api, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       var response = dio.delete(
//         api,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );

//       return response;
//     } catch (e) {
//       print("发送数据数据异常");
//       return null;
//     }
//   }

//   Future<dynamic> put(
//     String api, {
//     Object? data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       var response = dio.put(
//         api,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );

//       return response;
//     } catch (e) {
//       print("发送数据数据异常");
//       return null;
//     }
//   }

//   static replaeUri(pic) {
//     String picUrl = Domain.domain + pic;
//     return picUrl.replaceAll("\\", "/");
//   }
// }
