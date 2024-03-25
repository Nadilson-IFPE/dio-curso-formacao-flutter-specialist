import 'package:oo_dart_app/classes/pessoa_abstract.dart';
import 'package:oo_dart_app/enum/tipo_notificacao.dart';
import 'package:oo_dart_app/service/impl/notificacao_email.dart';
import 'package:oo_dart_app/service/impl/notificacao_push_notificacao.dart';
import 'package:oo_dart_app/service/impl/notificacao_sms.dart';
import 'package:oo_dart_app/service/notificacao_interface.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificacaoPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      default:
        break;
    }
    if (notificacao != null) {
      notificacao!.enviarNotificacao(pessoa);
    } else {
      print("Pessoa sem tipo de notificação");
    }
  }
}
