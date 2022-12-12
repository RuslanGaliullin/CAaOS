#ifndef CAAOS__ADDITION_H_
#define CAAOS__ADDITION_H_
#include <string>
/// Класса для пациентов. Содержит имя пациента и направление врача, к которому он хочет записаться
class Patient {
 public:
  std::string name;
  // Направление врача: surgeon, GP, dentist
  std::string doctor;
  explicit Patient(std::string name, std::string doc) : name(std::move(name)), doctor(std::move(doc)) {
  }
  Patient() = default;
};
#endif//CAAOS__ADDITION_H_
