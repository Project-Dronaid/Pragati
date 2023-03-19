import 'package:flutter/material.dart';

bool showOnboarding = true;
List<String> communitesNames = [
  'Business Associations',
  'Women\'s groups',
  'Social media groups',
  'Local Community organisations',
  'Co-working spaces',
  'Entrepreneurship programs',
  'Mentorship programs'
];
List<String> communitiesImages = [
  'assets/Communities/BusinessAssociation.jpeg',
  'assets/Communities/WomensGroups.jpeg',
  'assets/Communities/SocialMedia.jpeg',
  'assets/Communities/LocalCommunity.jpeg',
  'assets/Communities/coworkingspace.jpeg',
  'assets/Communities/EntrepreneurshipProgram.jpeg',
  'assets/Communities/MentorshipPrograms.jpeg',
];
List<String> communitiesMembers = [
  '124',
  '102',
  '189',
  '100',
  '152',
  '210',
  '115',
];

List<String> commImg = [
  "assets/CommImg/bsa.jpeg",
  "assets/CommImg/wg.jpeg",
  "assets/CommImg/smg.avif",
  "assets/CommImg/mg.jpeg",
  "assets/CommImg/cws.jpeg",
  "assets/CommImg/eg.jpeg",
  "assets/CommImg/lco.jpeg"
];

List<String> commInfo = [
  "These are groups of entrepreneurs who come together to network, share ideas, and collaborate on projects. Examples include the Chamber of Commerce, local business associations, and industry-specific associations.",
  "These are groups of women who come together to support each other in their personal and professional lives. Examples include women's business networks, Women in Business groups, and women's leadership groups.",
  "There are many online communities on platforms such as Facebook and LinkedIn that are dedicated to entrepreneurship and business. Joining these groups can provide access to a large network of peers and mentors.",
  "These include groups such as the Rotary Club, Lions Club, and Kiwanis Club. They are often focused on community service but also provide networking opportunities for entrepreneurs.",
  "These are shared workspaces where entrepreneurs can rent a desk or office space. They often provide networking events and workshops for members.",
  "Many universities, community colleges, and non-profit organizations offer entrepreneurship programs and workshops for aspiring entrepreneurs. These can be a great way to learn new skills and connect with other entrepreneurs.",
  "There are many mentorship programs available for entrepreneurs, such as SCORE, which pairs entrepreneurs with experienced business professionals."
];

List<bool> commJoined = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<int> selectedCommIndex = [];
List<String> messageComm = [
  "Find about Meeting Timmings,.\n\nImportant Emails.\n\nNewsletter from different companies.\n\nSurveys done on recent issues",
  "Get to know about nearby Workshops and Training Programs near by.\n\nGet to know about other Online forums and groups.\n\nCheck Newsletters of different companies.\n\nConnect with successfull people on their socials.\n\nSchedule One-on-One meetings with othrt rural professionals",
  "Find people for networking and collaborating.\n\nShare information about your recent achievements.\n\nYou can do promotion about your business.\n\nConduct Q&A sessions.\n\nShare inspiring stories",
  "Find information about nearby Workshops and seminars.\n\nStay tuned for social events.\n\nBe active for collaborative projects.\n\nLearn about improving public relations.\n\nShowcase your online presence explore different opportunites",
  "Try to get into Informal Conversations with other entrepreneurs.\n\nFigure about more collaboration tools.\n\nConduct Workshops and training sessions to more number of women.\n\nParticipate in other networking events.\n\nJoin in some important community events",
  "Get to see a lot of Online Forums and groups.\n\nUse the feature of face to face meeting.\n\nHave a look on email newsletters.\n\nRegister yourself for workshops by government nearby.\n\nLookout for some mentorship programs",
  "Use our one-on-one meeting feature.\n\nSchedule group calls with like minded people.\n\nLearn about online communication & promotion tools.\n\nStay tune for workshops and training sessions.\n\nCheck out for networking events going on nearby"
];

