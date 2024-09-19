

import 'package:doer_flutter/models/featured_model.dart';
import 'package:doer_flutter/models/services_model.dart';

List<Featured> featureList = [
  Featured(
      heading: "Cross platform\nMobile Apps",
      subHeading:
          "Cross-platform mobile apps for seamless performance on both\niOS and Android devices.",
      image: "mobile-app.png"),
  Featured(
      heading: "Responsive Websites",
      subHeading:
          "Responsive websites that adapt seamlessly to all devices,\nenhancing user engagement and accessibility.",
      image: "responsive.png"),
  // Featured(
  //     heading: "Electromechanical Equipment Installation and Maintenance",
  //     subHeading: "Reliable Support for Your Electrical and Mechanical Systems",
  //     image: "electric.webp"),
];

List<Service> serviceList = [
  Service(
      name: "Website Development",
      description: [
        "Building custom websites that attract visitors and enhance your online visibility."
      ],
      image: "website.jpg",
      subServices: [
        SubService(
            name: "Medical Websites",
            description: [
              "Clinic Websites",
              "Hospital Websites",
              "Telemedicine Platforms",
              "Health Information Portals",
              "Medical E-commerce (Pharmacy)",
              "Patient Management Systems",
              "Healthcare Provider Directories"
            ],
            image: "website.jpg"),
        SubService(
            name: "Real Estate Websites",
            description: [
              "Property Listings",
              "Real Estate Agency Websites",
              "Property Management Systems",
              "Rental Platforms",
              "Commercial Real Estate",
              "Virtual Tour Integration",
              "MLS Integration"
            ],
            image: "website.jpg"),
        SubService(
            name: "E-commerce Websites",
            description: [
              "Retail Stores",
              "Marketplace Platforms",
              "Subscription Services",
              "Digital Products",
              "B2B E-commerce",
              "Dropshipping Websites",
              "Custom Product Builders",
            ],
            image: "website.jpg"),
        SubService(
            name: "Educational Websites",
            description: [
              "E-learning Platforms",
              "School Websites",
              "University Portals",
              "Online Course Websites",
              "Tutoring Platforms",
              "Educational Blogs",
              "Student Management Systems"
            ],
            image: "image"),
        SubService(
            name: "Corporate Websites",
            description: [
              "Business Consulting Websites",
              "Professional Services",
              "Financial Services",
              "Law Firm Websites",
              "Startup Websites",
              "Tech Company Websites",
              "Enterprise Solutions"
            ],
            image: "image"),
        SubService(
            name: "Entertainment Websites",
            description: [
              "Media & News Portals",
              "Streaming Services",
              "Event Management",
              "Music Websites",
              "Gaming Platforms",
              "Celebrity/Fan Sites",
              "Film and TV Show Sites"
            ],
            image: "image"),
        SubService(
            name: "Non-Profit Websites",
            description: [
              "Charity Organizations",
              "Environmental Groups",
              "Community Initiatives",
              "Fundraising Platforms",
              "Advocacy Groups",
              "Volunteer Management Systems",
              "Religious Organization Websites"
            ],
            image: "image"),
        SubService(
            name: "Portfolio Websites",
            description: [
              "Artist Portfolios",
              "Designer Portfolios",
              "Writer Portfolios",
              "Personal Branding",
              "Freelancer Showcases",
              "Case Study Displays",
            ],
            image: "image"),
        SubService(
            name: "Hospitality Websites",
            description: [
              "Hotel & Resort Websites",
              "Restaurant Websites",
              "Travel Agencies",
              "Tourism Portals",
              "Booking Systems",
              "Event Venues",
              "Food Delivery Service"
            ],
            image: "image"),
        SubService(
            name: "Blogging and Content Websites",
            description: [
              "Personal Blogs",
              "Corporate Blogs",
              "Magazine Websites",
              "Review Sites",
              "Content Aggregators",
              "Niche Blogs",
              "Influencer Websites"
            ],
            image: "image")
      ]),
  Service(
      name: "Mobile App Development",
      description: [
        "Creating apps that make things easier and more enjoyable on your phone."
      ],
      image: "app.jpg"),
  Service(
      name: "Software Development",
      description: [
        "Empowering businesses with innovative software development solutions."
      ],
      image: "software.jpg"),
  Service(
      name: "Digital Marketing",
      description: [
        "Promoting businesses online to reach more customers and grow sales."
      ],
      image: "digital.jpg"),
];

List<Service> businessList = [
  Service(
      name: "Branding",
      description: [
        "Elevate your business identity with our expert branding solutions."
      ],
      image: "branding.jpg"),
  Service(
      name: "Website",
      description: [
        "Create a stunning online presence with our custom website development services."
      ],
      image: "web.jpg"),
  Service(
      name: "Software",
      description: [
        "Transform your business with our cutting-edge software solutions."
      ],
      image: "soft.jpg"),
  Service(
      name: "Marketing",
      description: [
        "Boost your business growth with our effective marketing strategies."
      ],
      image: "marketing.jpg"),
];

