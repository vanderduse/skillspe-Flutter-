// ignore_for_file: constant_identifier_names

//const BASE_URL = "https://api-stage.skillspe.com";
const BASE_URL = "https://aristoteles-stg.skillspe.com";
// LOCAL STORAGE KEY
const ACCESS_TOKEN = 'access_token';
const REFRESH_TOKEN = 'refresh_token';
const FCM_TOKEN = 'firebase_token';

// Query Params Key
const PAGE = 'Page';
const LIMIT = 'limit';
const STATUS = "status";

//API Response code
const API_SUCCESS_CODE = "SS0200";

// Create Challenge Screen
const CREATECHALLENGE = "Create Challenge";
const ENTERCHALLENGENAME = "Enter Challenge Name";
const CHALLENGE_NAME = "Challenge Name";
const PLACEHOLDER_EMOJI = "💰";
const PLACEHOLDER_GOALS = "Goals";
const CHALLENGEGOAL = "Challenge Goal";
const PLACEHOLDER_START_DATE = "Start Date";
const PLACEHOLDER_END_DATE = "End Date";
const ENTER_DATES_STAR = "Enter Dates*";
const CHALLENGEEMOJI = "Emoji";
const STARTDATE = "Start Date";
const ENDDATE = "End Date";
const CHALLENGEFEES = "Challenge Fees";
const STAR = "*";
const RUPEE = "₹";
const FIVRUPEEMIN = "₹5(Min)";
const THOUSANDRUPEEMAX = "₹1000(Max)";
const CHOOSE_EMOJI_TEXT =
    "Choose an emoji as the symbol for your challenge name!";
const ENTER_CHALLENGE_NAME = "Please enter challenge name";
const ENTER_CHALLENGE_GOAL = "Please enter challenge goal";
const ENTER_CHALLENGE_EMOJI = "Please enter challenge emoji";
const ENTER_START_DATE = "Please enter start date";
const ENTER_END_DATE = "Please enter end date";
const ENTER_CHALLENGE_FEES = "Please enter challenge fees";
const CHALLENGE_FEES_MAX_VALIDATION =
    "Challenge fees cannot be greater than 1000";
const CHALLENGE_FEES_MIN_VALIDATION = "Challenge fees cannot be less than 5";
const START_DATE_END_DATE_VALIDATION =
    "Start date cannot be greater than end date";
const CHALLENGES = 'Challenges';
const CHALLENGE_ACCEPTING_CONDITION_TEXT =
    "Start once all participants accepts the challenge";

// Challenge Details
const GENERAL_DETAILS = 'General Details';
const DURATION = 'Duration';
const FEES = 'Fees';
const CHALLENGERS = 'Challengers';
const MODERATORS = 'Moderators';
const MOTIVATORS = 'Motivators';
const SHARE = "Share";
const INVITE_CODE = "Challenge Invite Code";
const INVITE_CHALLENGERS = "Invite Challengers";
const SEARCH_YOUR_FRIEND = "Search your friend";
const INVITE = "Invite";

// Quiz Home screen
const QUIZ_TITLE = "Quiz Zone";
const QUIZ_SUBTITLE = "Test Your Skills & Win Rewards";
const START_QUIZ = "Start Quiz";
const QUESTIONS = "Questions";
const PRIZE_POOL = "Prize Pool";
const ACCEPT_QUIZ = "Accept";
const QUIZ_TNC = "terms & conditions";
const PLAY = "Play";

// Quiz Question Screen
const SUBMIT_AND_NEXT = "Submit & Next";
const NEXT = "Next";
const SUBMIT = "Submit";

// Login Screen
const TERMS_AND_PRIVACY_TEXT =
    "By entering your number, you are agreeing to our ";
const SEND_OTP_LABEL = "Send OTP";
const CONVERT_YOUR_SKILLS_TITLE = "Convert Your Skills into Wealth.";
const TERMS_OF_SERVICE = "terms of service";
const PRIVACY_POLICY = "privacy policy";
const VALID_MOBILE_NUMBER_VALIDATION_MESSAGE =
    "Please enter a valid mobile number";

// OTP verification Screen
const VERIFY_PHONE_NUMBER = 'Verify your \nphone number';
const DIDNT_RECEIVE_OTP = 'If you didn\'t receive otp yet. ';
const CONTINUE = 'Continue';
const EDIT_PHONE_NUMBER = 'Edit mobile number';
const RESEND_OTP = "Resend OTP";
const OTP_VALIDATION_MESSAGE = "Please enter a valid OTP";

