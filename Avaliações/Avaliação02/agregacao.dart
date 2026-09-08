import 'dart:convert';

// 14-agregacao.dart  
// Agregação e Composição

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // Método para converter o objeto em um Map (necessário para o JSON)
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  // Método para converter o objeto em um Map
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  // Método para converter o objeto em um Map
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente dep1 = Dependente('Lucas');
  Dependente dep2 = Dependente('Sofia');
  Dependente dep3 = Dependente('Mateus');

  // 2. Criar varios objetos Funcionario e
  // 3. Associar os Dependentes criados aos respectivos funcionarios
  Funcionario func1 = Funcionario('Carlos Silva', [dep1, dep2]);
  Funcionario func2 = Funcionario('Ana Souza', [dep3]);
  Funcionario func3 = Funcionario('João Pereira', []); // Sem dependentes

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> listaFuncionarios = [func1, func2, func3];

  // 5. Criar um objeto Equipe Projeto chamando o metodo
  //    construtor que da nome ao projeto e insere uma coleção de funcionario
  EquipeProjeto equipe = EquipeProjeto('Sistema de Gestão', listaFuncionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  // JsonEncoder.withIndent('  ') formata o JSON de forma legível (pretty print)
  String jsonEquipe = JsonEncoder.withIndent('  ').convert(equipe.toJson());
  print(jsonEquipe);
}