// List<Service> serviceList = [
//   Service(
//       name:
//           "Air-Conditioning, Ventilations & Air Filtration Systems Installation & Maintenance",
//       description: [
//         "Air Conditioning Installation",
//         "Ventilation Systems Installation",
//         "Air Filtration System Installation",
//         "Maintenance Services",
//         "Emergency Repairs",
//         "Energy Efficiency Optimization",
//         "Custom Solutions",
//         "Compliance and Regulations",
//         "Technical Expertise",
//         "Customer Support"
//       ],
//       image: "ac-service.png"),
//   Service(
//       name: "Plaster Works",
//       description: [
//         "Surface Preparation",
//         "Material Selection",
//         "Application Techniques",
//         "Skimming",
//         "Repair Work",
//         "Decorative Effects",
//         "Quality Control",
//         "Drying and Curing",
//         "Surface Finishing",
//         "Cleanup and Site Maintenance",
//       ],
//       image: "plaster.png"),
//   Service(
//       name: "False Ceiling & Light Partitions Installation",
//       description: [
//         "Design Consultation",
//         "Material Selection",
//         "Installation Expertise",
//         "Customization Options",
//         "Lighting Solutions",
//         "Soundproofing",
//         "Compliance and Safety",
//         "Maintenance Advice",
//         "Project Management",
//         "Customer Satisfaction"
//       ],
//       image: "celling.png"),
//   Service(
//       name: "Carpentry & wood Flooring Works",
//       description: [
//         "Custom Carpentry",
//         "Material Selection",
//         "Precision Installation",
//         "Wood Flooring Installation",
//         "Flooring Restoration",
//         "Custom Finishes",
//         "Specialized Techniques",
//         "Structural Repairs",
//         "Environmental Sustainability",
//         "Customer Collaboration"
//       ],
//       image: "carpentry.png"),
//   Service(
//       name: "Electromechanical Equipment Installation and Maintenance",
//       description: [
//         "Installation Expertise",
//         "Safety Compliance",
//         "Equipment Calibration",
//         "Preventive Maintenance",
//         "Fault Diagnosis",
//         "Repair and Restoration",
//         "Emergency Response",
//         "Energy Efficiency Optimization",
//         "Documentation and Reporting",
//         "Continuous Training",
//       ],
//       image: "electromechanical.png"),
//   Service(
//       name: "Floor & Wall Tiling Works",
//       description: [
//         "Surface Preparation",
//         "Material Selection",
//         "Layout Planning",
//         "Tile Installation",
//         "Waterproofing",
//         "Custom Designs",
//         "Grout and Sealant Application",
//         "Expansion Joint Installation",
//         "Tile Restoration",
//         "Quality Assurance",
//       ],
//       image: "floor.png"),
//   Service(
//       name: "Engraving & Ornamentation Works",
//       description: [
//         "Custom Designs",
//         "Material Selection",
//         "Surface Preparation",
//         "Engraving Techniques",
//         "Ornamental Features",
//         "Customization Options",
//         "Historical Restoration",
//         "Surface Finishes",
//         "Collaborative Design Process",
//         "Quality Assurance"
//       ],
//       image: "engraving.png"),
//   Service(
//       name: "Swimming Pools Installation Works",
//       description: [
//         "Site Assessment",
//         "Design Consultation",
//         "Permitting and Regulations",
//         "Excavation and Groundwork",
//         "Structural Construction",
//         "Plumbing and Filtration Systems",
//         "Surface Finishes",
//         "Decking and Surroundings",
//         "Safety Features",
//         "Maintenance and Service",
//       ],
//       image: "swimming.png"),
//   Service(
//       name: "Plumbing & Sanitary Installation",
//       description: [
//         "Site Assessment",
//         "Design Planning",
//         "Material Selection",
//         "Water Supply System",
//         "Drainage System",
//         "Fixture Installation",
//         "Sanitary Ware Installation",
//         "Hot Water System",
//         "Gas Piping",
//         "Testing and Commissioning"
//       ],
//       image: "plumbing.png"),
//   Service(
//       name: "Electrical Fittings & Fixtures Repairing & Maintenance",
//       description: [
//         "Diagnostic Inspections",
//         "Troubleshooting",
//         "Repairs and Replacements",
//         "Preventive Maintenance",
//         "Safety Upgrades",
//         "Energy Efficiency Improvements",
//         "Code Compliance",
//         "Emergency Repairs",
//         "Documentation and Reporting",
//         "Customer Education"
//       ],
//       image: "electrical.png"),
// ];

