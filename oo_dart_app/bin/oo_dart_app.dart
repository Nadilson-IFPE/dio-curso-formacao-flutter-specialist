import 'package:oo_dart_app/classes/pessoa_fisica.dart';
import 'package:oo_dart_app/classes/pessoa_juridica.dart';
import 'package:oo_dart_app/enum/tipo_notificacao.dart';
import 'package:oo_dart_app/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  var pessoaFisica1 = PessoaFisica(
      "Nadilson", "Rua Santa Quitéria", "123.456.789.00",
      tipoNotificacao: TipoNotificacao.PUSH_NOTIFICATION);
  print(pessoaFisica1);

  var pessoaJuridica1 = PessoaJuridica(
      "Empresa 1", "Rua Inácio de Barros", "1234567899876543210",
      tipoNotificacao: TipoNotificacao.EMAIL);
  print(pessoaJuridica1);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pessoaFisica1);
  enviarNotificacao.notificar(pessoaJuridica1);
}