// Create team drawer
const List<String> NEON_HEX_COLORS = [
  "F25F5C",
  "FFC300",
  "4682B4",
  "757575",
  "FFFACD",
  "90EE90",
  "2F4F4F",
  "696969",
  "808000",
  "BDB76B",
  "DDA0DD",
  "EE82EE",
  "FF0000",
  "FF00FF",
  "FF1493",
  "FF4500",
  "FF6347",
  "FF69B4",
  "FF7F50",
  "FF8C00",
  "FFA500",
  "FFB6C1",
  "FFC0CB",
  "FFD700",
  "FFFF00",
  "008000",
  "00FFFF",
  "4169E1",
  "800080",
  "A52A2A",
  "ADFF2F",
  "CD5C5C",
  "D2691E",
  "DAA520",
  "DC143C",
  "E9967A",
  "F0E68C",
  "FF7F50"
];
const TEAM_NAME = "Team Name";
const TEAM_ACCENT_COLOR = "Team Accent";
const JERSEY_ICON_PATH = "assets/icons/t-shirt-white.svg";
const SAVE = "Save";
const CREATE_YOUR_TEAM = "Create your team";
const TEAMS = "Teams";

// Notifications
const NOTIFICATIONS = "Notifications";
const CLEAR_ALL = "Clear All";

// Profile
const PROFILE = "Profile";
const PERSONAL_DETAILS = "Personal Details";
const WALLET = "Wallet";
const MY_ACTIVITY = "My Activity";
const KYC = "KYC";
const TERMS_AND_CONDITIONS = "Terms & Conditions";
const SUPPORT = "Support";

// Wallet
const NEED_HELP = "Need Help?";
const RECENT_TRANSACTIONS = "Recent Transactions";
const ALL_TRANSACTIONS = "All Transactions";
const TRANSACTION_ID = 'Txn ID:';
const ADD_MONEY = "Add Money";
const TOPUP_WALLET = "Topup Wallet";
const TOPUP_AMOUNTS = [1000, 500, 200, 50];
const RUPEE_SYMBOL = '\u20B9'; // Unicode for the Rupee symbol

//Tournament
const CREATE_TOURNAMENT = "Create Tournament";
const BID = "Bid";

//Public Challenge
const PUBLIC_CHALLENGE_TITLE = "New Discoveries";
const PUBLIC_CHALLENGE_SUBTITLE = "Unique experiences curated for you!";

//Private Challenge
const PRIVATE_CHALLENGE_TITLE = "Challenge Hub";
const PRIVATE_CHALLENGE_SUBTITLE = "Your Invites & Creations";

// Common
const HOME = 'Home';
const SEE_ALL = 'See All';
const ALL = 'All';
const DRAFT = 'Draft';
const LIVE = 'Live';
const CAPITAL_LIVE = 'LIVE';
const REQUEST = 'Request';
const RESULTS_PENDING = 'RESULTS_PENDING';
const UPCOMING = 'Upcoming';
const COMPLETED = 'Completed';
const CAMPAIGNS = 'Campaigns';

class PrivateChallengeStatus {
  final String label;
  final String displayName;

  const PrivateChallengeStatus(this.label, this.displayName);

  static const ALL = PrivateChallengeStatus('ALL', 'All');
  static const DRAFT = PrivateChallengeStatus('DRAFT', 'Draft');
  static const LIVE = PrivateChallengeStatus('LIVE', 'Live');
  static const REQUEST = PrivateChallengeStatus('REQUESTED', 'Request');
  static const RESULTS_PENDING =
      PrivateChallengeStatus('RESULTS_PENDING', 'Results Pending');
  static const UPCOMING = PrivateChallengeStatus('UPCOMING', 'Upcoming');
  static const COMPLETED = PrivateChallengeStatus('COMPLETED', 'Completed');
}

class PublicChallengeStatus {
  final String label;
  final String displayName;

  const PublicChallengeStatus(this.label, this.displayName);

  static const ALL = PublicChallengeStatus('ALL', 'All');
  static const LIVE = PublicChallengeStatus('LIVE', 'Live');
  static const RESULTS_PENDING =
      PublicChallengeStatus('RESULTS_PENDING', 'Results Pending');
  static const UPCOMING = PublicChallengeStatus('UPCOMING', 'Upcoming');
  static const COMPLETED = PublicChallengeStatus('COMPLETED', 'Completed');
}