List<List<String>> DiscussionForum = [
  commResBA,
  commResWG,
  commResSMG,
  commResLCO,
  commResCWS,
  commResEP,
  commResMP
];

List<String> commResCWS = [
  "Informal conversations: Informal conversations are an important way for rural women entrepreneurs in a co-working space to connect with one another. These conversations can take place during breaks, lunch, or other informal settings and can lead to new ideas and collaborations.",
  "Collaboration tools: Collaboration tools such as Google Drive, Trello, and Slack can be used to help rural women entrepreneurs in a co-working space collaborate on projects. These tools allow members to share information, assign tasks, and communicate with one another in real-time.",
  "Workshops and training sessions: Workshops and training sessions can be held in a co-working space to help rural women entrepreneurs develop new skills and knowledge. These sessions can be led by members of the co-working space or outside experts.",
  "Networking events: Networking events can be held in a co-working space to help rural women entrepreneurs connect with other professionals in the industry. These events can be used to promote the businesses and services of members and to share information about industry news and trends.",
  "Community events: Co-working spaces can also be used to host community events such as pop-up shops, art exhibits, or other events that showcase the businesses and services of members. These events can help build relationships with the local community and lead to new business opportunities for members.",
];

List<String> commResEP = [
  "Online forums and groups: Online forums and groups such as Facebook groups or LinkedIn groups can be used to connect rural women entrepreneurs from different locations. These groups can be used to share information, discuss industry news, and provide support to one another.",
  "Face-to-face meetings: Face-to-face meetings can be used to build personal relationships and establish trust among rural women entrepreneurs. These meetings can be held at events, conferences, or other industry gatherings.",
  "Email newsletters: Email newsletters can be used to keep rural women entrepreneurs updated on industry news, upcoming events, and other relevant information. Newsletters can also be used to promote the businesses and services of members.",
  "Workshops and training sessions: Workshops and training sessions can be held to help rural women entrepreneurs develop new skills and knowledge. These sessions can be led by members of the group or outside experts.",
  "Mentorship programs: Mentorship programs can be established to connect experienced rural women entrepreneurs with those who are just starting out. These programs can provide guidance, support, and inspiration to new entrepreneurs and help them succeed in their businesses.",
];

List<String> commResMP = [
  "One-on-one meetings: One-on-one meetings between mentors and mentees are an essential form of communication. These meetings can provide an opportunity for mentees to ask questions, receive feedback, and receive guidance on their business ideas.",
  "Group meetings: Group meetings can provide a supportive environment where rural women entrepreneurs can connect and share their experiences. These meetings can be used to discuss industry news, provide updates on business progress, and share best practices.",
  "Online communication tools: Online communication tools such as email, instant messaging, or video conferencing platforms can be used to facilitate communication between mentors and mentees. These tools can help to overcome geographic barriers and allow mentors and mentees to stay in touch more frequently.",
  "Workshops and training sessions: Workshops and training sessions can be held to provide mentorship and education to rural women entrepreneurs. These sessions can be led by mentors or outside experts and can provide practical knowledge and skills relevant to the mentees' businesses.",
  "Networking events: Networking events can be held to connect mentees with other rural women entrepreneurs and industry professionals. These events can provide opportunities for mentees to learn about the industry and meet potential clients, suppliers, and partners."
];

List<String> commResBA = [
  "Meetings: Regular meetings are an essential communication tool for a business association group. They provide an opportunity for members to discuss important issues, share updates, and make decisions. Meetings can be held in-person or online and should be scheduled at a regular time and place to ensure consistency.",
  "Emails: Emails are a quick and easy way to communicate important information to all members of a business association group. They can be used to share updates, distribute meeting agendas and minutes, and coordinate events.",
  "Social media: Social media platforms such as LinkedIn and Twitter can be used to communicate with members of a business association group. These platforms can be used to share news and updates, promote events, and connect with other professionals in the industryn.",
  "Newsletters: Newsletters are a great way to keep members of a business association group informed about important news and events. They can be distributed on a regular basis and should include updates on industry news, association events, and member news.",
  "Surveys: Surveys can be used to gather feedback from members of a business association group. This feedback can be used to improve the services provided by the association and to better understand the needs and interests of the members. Surveys can be distributed online or in-person and should be kept short and focused."
];

