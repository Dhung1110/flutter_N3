import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback Form',
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  int _rating = 4;
  final TextEditingController _feedbackController = TextEditingController();

  Map<String, dynamic>? submittedInfo;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        submittedInfo = {
          'name': _nameController.text,
          'rating': _rating,
          'feedback': _feedbackController.text,
        };
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gửi phản hồi thành công')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // nền gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF37C6F7), Color.fromARGB(255, 228, 234, 230)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: 420,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.feedback_outlined,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Gửi phản hồi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Họ tên
                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Họ tên',
                            labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Vui lòng nhập họ tên';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Đánh giá
                        DropdownButtonFormField<int>(
                          value: _rating,
                          dropdownColor: const Color(0xFF1F2933),
                          decoration: InputDecoration(
                            labelText: 'Đánh giá (1-5 sao)',
                            labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                            prefixIcon:
                                const Icon(Icons.star, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          items: List.generate(5, (index) {
                            int starCount = index + 1;
                            return DropdownMenuItem(
                              value: starCount,
                              child: Row(
                                children: List.generate(
                                  starCount,
                                  (_) => const Icon(Icons.star,
                                      size: 18, color: Colors.amber),
                                ),
                              ),
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              _rating = value ?? 4;
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        // Nội dung góp ý
                        TextFormField(
                          controller: _feedbackController,
                          maxLines: 4,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Nội dung góp ý',
                            labelStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                            prefixIcon:
                                const Icon(Icons.edit, color: Colors.white),
                            alignLabelWithHint: true,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Vui lòng nhập nội dung góp ý';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Nút gửi
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton.icon(
                            onPressed: _submitForm,
                            icon: const Icon(Icons.send),
                            label: const Text(
                              'Gửi phản hồi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (submittedInfo != null) ...[
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thông tin vừa gửi:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ListTile(
                            leading: const Icon(Icons.person,
                                color: Colors.white),
                            title: Text(
                              submittedInfo!['name'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.star,
                                color: Colors.amber),
                            title: Text(
                              'Đánh giá: ${submittedInfo!['rating']} sao',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.feedback,
                                color: Colors.white),
                            title: const Text(
                              'Nội dung góp ý:',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              submittedInfo!['feedback'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
