import 'package:mini_projeto_03/components/Input.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaisForm extends StatelessWidget {

  PaisForm({super.key,});

  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _cor = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _providerPais = Provider.of<PaisProvider>(context, listen: true);
    final Pais? pais = ModalRoute.of(context)?.settings.arguments as Pais?;

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        String titulo = _titulo.text;
        String cor = _cor.text;

        if (pais != null) {
          Pais novoPais =
              Pais(id: pais!.id, titulo: titulo, cor: Colors.lightBlue);
          _providerPais.updatePais(novoPais);
        } else {
          String id = 'c' + (_providerPais.getPaises.length + 1).toString();
          _providerPais
              .addPais(Pais(id: id, titulo: titulo, cor: Colors.lightBlue));
        }

        SnackBar snackBar = SnackBar(content: Text("Lugar salvo com sucesso!"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        SnackBar snackBar =
            SnackBar(content: Text("Por favor, corrija os erros"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pais != null ? "Editar país"
: "Adicionar país")
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Input(
                  controller: _titulo,
                  placeholder: "Inserir título",
                  initialValue: pais?.titulo,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um título';
                    }
                    return null;
                  },
                ),
                Input(
                  controller: _cor,
                  placeholder: "Inserir cor",
                  initialValue: pais?.cor.toString(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a cor';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Enviar", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
