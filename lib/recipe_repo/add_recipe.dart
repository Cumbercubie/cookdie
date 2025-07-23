import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  List<String?> recipeImages = List.filled(10, null);
  final TextEditingController _titleController = TextEditingController();
  List<TextEditingController> _ingredientController = [TextEditingController()];
  List<TextEditingController> _stepControllers = [TextEditingController()];


  void _addIngredientField() {
    setState(() {
      _ingredientController.add(TextEditingController());
    });
  }

  void _addStepField() {
    setState(() {
      _stepControllers.add(TextEditingController());
    });
  }

  void _publishRecipe() {
    final title = _titleController.text.trim();
    final ingredients = _ingredientController.map((c) => c.text.trim()).where((
        t) => t.isNotEmpty).toList();
    final steps = _stepControllers.map((c) => c.text.trim()).where((t) =>
    t.isNotEmpty).toList();
    //  call API here
  }

  Widget _buildHorizontalSteps(List<TextEditingController> controllers, String hint, VoidCallback onAdd) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 12.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...controllers.asMap().entries.map((e) {
            final index = e.key;
            final controller = e.value;

            return Container(
              width: 200,
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Step ${index + 1}", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: controller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Describe step...",
                    ),
                  )
                ],
              ),
            );
          }),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.add, color: Colors.orange),
            ),
          ),
        ],
      ),
    );

  }

  Widget _buildDynamicTextFields(List<TextEditingController> controllers, String hint, VoidCallback onAdd) {
    return Column(
      children: [
        ...controllers.asMap().entries.map((e) {
          final index = e.key;
          final controller = e.value;
          return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '$hint ${index +1}',
                  border: OutlineInputBorder(),
                ),
              ),
          );
        }),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
              onPressed: onAdd,
              label: Text('Add $hint', style: TextStyle(color: Colors.orange)
              ),
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Recipe Images", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            //_buildImageGrid(),
            SizedBox(height: 24),
            Text("Recipe Title", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24,),
            Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8,),
            _buildDynamicTextFields(_ingredientController, 'Ingredient', _addIngredientField),
            SizedBox(height: 24,),
            Text("Steps", style: TextStyle(fontWeight: FontWeight.bold)),
            _buildHorizontalSteps(_stepControllers, 'Step', _addStepField),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _publishRecipe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
                child: Text('Publish recipe', style: TextStyle(fontSize: 16)),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
