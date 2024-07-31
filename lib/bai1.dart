class Fraction {
  int tuSo;
  int mauSo;
  Fraction(this.tuSo, this.mauSo) {
    if (mauSo == 0) {
      print("Mẫu khác 0");
    }
  }
  Fraction operator +(Fraction value) {
    int newTuSo = tuSo * value.mauSo + mauSo * value.tuSo;
    int newMauSo = mauSo * value.mauSo;
    return Fraction(newTuSo, newMauSo);
  }

  Fraction operator -(Fraction value) {
    int newTuSo = tuSo * value.mauSo - mauSo * value.tuSo;
    int newMauSo = mauSo * value.mauSo;
    return Fraction(newTuSo, newMauSo);
  }

  Fraction operator *(Fraction value) {
    return Fraction(
      tuSo * value.tuSo,
      mauSo * value.mauSo,
    );
  }

  Fraction operator /(Fraction value) {
    if (mauSo == 0 || value.mauSo == 0) {
      print("Mẫu phải khác KHÔNG");
    }
    return Fraction(tuSo * value.mauSo, mauSo * value.tuSo);
  }

  bool operator <(Fraction other) {
    return tuSo * other.mauSo < other.tuSo * mauSo;
  }

  bool operator >(Fraction other) {
    return tuSo * other.mauSo > other.tuSo * mauSo;
  }

  bool operator >=(Fraction other) {
    return tuSo * other.mauSo >= other.tuSo * mauSo;
  }

  bool operator <=(Fraction other) {
    return tuSo * other.mauSo >= other.tuSo * mauSo;
  }

  @override
  String toString() {
    return '$tuSo/$mauSo';
  }
}

void main() {
  Fraction ps1 = Fraction(1, 3);
  Fraction ps2 = Fraction(2, 4);
  print(ps1 + ps2);
  print(ps1 - ps2);
  print(ps1 * ps2);
  print(ps1 / ps2);
  print(ps1 < ps2);
  print(ps1 > ps2);
  print(ps1 >= ps2);
  print(ps1 <= ps2);
}
