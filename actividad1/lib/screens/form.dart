import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import '../utils/app_routes.dart';
import 'dart:math';

// Número random
Random random = Random();
int randomNumber = random.nextInt(1000) + 1;

// Expresiones regulares de validación
final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{8,16}$');
final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#~;:.%()\-_+=]).{10,20}$');
final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
final RegExp phoneRegex = RegExp(r'^\d{9}$');

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {

  // Controladores para los campos de texto
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  // Mensajes de error (en caso de existir)
  bool usernameCorrect = true;
  bool passwordCorrect = true;
  bool emailCorrect = true;
  bool birthdateCorrect = true;
  bool phoneNumberCorrect = true;
  bool localityCorrect = true;

  // Datos almacenados
  String? gender = 'Hombre';
  String? locality;
  int? validationNumber;

  List<String> localities = [
    'Málaga', 'Sevilla', 'Granada', 'Jaén', 'Almería', 'Córdoba', 'Cádiz', 'Huelva'
  ];

  Map<String, bool> programmingLanguages = {
    'Java': false,
    'Python': false,
    'JavaScript': false,
    'Rust': false,
    'C#': false,
    'Go': false,
    'Dart': false,
  };

  // Input para el username
  Widget createUsernameField() {
    return TextField(
      controller: usernameController,
      keyboardType: TextInputType.text,
      maxLength: 16,
      decoration: InputDecoration(
        hintText: 'Username',
        labelText: 'Username',
        errorText: usernameCorrect ? null : 'De 8 a 16 caracteres (letras, números y _)',
        counterText: '',
        suffixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    );
  }

  // Input para la contraseña
  Widget createPasswordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      obscuringCharacter: '•',
      keyboardType: TextInputType.text,
      maxLength: 20,
      decoration: InputDecoration(
        hintText: 'MiContraseña',
        labelText: 'Contraseña',
        errorText: passwordCorrect ? null : 'De 10 a 20 caracteres: \nA-Z, a-z, 0-9, y símbolos (!@#~;:.%()-_+=)',
        counterText: '',
        suffixIcon: const Icon(Icons.key),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    );
  }

  // Input para el email
  Widget createEmailField() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      maxLength: 60,
      decoration: InputDecoration(
        hintText: 'email@dominio.es',
        labelText: 'Correo electrónico',
        errorText: emailCorrect ? null : 'Correo electrónico incorrecto',
        counterText: '',
        suffixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    );
  }

  // Input para la fecha de nacimiento
  Widget createBirthdateField() {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1920),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          setState(() {
            birthdateController.text = pickedDate.toLocal().toString().split(' ')[0];
          });
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: birthdateController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: 'YYYY-MM-DD',
            labelText: 'Fecha de nacimiento',
            errorText: birthdateCorrect ? null : 'Fecha no válida o no seleccionada',
            suffixIcon: const Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }

  // Input para el email
  Widget createPhoneNumberField() {
    return TextField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '677888999',
        labelText: 'Número de teléfono',
        errorText: phoneNumberCorrect ? null : 'Número de teléfono incorrecto',
        suffixIcon: const Icon(Icons.send_to_mobile_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    );
  }

  // Desplegable de localidad
  Widget createDropDownLocality() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Provincia de residencia',
          errorText: localityCorrect ? null : 'Seleccione una provincia'
        ),
        value: locality,
        onChanged: (String? valor) {
          setState(() {
            locality = valor!;
          });
        },
        items: createItemsLocalityDropdown(),
      ));
  }

  // Menú para el desplegable de localidad
  List<DropdownMenuItem<String>> createItemsLocalityDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    for (var element in localities) {
      lista.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    }
    return lista;
  }

  // RadioButtons para el género
  Widget createGenderRadio() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
          child: Text(
            'Género',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ),
        createGenderRadioTile('Hombre'),
        createGenderRadioTile('Mujer'),
        createGenderRadioTile('No definido')
      ],
    );
  }

  // Crea una nueva elección para los elementos Radio del género
  Widget createGenderRadioTile(String txtValue) {
    return SizedBox(
      height: 32,
      child: RadioListTile<String>(
        title: Text(txtValue, style: Theme.of(context).textTheme.bodyMedium),
        value: txtValue,
        groupValue: gender,
        onChanged: (value) {
          setState(() {
            gender = value;
          });
        },
      )
    );
  }

  // Conjunto de Checkbox para los lenguajes de programación (GridView de 2 columnas fijas)
  Widget createProgrammingLanguagesCheckbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lenguajes de programación',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        
        const SizedBox(height: 8),
        SizedBox(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: programmingLanguages.keys.map((language) {

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: programmingLanguages[language],
                    onChanged: (bool? value) {
                      setState(() {
                        programmingLanguages[language] = value ?? false;
                      });
                    },
                  ),
                  Text(
                    language,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Campo para el número aleatorio
  Widget createRandomNumberValidationField() {
    return TextField(
      onChanged: (value) => setState(() {
        if (value != '' && int.tryParse(value) != null) {
          validationNumber = int.parse(value);
        }
      }),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: '1000',
        labelText: 'Número aleatorio',
        helperText: 'Indique un número aleatorio entre 1 y 1000',
        errorText: validationNumber == null  ? 
          null : validationNumber! < randomNumber ? 
          'El número a adivinar es más grande' : validationNumber! > randomNumber ?
          'El número a adivinar es más pequeño' : null,
        suffixText: validationNumber == randomNumber ? '¡¡Correcto!!' : null,
        suffixIcon: const Icon(Icons.format_list_numbered),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
    );
  }

  // Crea un botón para la validación del formulario
  Widget createValidationButton() {
    return  ElevatedButton(
      onPressed: validateForm,
      child: const Text('Validar Formulario'),
    );
  }

  // Función de validación de formulario
  void validateForm() {
    setState(() {
      usernameCorrect = usernameRegex.hasMatch(usernameController.text);
      passwordCorrect = passwordRegex.hasMatch(passwordController.text);
      emailCorrect = emailRegex.hasMatch(emailController.text);
      phoneNumberCorrect = phoneRegex.hasMatch(phoneNumberController.text);
      birthdateCorrect = birthdateController.text != '';
      localityCorrect = locality != null;
    });

  }

  // Método para cerrar la ventana junto con todos los controladores
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    birthdateController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(headerText: 'Form'),
      drawer: const MenuDrawer(markedLink: AppRoutes.form),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createUsernameField(),
              const SizedBox(height: 26,),
              createPasswordField(),
              const SizedBox(height: 26,),
              createEmailField(),
              const SizedBox(height: 26,),
              createBirthdateField(),
              const SizedBox(height: 26,),
              createPhoneNumberField(),
              const SizedBox(height: 26,),
              createDropDownLocality(),
              const SizedBox(height: 26,),
              createGenderRadio(),
              const SizedBox(height: 26,),
              createProgrammingLanguagesCheckbox(),
              const SizedBox(height: 26,),
              createRandomNumberValidationField(),
              const SizedBox(height: 26,),
              createValidationButton(),
              const SizedBox(height: 26,),

            ],
          )
        )
      )
    );
  }
}