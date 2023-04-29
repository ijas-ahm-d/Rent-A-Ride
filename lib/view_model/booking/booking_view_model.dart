import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/textstyle.dart';

class BookingViewModel extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  int? _totalHours;
  int? get totalHors => _totalHours;

  TimeOfDay? _pickupTime;
  TimeOfDay? get pickupTime => _pickupTime;

  TimeOfDay? _dropoffTime;
  TimeOfDay? get dropoffTime => _dropoffTime;

  DateTime? _pickupDate;
  DateTime? get pickupDate => _pickupDate;

  DateTime? _dropoffDate;
  DateTime? get dropoffDate => _dropoffDate;

  bool _isDriverRequired = false;
  bool get isDriverRequired => _isDriverRequired;

  isDriver(bool value) {
    _isDriverRequired = value;
    notifyListeners();
  }

  setTotalHours(int? totalHrs) {
    _totalHours = totalHrs;
    log("##########$_totalHours");
    notifyListeners();
  }

  setPickUpDate(DateTime? newPickDate) {
    _pickupDate = newPickDate;
    notifyListeners();
  }

  setDropOffDate(DateTime? newDropDate) {
    _dropoffDate = newDropDate;
    notifyListeners();
  }

  setPickUpTime(TimeOfDay? newPickTime) {
    _pickupTime = newPickTime;
    notifyListeners();
  }

  setDropOffTime(TimeOfDay? newDropTime) {
    _dropoffTime = newDropTime;
    notifyListeners();
  }

  getPickupDate(context) async {
    DateTime? newPickDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    // if "CANCEL"=> Null
    if (newPickDate == null) {
      return;
    } else {
      // if "OK"=> DateTime
      setPickUpDate(newPickDate);
    }
  }

  getDropOffDate(context) async {
    DateTime? newDropDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    // if "CANCEL"=> Null
    if (newDropDate == null) {
      return;
    } else {
      // if "OK"=> DateTime
      setDropOffDate(newDropDate);
      
    }
  }

  getPickupTime(context) async {
    TimeOfDay? newPickTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    // if "CANCEL"=> Null
    if (newPickTime == null) {
      return;
    } else {
      // if "OK"=> TimeOfDay
      setPickUpTime(newPickTime);
    }
  }

  checkPickupDate() {
    return Text(
      pickupDate == null
          ? "Date"
          : "${pickupDate!.day}/${pickupDate!.month}/${pickupDate!.year}",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

  checkPickupTime() {
    String hour =
        pickupTime == null ? "" : pickupTime!.hour.toString().padLeft(2, "0");
    String minutes =
        pickupTime == null ? "" : pickupTime!.minute.toString().padLeft(2, "0");
    return Text(
      pickupTime == null ? "Time" : "$hour:$minutes",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

  getDropOffTime(context) async {
    TimeOfDay? newDropTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );
    // if "CANCEL"=> Null
    if (newDropTime == null) {
      return;
    } else {
      // if "OK"=> TimeOfDay
      setDropOffTime(newDropTime);
      // function to check the total hours
      getTheTotalHours();
    }
  }

  checkDropOffDate() {
    return Text(
      dropoffDate == null
          ? "Date"
          : "${dropoffDate!.day}/${dropoffDate!.month}/${dropoffDate!.year}",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

  checkDropOffTime() {
    String hour =
        dropoffTime == null ? "" : dropoffTime!.hour.toString().padLeft(2, "0");
    String minutes = dropoffTime == null
        ? ""
        : dropoffTime!.minute.toString().padLeft(2, "0");
    return Text(
      dropoffTime == null ? "Time" : "$hour:$minutes",
      style: textstyle(17, FontWeight.bold, kwhite),
    );
  }

  getTheTotalHours() {
    DateTime startDateTime = DateTime(
      _pickupDate!.year,
      _pickupDate!.month,
      _pickupDate!.day,
      _pickupTime!.hour,
      _pickupTime!.minute,
    );
    DateTime endDateTime = DateTime(
      _dropoffDate!.year,
      _dropoffDate!.month,
      _dropoffDate!.day,
      _dropoffTime!.hour,
      _dropoffTime!.minute,
    );
    Duration duration = endDateTime.difference(startDateTime);
    log("$duration**********");
    setTotalHours(duration.inHours);
  }
}
