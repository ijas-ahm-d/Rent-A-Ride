class Urls {
//BASE URL
// static String baseUrl = "http://192.168.45.198:7000/api";
  static String baseUrl = "https://fastrack-backend.onrender.com/api";
  static String bearer = "Bearer ";

// CATEGORY
  static String user = "/users";
  static String driver = "/driver";
  static String admin = "/admin";

// USER
  static String userLogIn = "/userLogin";
  static String userSignUp = "/userSignup";
  static String userOtp = "/otp";
  static String showAllCars = "/cars";
  static String showSingleCar = "/car";
  static String userCarBook = "/bookCar";
  static String userBookings = "/myBookings";
  static String userPayment = "/payment";

// DRIVER
  static String driverLogIn = "/login";
  static String driverSignUp = "/signup";

  // ADMIN
  static String getAllPlaces = "/getPlaces";

  //payment
  static String payment = "https://api.stripe.com/v1/payment_intents";

// Backend
  // static String secret =
  //     "sk_test_51Mg3gFSFAwfsuLHcq2QhP0MfWq9lShezSoFqHDSlhi9o0h8VTYkEkNyH9Uqr8IQ9jkIfQbdYBHi4iDQWPOlumv1n00CYybWskj";
// Mine
  static String secret = "sk_test_51N3uIVSEurDXAlrNt3MACweCTEaw1GB0ROV5ALzXAKGFRmym64DCmOWcvvZ85QjMaEDv8p3ei4qdnBL3SCVXQCn000wiLNcatO";
}
