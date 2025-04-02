import 'package:flutter/material.dart';

class QuantityDialog extends StatefulWidget {
  const QuantityDialog({super.key});

  static Future<int?> show(BuildContext context) async {
    return await showDialog<int?>(context: context, builder: (context) => const QuantityDialog());
  }

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Informe a quantidade de números que será gerado', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  final intValue = int.tryParse(value);
                  if (intValue == null) {
                    return 'O valor deve ser um número inteiro';
                  }
                  if (intValue < 1) {
                    return 'O valor deve ser maior que 0';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pop(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 8),
              Row(
                spacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pop(int.parse(_controller.text));
                      }
                    },
                    child: const Text('Confirmar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
