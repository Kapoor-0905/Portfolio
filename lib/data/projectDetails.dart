import 'package:kapoor_0905/utils/assets.dart';

class Details {
  final String companyName;
  final String projectName;
  final String projectIcon;
  final String projectBg;
  final String projectDescription;
  final List<String> projectAssets;
  final String projectTimeline;
  final String devRole;
  final String teamSize;
  final String projectDuration;
  final String languages;
  final String countries;
  final String category;
  final Map<String, dynamic> links;
  final String categoryIcon;
  final String platforms;
  final String? companyWebsite;

  Details({
    required this.companyName,
    required this.projectName,
    required this.projectIcon,
    required this.projectBg,
    required this.projectDescription,
    required this.projectAssets,
    required this.projectTimeline,
    required this.devRole,
    required this.teamSize,
    required this.projectDuration,
    required this.languages,
    required this.countries,
    required this.category,
    required this.categoryIcon,
    required this.platforms,
    required this.links,
    this.companyWebsite,
  });
}

// Crezam Data
final Details crezam = Details(
  links: {
    "android":
        "https://play.google.com/store/apps/details?id=com.crezam.crezam&pcampaignid=web_share",
    "ios": "",
    "web": "",
  },
  companyName: "Crezam",
  projectName: "Crezam",
  projectIcon: Assets.crezamlogo,
  projectBg: Assets.crezam,
  projectDescription:
      "Crezam is a dynamic AI-Powered ecosystem which connects the right talent with the perfect opportunity.\nThe application provides the perfect platform to make proof-of-work portfolios in the most presentable manner which drives the AI Engine to analyze and recommend the perfect matches for various job openings - Full-time, internships and even outsourced projects.\nThe unique proposition of the AI engine is that - upon analysis of the portfolio, it also presents candidates with improvement area analysis as well as curated courses that can be availed on the platform.",
  projectAssets: [
    // "images/crezam.png",
    // "images/kharchapani.png",
    // "images/kharchapanibg.png",
  ],
  projectTimeline: "March 2024 - Present",
  devRole: "Flutter Developer Intern",
  teamSize: "3 - 10",
  projectDuration: "Ongoing",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.business,
  category: "Business Tool",
  platforms: "Android, iOS",
);

// Quickcare Data
final Details quickcare = Details(
  links: {
    "android": "",
    "ios": "",
    "web": "",
  },
  companyName: "Quickcare",
  projectName: "Quickcare",
  projectIcon: Assets.quickcare,
  projectBg: Assets.quickcarebg,
  projectDescription:
      "In today's rapidly evolving landscape, the demand for accessible and efficient healthcare services has never been greater. The convergence of technology and healthcare has ushered in a new era of innovation, offering solutions tailored to the diverse needs of individuals and organizations alike. At the forefront of this transformation stands the Quickcare app, poised to revolutionize the way people interact with infirmary services. By seamlessly integrating scheduling functionalities with responsive mechanisms for urgent healthcare needs, Quickcare epitomizes efficiency and convenience in healthcare management.",
  projectAssets: [
    // "images/quickcare.png",
    // "images/quickcarebg.png",
  ],
  projectTimeline: "January 2024 - Present",
  devRole: "Flutter Developer",
  teamSize: "2",
  projectDuration: "Ongoing",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.healthcare,
  category: "Healthcare & Management",
  platforms: "Android, iOS",
);

// Musclegrm Data
final Details musclegrm = Details(
  links: {
    "android":
        "https://play.google.com/store/apps/details?id=com.musclegrm.musclegrm&pcampaignid=web_share",
    "ios": "",
    "web": "",
  },
  companyName: "MuscleGrm",
  projectName: "MuscleGrm",
  projectIcon: Assets.musclegrm,
  projectBg: Assets.musclegrmbg,
  projectDescription:
      "MuscleGrm, Your all-in-one fitness application that can help you transform your physique and achieve your fitness goals with the help of science-backed workouts and fully customizable nutrition guides specifically designed according to athlete goals & preferences at the minimum possible cost. Our applications will help you save your time and money and make it possible for you to get the best results within a shortest period of time.",
  projectAssets: [
    // "images/musclegrm.png",
    // "images/musclegrmbg.png",
  ],
  projectTimeline: "May 2023 - September 2023",
  devRole: "Flutter Developer",
  teamSize: "1",
  projectDuration: "4 months",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.healthfitness,
  category: "Health & Fitness",
  platforms: "Android",
);

// curiosify
final Details curiosify = Details(
  links: {
    "android":
        "https://play.google.com/store/apps/details?id=com.curiosify.app&pcampaignid=web_share",
    "ios": "",
    "web": "",
  },
  companyName: "Curiosify",
  projectName: "Curiosify",
  projectIcon: Assets.curiosify,
  projectBg: Assets.curiosifybg,
  projectDescription: "Explore STEM in 60seconds !",
  projectAssets: [
    // "images/curiosify.png",
    // "images/curiosifybg.png",
  ],
  projectTimeline: "June 2023 - April 204",
  devRole: "Flutter Developer",
  teamSize: "3",
  projectDuration: "10 months",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.education,
  category: "Education",
  platforms: "Android, iOS",
);

// Careerasta

final Details careerasta = Details(
  links: {
    "android": "",
    "ios": "",
    "web": "https://career-test-flutter.web.app/",
  },
  companyName: "NetStratix Technologies Pvt. Ltd.",
  projectName: "Career Raasta",
  projectIcon: Assets.careerasta,
  projectBg: Assets.careerastabg,
  projectDescription: "",
  projectAssets: [
    // "images/careerasta.png",
    // "images/careerastabg.png",
  ],
  projectTimeline: "June 2024 - July 2024",
  devRole: "Flutter Developer",
  teamSize: "1",
  projectDuration: "1 month",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.education,
  category: "Education",
  platforms: "Web",
);

// Jancare
final Details jancare = Details(
  links: {
    "android": "",
    "ios": "",
    "web": "",
  },
  companyName: "BIRAC",
  projectName: "Jancare",
  projectIcon: Assets.jancare,
  projectBg: Assets.jancarebg,
  projectDescription: "",
  projectAssets: [
    // "images/jancare.png",
    // "images/jancarebg.png",
  ],
  projectTimeline: "January 2024 - March 2024",
  devRole: "Flutter Developer",
  teamSize: "1",
  projectDuration: "3 months",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.healthcare,
  category: "Healthcare",
  platforms: "Android, iOS",
);

// Kharchapani
final Details kharchapani = Details(
  links: {
    "android": "",
    "ios": "",
    "web": "",
  },
  companyName: "Kapoor0905",
  projectName: "Kharcha Pani",
  projectIcon: Assets.kharchapani,
  projectBg: Assets.kharchapanibg,
  projectDescription: "",
  projectAssets: [
    // "images/kharchapani.png",
    // "images/kharchapanibg.png",
  ],
  projectTimeline: "July 2024 - Present",
  devRole: "Flutter Developer",
  teamSize: "1",
  projectDuration: "Ongoing",
  languages: "English",
  countries: "India",
  categoryIcon: Assets.rupee,
  category: "Productivity & Finance",
  platforms: "Android, iOS",
);
