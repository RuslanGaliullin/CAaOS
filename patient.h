#ifndef CAAOS__ADDITION_H_
#define CAAOS__ADDITION_H_
#include <string>
class Patient {
 public:
  std::string name;
  std::string doctor;
  explicit Patient(std::string name, std::string doc) : name(std::move(name)), doctor(std::move(doc)) {
  }
  Patient() = default;
};
#endif//CAAOS__ADDITION_H_
