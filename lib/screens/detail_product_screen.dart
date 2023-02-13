import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/inputs_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';


class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {

  final productService = Provider.of<ProductsService>(context);
  
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService));
    }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: <Widget> [
            Stack(
            children: [
              ProductImage(url:productService.selectedProduct.picture),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 40,
                      onPressed: () => Navigator.of(context).pop(), 
                      icon: const Icon(Icons.arrow_back_ios_new), color: Colors.white,),
                      const Spacer(),
                      IconButton(
                        iconSize: 40,
                      onPressed: (){}, 
                      icon: const Icon(Icons.camera_alt_outlined), color: Colors.white,)
                  ])),],),
      
                  const _UpdateForm(),
                  const SizedBox(height: 80,)
      
        ]),
      ),
      // se puede cambiar la posicion del FAB para que se pueda colocar hasta abajo
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () {},
        ),
    );
  }
}

class _UpdateForm extends StatelessWidget {
  const _UpdateForm({super.key});

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildDecoration(),
        child: Form(
            child: Column(
              children: [
               const SizedBox(height: 10),
                TextFormField(
                    textInputAction: TextInputAction.done,
                  initialValue: product.name,
                  onChanged: (value) => product.name = value ,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if( value == null || value.length < 5) {
                      return 'el campo nombre es obligatorio';
                    }
                  },
                  decoration: InputsDecorations.authInputsDecoration(
                    hintText: 'Nombre del producto', 
                    labelText: 'Nombre: '
                    ),
                   
                ),
               const SizedBox(height: 10),

                TextFormField(
                  initialValue: '${product.price}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    double.tryParse(value) == null ? 
                    product.price = 0
                    : product.price = double.parse(value); 
                  } ,
                             
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                
                  decoration: InputsDecorations.authInputsDecoration(
                    hintText: '\$99.99', 
                    labelText: 'Precio:'),
                ),
               const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  activeColor: Colors.indigo,
                  title: const Text('Disponible'),
                  value: product.available, 
                  onChanged: productForm.updateAvailability
                  ),
               const SizedBox(height: 20),

              ],
            ),
          ) 
          ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 5),
        blurRadius: 10
      )
    ]

  );
}