
class ICA {
  ICA({
    required this.icaCourse,
    required this.icaYear,
    required this.icaSemester,
    required this.icaM1,
    required this.icaM2,
    required this.icaTermWork,
    required this.icaTotal,
    required this.icaStatus,
    required this.icaVisibility
  });

  String icaCourse;
  int icaYear;
  int icaSemester;
  int icaM1;
  int icaM2;
  int icaTermWork;
  int icaTotal;
  String icaStatus;
  bool icaVisibility;
}

final ica = [
  ICA(
    icaCourse: 'Mobile Application Development',
    icaYear: 2023,
    icaSemester: 5,
    icaM1: 10,
    icaM2: 9,
    icaTermWork: 26,
    icaTotal: 45,
    icaStatus: "PASS",
    icaVisibility: true
  ),
  ICA(
      icaCourse: 'Calculus',
      icaYear: 2022,
      icaSemester: 3,
      icaM1: 7,
      icaM2: 5,
      icaTermWork: 9,
      icaTotal: 45,
      icaStatus: "FAIL",
      icaVisibility: true
  ),
  ICA(
      icaCourse: 'Operating Systems',
      icaYear: 2022,
      icaSemester: 4,
      icaM1: 8,
      icaM2: 9,
      icaTermWork: 22,
      icaTotal: 39,
      icaStatus: "PASS",
      icaVisibility: true
  ),
  ICA(
      icaCourse: 'Software Engineering',
      icaYear: 2021,
      icaSemester: 2,
      icaM1: 9,
      icaM2: 9,
      icaTermWork: 24,
      icaTotal: 42,
      icaStatus: "PASS",
      icaVisibility: true
  ),
  ICA(
      icaCourse: 'Quantum and Statistical Physics',
      icaYear: 2021,
      icaSemester: 2,
      icaM1: 2,
      icaM2: 3,
      icaTermWork: 7,
      icaTotal: 12,
      icaStatus: "FAIL",
      icaVisibility: true
  ),
  ICA(
      icaCourse: 'Computer Networks',
      icaYear: 2023,
      icaSemester: 5,
      icaM1: 7,
      icaM2: 9,
      icaTermWork: 14,
      icaTotal: 30,
      icaStatus: "PASS",
      icaVisibility: true
  ),
];