List<String> commResWG = [
  "Workshops and training sessions: Workshops and training sessions are an effective way to communicate important information and skills to members of a rural women entrepreneurs group. These sessions can cover a range of topics, including business planning, financial management, marketing, and networking.",
  "Online forums and groups: Online forums and groups can be used to connect members of a rural women entrepreneurs group who are located in different areas. These platforms can be used to share information, ask questions, and provide support to one another.",
  "Newsletters: Newsletters are a great way to keep members of a rural women entrepreneurs group informed about important news and events. They can be distributed on a regular basis and should include updates on industry news, association events, and member news.",
  "Social media: Social media platforms such as Facebook and Instagram can be used to promote the products and services of members of a rural women entrepreneurs group. These platforms can also be used to connect with potential customers and partners, as well as share success stories and updates.",
  "One-on-one meetings: One-on-one meetings between members of a rural women entrepreneurs group can be used to build relationships and share information. These meetings can be used to discuss challenges, seek advice, and provide support to one another.",
];

List<String> commResSMG = [
  "Networking: Rural women entrepreneurs social media groups can be used to network and connect with other professionals in the industry. Members can share information about their businesses, seek advice, and collaborate on projects.",
  "Sharing information: Members can use social media groups to share information about industry news, upcoming events, and other resources that may be helpful to rural women entrepreneurs.",
  "Promotion: Social media groups can be used to promote the products and services of members. Members can share links to their websites, online stores, or social media profiles, and can also share photos and videos of their products.",
  "Q&A Sessions: Regular Q&A sessions can be held on social media platforms where members can ask and answer questions related to their businesses. This is a great way for rural women entrepreneurs to learn from one another and share their knowledge and experience.",
  "Inspiring Stories: Social media groups can be used to share inspiring stories about the successes and challenges of rural women entrepreneurs. These stories can motivate and inspire other members of the group and help build a sense of community and support."
];

List<String> commResLCO = [
  "Workshops and seminars: Workshops and seminars are a great way to bring together rural women entrepreneurs and local community organizations to share knowledge and experience. These events can cover topics such as marketing, business planning, financial management, and networking.",
  "Social events: Social events, such as networking receptions, can be used to bring together rural women entrepreneurs and members of local community organizations in a relaxed and informal setting. These events can help build relationships and connections that can lead to future business opportunities.",
  " Collaborative projects: Rural women entrepreneurs can work with local community organizations on collaborative projects that benefit both parties. These projects could involve community service, fundraising, or other initiatives that help promote the businesses and services of the rural women entrepreneurs.",
  " Public relations: Rural women entrepreneurs can work with local community organizations to improve their public relations efforts. This could involve media outreach, community events, or other efforts to improve the visibility and reputation of the businesses and services offered by the rural women entrepreneurs.",
  " Online presence: Rural women entrepreneurs can use social media and other online channels to connect with local community organizations and promote their businesses and services. This could include sharing news and updates, participating in online forums and groups, or running targeted online advertising campaigns."
];

List<List<String>> SessionForum = [
  commSessBA,
  commSessWG,
  commSessSMG,
  commSessLCO,
  commSessCWS,
  commSessEP,
  commSessMP
];

List<String> commSessBA = [
  "Session 1: Introduction and Needs Assessment\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women entrepreneurs.\nIdentify the specific needs of the participants, such as access to resources, mentorship, or networking opportunities.",
  "Session 2: Business Planning and Strategy\nHost a workshop on business planning and strategy, covering topics such as market research, financial planning, and legal considerations.\nWork with participants to develop or refine their business plans and strategies.",
  "Session 3: Marketing and Sales\nHost a workshop on marketing and sales, covering topics such as branding, customer acquisition, and product placement.\nProvide hands-on training and support to help participants develop effective marketing and sales strategies.",
  "Session 4: Collaborative Opportunities\nHost a networking event or facilitate a collaboration among participants.\nProvide opportunities for participants to connect with each other, share resources, and build partnerships.",
  "Session 5: Advocacy and Community Engagement\nDiscuss the importance of advocacy and community engagement in supporting rural women entrepreneurs.\nWork with participants to identify key issues affecting their businesses and develop a plan for advocacy and engagement with local and regional stakeholders.",
];

