import 'package:oo_dart_app/classes/pessoa_abstract.dart';
import 'package:oo_dart_app/service/notificacao_interface.dart';

class NotificacaoSMS implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("Enviando SMS para ${pessoa.getNome()}...");
  }
}