List<String> partners = [
  'assets/images/carrier.png',
  'assets/images/smk.png',
  'assets/images/york.png',
  'assets/images/trane.png',
  'assets/images/rheem.png',
  'assets/images/mist.png',
];

List<String> missions = [
  "Exceptional Services: Provide high-quality HVAC and electromechanical services tailored to our clients' unique needs.",
  "Customer Satisfaction: Prioritize customer satisfaction by delivering reliable, efficient, and cost-effective solutions.",
  "Innovative Approach: Employ innovative techniques and the latest technologies to enhance performance and deliver superior results.",
  "Safety and Compliance: Maintain a strong commitment to safety and regulatory compliance in all projects.",
  "Sustainability: Promote sustainable practices in our work to reduce environmental impact and contribute to a greener future.",
  "Professional Development: Invest in continuous training and development for our team to maintain the highest industry standards.",
  "Community Engagement: Foster strong relationships with clients and the community by supporting local initiatives and causes.",
];

List<String> vision = [
  "Industry Leader: Establish Cool Makers as a trusted and respected leader in the HVAC and electromechanical industry.",
  "Innovative Solutions: Lead the way in developing and implementing cutting-edge solutions that improve efficiency and sustainability.",
  "Customer-Centric Focus: Continuously evolve our services to meet and exceed the changing needs and expectations of our clients.",
  "Excellence in Craftsmanship: Uphold the highest standards of craftsmanship and attention to detail in every project.",
  "Long-Lasting Partnerships: Build enduring partnerships with clients based on trust, transparency, and mutual respect.",
  "Global Impact: Extend our reach to serve clients beyond local boundaries, offering our services to international markets.",
  "Continuous Growth: Strive for continuous growth and improvement in all aspects of our business, from services to customer support."
];

List<Company> otherCompanies = [
  Company(
      name: "ONLITE ADVERTISEMENT DESIGNING & PRODUCING LLC",
      logo: "online.png",
      address:
          "201-A3,HEIRS OF AHMED OBAID BIN TOUQ AL MARRI BUILDING,AL MARARR,DUBAI-UAE,PO BOX NO : 87556",
      email: 'OVV.VISHNU@GMAIL.COM',
      phone: []
      // phone: ['+971 586885056', '+971 581958548'],
      ),
  // Company(
  //     name: "TERRAMET METAL WASTE TRADING LLC",
  //     logo: 'metal.png',
  //     address:
  //         "BUILDING NO : R364,AL KARAMA,DUBAI-UAE,Branch and stock yard : Near Noor Al Sajaa Pharmacy Sajaa Sharjah-UAE",
  //     email: 'OVV.VISHNU@GMAIL.COM',
  //     phone: ['+971 586885056'])
];

List<AboutUs> aboutUs = [
  AboutUs(heading: "Who We Are", description: [
    "Welcome to Doer 20s! We are a team of skilled professionals passionate about delivering top-notch software solutions. Our goal is to turn your ideas into reality with custom software that meets your needs."
  ]),
  AboutUs(
      heading: "What We Do",
      subHeading: "At Doer 20s, we offer:",
      description: [
        "Custom Software Development: Tailored software solutions for your business.",
        "Mobile App Development: Engaging apps for Android and iOS.",
        "Web Development: Responsive and user-friendly websites.",
        "Digital Marketing: Boosting your online presence with SEO, social media, and content marketing.",
        "IT Consulting: Expert advice to improve your IT strategy."
      ]),
  AboutUs(heading: "Why Choose Us", description: [
    "Expert Team: Our talented developers, designers, and marketers bring expertise to every project.",
    "Client Focus: We prioritize our clients with clear communication and collaboration.",
    "Quality: We deliver high-quality products, thoroughly tested for excellence.",
    "Innovation: We use the latest technology and best practices."
  ]),
  AboutUs(heading: "Our Values", description: [
    "Integrity: We work with honesty and transparency."
        "Innovation: We embrace new ideas and technology.",
    "Excellence: We strive for the best in everything we do.",
    "Collaboration: We believe in teamwork and strong client partnerships."
  ]),
  AboutUs(heading: "Contact Us", description: [
    "Ready to elevate your business? Contact Doer 20s today to see how we can help you achieve your goals with innovative software solutions."
  ])
];

class Company {
  final String name;
  final String logo;
  final String address;
  final String email;
  final List<String> phone;
  Company({
    required this.email,
    required this.phone,
    required this.name,
    required this.logo,
    required this.address,
  });
}

class AboutUs {
  final String heading;
  final String? subHeading;
  final List<String> description;
  AboutUs({required this.heading, this.subHeading, required this.description});
}