List<String> commSessWG = [
  "Session 1: Introduction and Needs Assessment\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women entrepreneurs.\nIdentify the specific needs of the participants, such as access to resources, mentorship, or networking opportunities.",
  "Session 2: Business Planning\nHost a workshop on business planning, covering topics such as market research, financial planning, and legal considerations.\nWork with participants to develop a business plan for their venture.",
  "Session 3: Marketing and Sales\nHost a workshop on marketing and sales, covering topics such as branding, customer acquisition, and product placement.\nProvide hands-on training and support to help participants develop effective marketing and sales strategies.",
  "Session 4: Networking and Collaboration\nHost a networking event or facilitate a collaboration among participants.\nProvide opportunities for participants to connect with each other, share resources, and build partnerships.",
  "Session 5: Mentorship and Support\nDiscuss the importance of mentorship and support in building a successful business.\nProvide opportunities for participants to receive ongoing mentorship and support from experienced entrepreneurs or business professionals.",
];

List<String> commSessSMG = [
  "Session 1: Introduction and Needs Assessment\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women entrepreneurs.\nIdentify the specific needs of the participants, such as access to social media marketing skills, digital literacy, or networking opportunities.",
  "Session 2: Social Media Strategy\nDiscuss the importance of social media in marketing and building a successful business.\nWork with participants to identify their target audience and develop a social media strategy that meets their needs and goals.",
  "Session 3: Content Creation\nHost a workshop on content creation for social media platforms, such as photography, video editing, and graphic design.\nProvide hands-on training and support to help participants create high-quality, engaging content.",
  "Session 4: Social Media Advertising and Analytics\nDiscuss the different options for social media advertising and how to use analytics to measure success.\nWork with participants to develop and implement a social media advertising campaign that meets their needs and goals.",
  "Session 5: Building a Social Media Community\nDiscuss the importance of building a social media community and engaging with followers.\nWork with participants to develop strategies for building and engaging with their social media community, such as hosting giveaways or live Q&A sessions.",
];
List<String> commSessLCO = [
  "Session 1: Introduction and Needs Assessment\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women.\nIdentify the specific needs of the participants, such as access to healthcare, education, or networking opportunities.",
  "Session 2: Community Resource Mapping\nIdentify the available resources and services in the community, such as healthcare providers, education institutions, and government agencies.\nMap out the resources and services and discuss how to access them.",
  "Session 3: Health and Wellness\nHost a workshop on health and wellness topics relevant to the participants, such as nutrition, stress management, or exercise.\nProvide hands-on training and support to help participants improve their health and wellness.",
  "Session 4: Entrepreneurship and Financial Literacy\nHost a workshop on entrepreneurship and financial literacy topics relevant to the participants, such as budgeting, savings, and business planning.\nProvide hands-on training and support to help participants develop and apply new skills.",
  "Session 5: Community Engagement and Advocacy\nDiscuss the importance of community engagement and advocacy in creating positive change in the community.\nWork with participants to identify community issues they care about and develop a plan for advocacy and engagement."
];

List<String> commSessCWS = [
  "Session 1: Introduction and Needs Assessment\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women entrepreneurs.\nIdentify the specific needs of the participants, such as access to workspace, technology, or networking opportunities.",
  "Session 2: Co-Working Space Orientation\nProvide an orientation to the co-working space and its amenities.\nDiscuss the policies and procedures for using the space, including how to reserve space and access resources.",
  "Session 3: Skills-Building Workshop\nHost a workshop on a specific skill that is relevant to the participants, such as digital marketing, website design, or customer service.\nProvide hands-on training and support to help participants develop and apply new skills.",
  "Session 4: Networking and Collaboration\nHost a networking event or facilitate a collaboration among participants.\nProvide opportunities for participants to connect with each other, share resources, and build partnerships.",
  "Session 5: Wrap-Up and Next Steps\nReview the progress made during the program and discuss any challenges or opportunities that arose.\nProvide guidance and support to help participants continue their entrepreneurial journeys beyond the program.\nEncourage participants to stay connected and continue collaborating with each other.",
];

