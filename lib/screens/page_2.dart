import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  static String router = 'page_2';
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: const [
          _ListCategory()            
        ],
      ),
      color: Colors.blue,
      width: double.infinity,
      height: 400,
    );
  }
}
 

 class  _ListCategory extends StatelessWidget {
   
   const  _ListCategory();
 
   @override
   Widget build(BuildContext context) {
     final provider= Provider.of<ProviderService>(context);
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){return 
          Column(
            children: [
              const SizedBox(
                 height: 20,
              ),
              Text('${provider.category[index]}'),
            ],
          );})
        
        
          
          
        
      );
       
        }
 }