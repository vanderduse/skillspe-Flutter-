import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:encrypt/encrypt.dart';
import 'package:skills_pe/screens/quiz/model/quiz_answer_set.dart';
import 'dart:convert';
import 'package:skills_pe/screens/quiz/model/quiz_information_response_model.dart';
import 'package:skills_pe/screens/quiz/model/quiz_questions_answer_model.dart';
import 'package:skills_pe/screens/quiz/repository/quiz_repository.dart';
part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository _quizRepository;
  QuizBloc(this._quizRepository) : super(QuizInitialState()) {
    on<QuizInitialEvent>(getQuizInformation);
    on<QuizPlayEvent>(getPlayQuizDetail);
    on<QuizSubmitEvent>(quizSubmitEvent);
  }

  FutureOr<void> getQuizInformation(
      QuizInitialEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoadingState());
    var response = await _quizRepository.quizInformation(event.quidId);
    if (response?.success == true && response?.data != null) {
      emit(QuizApiSuccessState(response!.data!));
    } else if (response != null && response.message != null) {
      emit(QuizApiFailureState(response.message!));
    }
  }

  FutureOr<void> getPlayQuizDetail(
      QuizPlayEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoadingState());
    var response = await _quizRepository.playQuizDetail(event.quidId);
    if (response?.success == true && response?.data != null) {
      String aesKey = const String.fromEnvironment('AES_KEY');
      List<dynamic>? decryptedText =
          aesDecrypt(response!.data!.questionSet!, aesKey);
      List<QuizQuestionAnswerSetModel>? quizQuestionSet = decryptedText
          ?.map((item) =>
              QuizQuestionAnswerSetModel.fromJson(item as Map<String, dynamic>))
          .toList();
      emit(QuizPlaySuccessState(quizQuestionSet));
    } else if (response != null && response.message != null) {
      emit(QuizPlayFailureState(response.message!));
    }
  }

  FutureOr<void> quizSubmitEvent(
      QuizSubmitEvent event, Emitter<QuizState> emit) async {
    emit(QuizSubmitLoadingState());
    String aesKey = const String.fromEnvironment('AES_KEY');
    String encryptedText =
        aesEncrypt(QuizAnswerSet.listToJson(event.quizAnswerSetList), aesKey);
    final response =
        await _quizRepository.quizSubmission(event.quizId, encryptedText);
    if (response != null && response.success == true) {
      emit(QuizSubmitSucessState());
    } else if (response != null && response.error != null) {
      emit(QuizApiFailureState(response.error!));
    }
  }

  List<dynamic>? aesDecrypt(String encryptedText, String aesKey) {
    try {
      var parts = encryptedText.split('\$');
      var iv = utf8.encode(parts[0]);
      var ciphertext = base64Decode(parts[1]);
      final key = Key.fromUtf8(aesKey);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      var decryptedText = encrypter.decrypt(Encrypted(ciphertext),
          iv: IV(Uint8List.fromList(iv)));
      var decodedValue = jsonDecode(jsonDecode(decryptedText));
      if (decodedValue is List<dynamic>) {
        return decodedValue;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String aesEncrypt(String decryptedJsonText, String aesKey) {
    String iv = generateRandomIV();
    String encryptedText = encryptAesCbc(decryptedJsonText, aesKey, iv);
    return encryptedText;
  }

  String encryptAesCbc(String text, String key, String iv) {
    final keyBytes = utf8.encode(key);
    final encrypter =
        Encrypter(AES(Key(Uint8List.fromList(keyBytes)), mode: AESMode.cbc));
    Encrypted encrypted = encrypter.encrypt(text, iv: IV.fromBase64(iv));
    // Combine IV and ciphertext with a delimiter
    return '$iv\$${base64Encode(encrypted.bytes)}';
  }

  String generateRandomIV() {
    final random = Random.secure();
    final ivBytes = List<int>.generate(16, (index) => random.nextInt(256));
    return base64Encode(Uint8List.fromList(ivBytes));
  }
}