List<String> commSessEP = [
  "Session 1: Introduction and Identifying Needs\nIntroduce the program and participants, and discuss the unique challenges and opportunities facing rural women entrepreneurs.\nIdentify the specific needs of the participants, such as access to capital, marketing skills, or business planning.",
  "Session 2: Market Research and Business Planning\nDiscuss the importance of market research in developing a successful business.\nWork with participants to identify their target market and develop a business plan that meets their needs and goals.",
  "Session 3: Financing and Budgeting\nDiscuss the different sources of financing available to rural women entrepreneurs, including loans, grants, and crowdfunding.\nWork with participants to develop a budget and financial plan for their business.",
  "Session 4: Marketing and Branding\nDiscuss the importance of branding and marketing in building a successful business.\nWork with participants to develop a marketing strategy that meets their needs and goals, including social media, advertising, and other promotional activities.",
  "Session 5: Pitching and Networking\nDiscuss the importance of networking and pitching skills in growing a business.\nWork with participants to develop an elevator pitch and networking strategy that will help them build connections and promote their business."
];
List<String> commSessMP = [
  "Session 1: Introduction and Goal Setting\nThe mentor and mentee introduce themselves and discuss their backgrounds and goals for the mentorship.\nTogether, they set specific, measurable, achievable, relevant, and time-bound (SMART) goals for the program.",
  "Session 2: Skill Assessment and Development\nThe mentor and mentee identify the mentee's strengths and areas for improvement.\nThey discuss strategies for developing the mentee's skills and identify resources to support skill development.",
  "Session 3: Career Development and Planning\nThe mentor and mentee discuss the mentee's career aspirations and develop a plan for achieving those goals.\nThey discuss strategies for networking, building a professional brand, and developing a career path.",
  "Session 4: Leadership and Communication\nThe mentor and mentee discuss leadership and communication skills, and how they relate to the mentee's goals.\nThey identify opportunities for the mentee to develop and practice these skills.",
  "Session 5: Reflection and Next Steps\nThe mentor and mentee reflect on their progress and discuss what they have learned.\nThey identify any remaining goals or areas for improvement and develop a plan for continued growth and development.\nThey discuss opportunities for ongoing support and collaboration beyond the mentorship program.",
];

List<String> commUsers = [
  "Anjali",
  "Basanti",
  "Chanda",
  "Devika",
  "Gita",
  "Hema",
  "Indira",
  "Jyoti",
  "Kavita",
  "Lakshmi",
  "Meena",
  "Nirmala",
  "Pooja",
  "Radha",
  "Sita",
  "Tulsi",
  "Usha",
  "Vani",
  "Yashoda",
  "Zainab"
];

class BotMessageWidget extends StatelessWidget {
  const BotMessageWidget({
    super.key,
    required this.width,
    required this.message,
  });

  final double width;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAF8F1),
      width: double.infinity,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffCF6F5A),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.0),
                        bottomRight: Radius.circular(26.0),
                        bottomLeft: Radius.circular(26.0)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8),
                  child: Text(
                    '${DateTime.now().hour} ${DateTime.now().minute}',
                    style: TextStyle(
                        color: Color(0xffBCBCBC),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class OwnMessageWidget extends StatelessWidget {
  const OwnMessageWidget({
    super.key,
    required this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAF8F1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26.0),
                          bottomRight: Radius.circular(26.0),
                          bottomLeft: Radius.circular(26.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Text(
                        message,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8),
                    child: Text(
                      '${DateTime.now().hour} ${DateTime.now().minute}',
                      style: TextStyle(
                          color: Color(0xffBCBCBC),
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
