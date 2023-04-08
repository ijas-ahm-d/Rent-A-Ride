class Urls {
  // Base URL

  static String baseUrl = "http://192.168.173.198:7000/api";
  // static String baseUrl = "https://fastrack-backend.onrender.com/api";

  static String user = "/users";
  static String driver = "/driver";

// *****USER*****//
  // User Login Api
  static String userLogIn = "/userLogin";
  // User SignUp Api
  static String userSignUp = "/userSignup";
  // User Otp Api
  static String userOtp = "/otp";
  // showing all car details
  static String showAllCars = "/cars";
  // showing single car details
  static String showSingleCar = "/car";
  // User book a car
  static String userCarBook = "/bookCar";
  // User bookings
  static String userBookings = "/myBookings";
  // User Payment
  static String userPayment = "/payment";

  // *****DRIVER*****//
  // driver Login Api
  static String driverLogIn = "/login";
  // Driver SignUp Api
  static String driverSignUp = "/signup";
}
