// ignore_for_file: lines_longer_than_80_chars

import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en': {
          "language_ar": "العربية",
          "language_en": "English",
          "Login": "Login",
          "Follow us": "Follow us",
          "Phone Number": "Phone Number",
          "SMS verification code has been sent to :":
              "SMS verification code has been sent to :",
          "You will receive SMS in": "You will receive SMS in",
          "Didn’t recieve OTP ? ": "Didn’t recieve OTP ? ",
          "Send again": "Send again",
          "Verify": "Verify",
          "Verification Code": "Verification Code",
          "Hello": "Hello @name!",
          "What service do you need?": "What service do you need?",
          "Search for service": "Search for service",
          "Categories": "Categories",
          "See All": "See All",
          "Recomended": "Recomended",
          "Services": "Services",
          "Sub Services": "Sub Services",
          "Description": "Description",
          "Service Process": "Service Process",
          "Book Now": "Book Now",
          "Settings": "Settings",
          "History": "History",
          "Wallet": "Wallet",
          "Language": "Language",
          "Change language": "Change language",
          "Dark Theme": "Dark Theme",
          "Logout": "Logout",
          "My Orders": "My Orders",
          "All": "All",
          "Confirmed": "Confirmed",
          "Pending": "Pending",
          "Ended": "Ended",
          "Canceled": "Canceled",
          "No orders found": "No orders found",
          "SDG": "@amount SDG",
          "Reservation: ": "Reservation: ",
          "Phone number: ": "Phone number: ",
          "Reservation Details": "Reservation Details",
          "Cancel": "Cancel",
          "New Account": "New Account",
          "Name": "Name",
          "Email address": "Email address (Optional)",
          "Gender": "Gender",
          "Birthday": "Birthday",
          "Ok": "Ok",
          "Register": "Register",
          "Man": "Man",
          "Woman": "Woman",
          "required": " is required",
          "email validation": " must be in the format \'email@email.com \'",
          'Are you sure you want to logout': 'Are you sure you want to logout?',
          "Error": "Error",
          "Total Balance": "Total Balance",
          "Recent Activity": "Recent Activity",
          "Charge": "Charge",
          "Deduct": "Deduct",
          "Day": "@day days",
          "Appropriate period": "Appropriate period",
          "The available time is in the morning":
              "The available time is in the morning",
          "Submit": "Submit",
          "The other person's phone": "The other person's phone",
          "The other person's Name": "The other person's Name",
          "Book this service for another person":
              "Book this service for another person",
          "Reservation saved successfully, your request is waitlisted":
              "Reservation saved successfully, your request is waitlisted",
          "Are you sure you want to confirm booking with this information":
              "Are you sure you want to confirm booking with this information",
          "Confirm": "Confirm",
          "Edit info": "Edit info",
          "Provider name: ": "Provider name: ",
          "Period: ": "Period: ",
          "Are you sure you want to cancel booking":
              "Are you sure you want to cancel booking",
          "Yes": "Yes",
          "No": "No",
          "No services": "No services",
          "Opps...!": "Opps...!",
          "Requirement Documents": "Requirement Documents",
          "No document required": "No document required",
          "No Service steps": "No Service steps",
          "Reservation time: ": "Reservation time: ",
          "Reservation date: ": "Reservation date: ",
        },
        'ar': {
          "language_ar": "العربية",
          "language_en": "English",
          "Login": "تسجيل دخول",
          "Follow us": "تابعنا",
          "Phone Number": "رقم الهاتف",
          "SMS verification code has been sent to :":
              "تم إرسال رمز التحقق في رسالة نصية للرقم :",
          "You will receive SMS in": "سوف تستلم رمز التحقق في ",
          "Didn’t recieve OTP ? ": "لم تستلم رمز التحقق؟ ",
          "Send again": "إعادة إرسال",
          "Verify": "تحقق",
          "Verification Code": "رمز التحقق",
          "Hello": "مرحباَ @name!",
          "What service do you need?": "ما هي الخدمة التي تحتاجها؟",
          "Search for service": "بحث عن خدمة",
          "Categories": "الفئات",
          "See All": "رؤية الكل",
          "Recomended": "مقترحات",
          "Services": "الخدمات",
          "Sub Services": "الخدمات الفرعية",
          "Description": "الوصف",
          "Service Process": "خطوات الخدمة",
          "Book Now": "إحجز الآن",
          "Settings": "الإعدادات",
          "History": "السجل",
          "Wallet": "المحفظة",
          "Language": "اللغة",
          "Change language": "تغيير اللغة",
          "Dark Theme": "الوضع الليلي",
          "Logout": "تسجيل الخروج",
          "My Orders": "طلباتي",
          "All": "الكل",
          "Confirmed": "مؤكدة",
          "Pending": "قيد التنفيذ",
          "Canceled": "ملغية",
          "Ended": "منتهية",
          "No orders found": "لا توجد طلبات",
          "SDG": "@amount ج.س",
          "Reservation: ": "حجز: ",
          "Phone number: ": "رقم الهاتف: ",
          "Reservation Details": "تفاصيل الحجز",
          "Cancel": "إلغاء",
          "New Account": "حساب جديد",
          "Name": "الإسم",
          "Email address": "البريد الإلكتروني (إختياري)",
          "Gender": "الجنس",
          "Birthday": "تاريخ الميلاد",
          "Ok": "حسناً",
          "Register": "تسجيل",
          "Man": "ذكر",
          "Woman": "أُنثى",
          "required": " مطلوب",
          "email validation": " يجب ان يكون بهذا الاسلوب \'name@email.com \'",
          'Are you sure you want to logout': 'هل أنت متأكد من تسجيل الخروج؟',
          "Error": "حطأ",
          "Total Balance": "الرصيد المتبقي",
          "Recent Activity": "المعاملات الأخيرة",
          "Charge": "شـحن",
          "Deduct": "خصـم",
          "Day": "@day أيام",
          "Appropriate period": "الفترة الملائمة",
          "The available time is in the morning": "الفترة المتاحة هي الصباحية",
          "Submit": "تأكيد",
          "The other person's phone": "هاتف الشخص الآخر",
          "The other person's Name": "إسم الشخص الآخر",
          "Book this service for another person": "احجز هذه الخدمة لشخص آخر",
          "Reservation saved successfully, your request is waitlisted":
              "تم حفظ الحجز بنجاح ، طلبك في قائمة الانتظار",
          "Are you sure you want to confirm booking with this information":
              "هل أنت متأكد أنك تريد تأكيد الحجز بهذه المعلومات",
          "Confirm": "تأكيد",
          "Edit info": "تعديل البيانات",
          "Provider name: ": "مزود الخدمة: ",
          "Period: ": "الفترة: ",
          "Are you sure you want to cancel booking":
              "هل انت متأكد من إلغاء الحجز؟",
          "Yes": "حسنا",
          "No": "لا",
          "No services": "لا يوجد خدمات",
          "Opps...!": "عفوا...!",
          "Requirement Documents": "المستندات المطلوبة",
          "No document required": "لا يتطلب أي مستند",
          "No Service steps": "لا يوجد خطوات  ",
          "Reservation time: ": "وقت الحجز: ",
          "Reservation date: ": "تاريخ الحجز: ",
        },
      };
}