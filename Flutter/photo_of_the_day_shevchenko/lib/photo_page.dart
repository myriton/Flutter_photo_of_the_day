import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum PhotoType { dog, landscape }

class PhotoType extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

Class _PhotoPageState extends State<PhotoPage> {
  String? _imageUrl;
  bool _isLoading = false;
  String? _errorMessage;
  PhotoType _animalType = PhotoType.dog;

  Future<void> _fetchPhoto() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _imageUrl = null;
    });

  try {
    String url;
    http.Response response;

    if (_animalType == PhotoType.dog) {
      url = 'https://dog.ceo/api/breeds/image/random';
      response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(
        response.body,
      );
      _imageUrl = 'https://picsum.photos/seed/$random/800/800';
    }
  } catch (e) {
    _errorMessage = 'Не удалось загрузить фото.\nПроверьте подключение к интернету.';
  }

  setState(() {
    _isLoading = false;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        tittle: const Text('Фото дня'), 
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildAnimalToggle(),
          const SizwdBox(height: 20),
          _buildContent(),
          const SizedBox(height: 20),
          _buildButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAnimalToggle() {
    retun Row(
      mainAxisAlignent: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text('🐶 Собаки'),
          selected: _animalType == PhotoType.dog,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _animalType = PhotoType.dog;
                _imageUrl = null;
                _errorMessage = null;
              });
            }
          },
        ),
        const SizedBox(width: 12),
        ChoiceChip(
          label: const Text('🌄 Пейзаж'),
          selected: _animalType == PhotoType.landscapes,
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _animalType = PhotoType.landsapes;
                _imageUrl = null;
                _errorMessage = null;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    }

    if (_image)
  }
}