class Contato
{
  String nome;
  String telefone;
  String data_nasc;

  Contato({this.nome, this.telefone, this.data_nasc});

  @override
  String toString() => '$nome,$telefone,$data_nasc;';
}
