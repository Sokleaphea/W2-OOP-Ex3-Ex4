class CustomDuration {
  int _milliseconds;

  CustomDuration(this._milliseconds);

  CustomDuration.fromHours({required int hours}) : _milliseconds = hours * 36000000;
  CustomDuration.fromMinutes({required int minutes}) : _milliseconds = minutes * 60000;
  CustomDuration.fromSeconds({required int seconds}) : _milliseconds = seconds * 1000;

  int get milliseconds => _milliseconds;

  CustomDuration operator -(CustomDuration other) {
    if (_milliseconds > other._milliseconds) {
      return CustomDuration(_milliseconds - other._milliseconds);
    } else {
      print("Cannot subtract");
      return this;
    }
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(_milliseconds + other._milliseconds);
  }

  bool operator >(Object other) {
    if (other is CustomDuration) {
      return _milliseconds > other._milliseconds ||
          _milliseconds < other._milliseconds;
    }
    return false;
  }

  @override
  String toString() => 'CustomDuration: $_milliseconds';
}

void main() {
  var d1 = CustomDuration(1000);
  var d2 = CustomDuration.fromMinutes(minutes: 1);
  var d3 = CustomDuration.fromHours(hours: 1);
  var d4 = CustomDuration.fromSeconds(seconds: 1);
  print(d1);
  print(d2);
  print(d3);
  print(d4);
  print("Compare: ${d1 > d3} ms");
  print("+: ${d1 + d3} ms");
  print("-: ${d2 - d3} ms");
}
