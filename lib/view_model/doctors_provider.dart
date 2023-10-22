import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../model/doctors_model.dart';

class DoctorsProvider with ChangeNotifier {
  List<DoctorsModel> get getDoctors {
    return doctors;
  }

  final List<DoctorsModel> doctors = [
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Sir. Magdy yacoub',
      doctorDescription:
          'Professor Yacoub established the largest heart and lung transplantation programme in the world where more than 2,500 transplant operations have been performed. He has also developed novel operations for a number of complex congenital heart anomalies.',
      doctorCategory: 'Cardiology',
      doctorImage:
          'https://d1b3667xvzs6rz.cloudfront.net/2021/02/133-000343-egypt-initiative-magdy-yacoub_700x400.jpg',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Dr. William A.Abdu',
      doctorDescription:
          'He is a pioneer in the study and treatment of spine-related conditions. Being one of the best orthopaedic surgeons',
      doctorCategory: 'Bones',
      doctorImage:
          'https://d2cyt36b7wnvt9.cloudfront.net/exams/wp-content/uploads/2021/12/01231526/Dr-William-1.png',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Dr Myles. B. Abbott',
      doctorDescription:
          ' is well-known for treating problems in growth and child development.',
      doctorCategory: 'Glands',
      doctorImage:
          'https://www.madrehealthcare.com/wp-content/uploads/2021/08/Dr.-Myles.-B.-Abbott-M.D.png.webp',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Dr. Mona.M.Abaza',
      doctorDescription:
          ' well-known specialized doctor in ENT Otolaryngologist, Adenoidectomy, esophagoscopy, Nasal airway surgery, and tracheostomy. ',
      doctorCategory: 'Ear care',
      doctorImage:
          'https://journals.openedition.org/archipel/docannexe/image/2604/img-1-small580.jpg',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Dr. Mary M',
      doctorDescription:
          'She is board-certified in Dermatology by the American Board of Dermatology and board certified in Dermatopathology by the American Board of Pathology and the American Board of Dermatology',
      doctorCategory: 'Dermatology',
      doctorImage:
          'https://lh5.googleusercontent.com/0sN96sUruPP_il-qU6lQuxfZ1u2D36WOSCpdif9cMVu0s9INiIIt9QWV6r6l4owH7XB-tUfAx7QVwukZddgYm4v4lTUQL9lf-YXtG3eKo3h8hZ13HF7m3x-kjwKnxddR3Dm1z_62knVKlA-d1iM86dc',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'DR. AHMED EL-MOATASSEM',
      doctorDescription:
          'is specialized in LASIK, Cataract, and Corneal Surgeries for more than 20 years in treating keratoconus in Egypt and many countries around the world.',
      doctorCategory: 'ophthalmologist ',
      doctorImage:
          'https://i0.wp.com/dr-elmoatassem.com/wp-content/uploads/2021/02/prof-dr.ahmed-el-moatassem.jpg?fit=960%2C980&ssl=1',
    ),
    DoctorsModel(
      doctorId: const Uuid().v4(),
      doctorTitle: 'Dr. Jerry Blaivas',
      doctorDescription:
          'He is an expert in treating urologic conditions for male and female incontinence, pelvic organ prolapse (dropped bladder) male, and female prostate problems.',
      doctorCategory: 'Urologists ',
      doctorImage:
          'https://lh3.googleusercontent.com/yjcAyLasxn63KQ-J_qo50qO9849LjkWimn134kpEfZ1KP2tLqLvJHsp3KKZ5lHRX7dNf7hXGdLgv5OYA378H37jhlBuYXqOgWf6ljNH068wwSgvuEa2RT6rg12kgxPu7cDCMGmJ1nQRz1ExMH2tdfKGepKYuGu8fEKbGzOGmP7FBbvjunYyrBosigg',
    ),
  ];

  DoctorsModel? findDoctorById(String doctorId) {
    if (doctors.where((element) => element.doctorId == doctorId).isEmpty) {
      return null;
    }
    return doctors.firstWhere((element) => element.doctorId == doctorId);
  }

  List<DoctorsModel> findDoctorByCategory({required String cateName}) {
    List<DoctorsModel> categoryList = doctors
        .where((element) => element.doctorCategory
            .toLowerCase()
            .contains(cateName.toLowerCase()))
        .toList();
    return categoryList;
  }

  List<DoctorsModel> searchQuery(
      {required String searchText, required List<DoctorsModel> passList}) {
    List<DoctorsModel> searchList = passList
        .where((element) => element.doctorTitle
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }
}
