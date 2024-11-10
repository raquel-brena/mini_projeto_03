import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/model/lugar.dart';
import 'package:mini_projeto_03/components/input.dart';

class LugarForm extends StatelessWidget {
  LugarForm({super.key});

  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _paises = TextEditingController();
  final TextEditingController _imagemURL = TextEditingController();
  final TextEditingController _recomendacoes = TextEditingController();
  final TextEditingController _avaliacao = TextEditingController();
  final TextEditingController _custoMedio = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);
     final Lugar? lugar = ModalRoute.of(context)?.settings.arguments as Lugar?;


    void _submitForm(BuildContext context) {
      if (_formKey.currentState!.validate()) {
        String titulo = _titulo.text;
        List<String> paises =
            _paises.text.split(',').map((s) => s.trim()).toList();
        String imagemUrl = _imagemURL.text;
        List<String> recomendacoes =
            _recomendacoes.text.split(',').map((s) => s.trim()).toList();
        double avaliacao = double.tryParse(_avaliacao.text) ?? 0.0;
        double custoMedio = double.tryParse(_custoMedio.text) ?? 0.0;

        if (lugar != null) {
          Lugar novoLugar = Lugar(
            id: lugar!.id,
            paises: paises,
            titulo: titulo,
            imagemUrl: imagemUrl,
            recomendacoes: recomendacoes,
            avaliacao: avaliacao,
            custoMedio: custoMedio,
          );
          _providerLugar.updateLugar(novoLugar);
        } else {
          String id = 'p' + (_providerLugar.getLugares.length + 1).toString();
          _providerLugar.addLugar(Lugar(
            id: id,
            paises: paises,
            titulo: titulo,
            imagemUrl: imagemUrl,
            recomendacoes: recomendacoes,
            avaliacao: avaliacao,
            custoMedio: custoMedio,
          ));
        }

        SnackBar snackBar = SnackBar(content: Text("Lugar salvo com sucesso!"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamed(context, '/gerenciarLugares');
      } else {
        SnackBar snackBar =
        SnackBar(content: Text("Por favor, corrija os erros"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lugar != null ? 'Editar Lugar' : 'Adicionar Lugar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Input(
                    controller: _titulo,
                    placeholder: "Inserir título",
                    initialValue: lugar?.titulo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um título';
                      }
                      return null;
                    },
                  ),
                  Input(
                    controller: _paises,
                    placeholder: "Inserir países",
                    initialValue: lugar?.paises.join(', '),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira os países separados por vírgula';
                      }
                      return null;
                    },
                  ),
                  Input(
                    controller: _imagemURL,
                    placeholder: "Inserir URL da imagem",
                    initialValue: lugar?.imagemUrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a URL da imagem';
                      }
                      return null;
                    },
                  ),
                  Input(
                    controller: _recomendacoes,
                    placeholder: "Inserir recomendações",
                    initialValue: lugar?.recomendacoes.join(', '),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira recomendações separadas por vírgula';
                      }
                      return null;
                    },
                  ),
                  Input(
                    controller: _avaliacao,
                    placeholder: "Inserir avaliação",
                    initialValue: lugar?.avaliacao.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma avaliação';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor, insira um número válido';
                      }
                      return null;
                    },
                  ),
                  Input(
                    controller: _custoMedio,
                    placeholder: "Inserir custo médio",
                    initialValue: lugar?.custoMedio.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um custo médio';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor, insira um número válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => _submitForm(context),
                    child: Text("Salvar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
