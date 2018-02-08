BEGIN TRANSACTION;
CREATE TABLE categories(
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE
);
INSERT INTO "categories" VALUES(0,'audio_video_player');
INSERT INTO "categories" VALUES(1,'comments');
INSERT INTO "categories" VALUES(2,'customer_interaction');
INSERT INTO "categories" VALUES(3,'pornvertising');
INSERT INTO "categories" VALUES(4,'advertising');
INSERT INTO "categories" VALUES(5,'essential');
INSERT INTO "categories" VALUES(6,'site_analytics');
INSERT INTO "categories" VALUES(7,'social_media');
INSERT INTO "categories" VALUES(8,'misc');
INSERT INTO "categories" VALUES(9,'cdn');
INSERT INTO "categories" VALUES(10,'hosting');
INSERT INTO "categories" VALUES(11,'unknown');
INSERT INTO "categories" VALUES(12,'extensions');
CREATE TABLE companies(
    id TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    about_us_url TEXT,
    privacy_contact_url TEXT,
    privacy_url TEXT,
    website_url TEXT,
    in_their_own_words TEXT,
    logo_url TEXT,
    ghostery_id TEXT
);
INSERT INTO "companies" VALUES('juicyads','JuicyAds','Juicy Ads is an adult advertising marketplace for publishers to sell ads and earn money, as well as for advertisers looking to buy traffic.
','http://www.juicyads.com/aboutus.php','Not found','http://www.juicyads.com/tos.php','http://www.juicyads.com/','"JuicyAds is the sexy advertising network. It is a marketplace for Publishers to increase their revenues by selling ad space to Advertisers. We specialize in Direct Buy ads on specific websites and targetted Run of Network campaigns."','http://cdn.betteradvertising.com/logos/juicyads1.png','806');
INSERT INTO "companies" VALUES('clicky','Clicky','Clicky is a web analytics platform that provides real-time data to publishers for reporting purposes. The platform supports affiliate partnerships, tracking users with blocked javascript tags as well as filtering and segmenting audiences. Clicky is a product of Roxr Software.','http://clicky.com/help/','Not found','http://clicky.com/terms','http://clicky.com/','"Everything in Clicky is up-to-the-minute real time.  Not just a few things (*cough* Google Analytics).  Everything.
Ridiculous detail
Most reports provide a high level of detail on every segment of visitors. You can filter and sort by any column to quickly find what''s working and what needs improvement.
Individual visitors and actions
Clicky lets you see every visitor and every action they take on your web site, with the option to attach custom data to visitors, such as usernames or email addresses. Analyze each visitor individually and see their full history.
Heatmaps
In addition to standard per-page heatmaps, Clicky also lets you view heatmaps for individual visitor sessions, including segmentation. For example, you can view heatmaps only for visitors who completed a specific goal. Heatmap data is real time.
On-site analytics
You (and only you) will see the on-site analytics widget in the corner of your web site. See how many total visitors are on your site and how many are on the page you''re currently viewing, with the ability to view those visitors right from the widget. Heatmaps and heatmap segmentation can be launched from the widget as well.
Uptime monitoring
Clicky alerts you when your site goes offline so you can react immediately. Your site''s uptime is monitored from 5 geographic locations around the world and alerts are only sent when a majority of the monitoring servers agree that your site is down."
','http://cdn.betteradvertising.com/logos/clicky.png','312');
INSERT INTO "companies" VALUES('c1_exchange_','C1 Exchange ','None','http://c1exchange.com/about','http://c1exchange.com/contact','http://c1exchange.com/policy','http://c1exchange.com/','C1X is an independent technology leader that helps brands and their agencies find difficult-to-source audiences directly and transparently from leading premium publishers. Its data-driven digital advertising platform facilitates a friction-free marketplace for both publishers and advertisers with easy to execute direct connections, delivering industry-leading visibility and viewability. The C1X Platform offers an Audience Guarantee approach to provide buyers and sellers smooth participation in private marketplaces without having to rely on Deal IDs. The C1X Platform hosts access to inventory from more than 2,000 premium sites globally, including a growing list of premium publishers in the U.S.','http://cdn.betteradvertising.com/logos/c1exchange.png','4897');
INSERT INTO "companies" VALUES('alexa','Alexa','Alexa ranks web sites based on tracking information from users of the Alexa Toolbar for Internet Explorer and from integrated sidebars in Mozilla and Netscape. It is employed by websites to measure their traffic. Alexa is an Amazon.com company.',' http://www.alexa.com/about','Not found','http://www.alexa.com/help/privacy','http://www.alexa.com/','"Alexa Internet grew out of a vision of intelligent Web navigation constantly improving through its users. Since then, our Alexa users have downloaded millions of Toolbars, and Alexa has created one of the largest Web crawls, and developed the infrastructure to process and serve massive amounts of data."','http://cdn.betteradvertising.com/logos/alexa.png','13');
INSERT INTO "companies" VALUES('loggly','Loggly','None','https://www.loggly.com/about/','https://www.loggly.com/about/contact/','https://www.loggly.com/about/privacy-policy/','https://www.loggly.com/','"Loggly is a San Francisco startup developing the world''s most popular cloud based logging platform. We have built a highly scalable log management service as a platform which provides great value for the entire organization."','http://cdn.betteradvertising.com/logos/loggly.png','2283');
INSERT INTO "companies" VALUES('ad4mat','ad4mat','None','http://www.ad4mat.com/en/about/',' http://www.ad4mat.com/en/contact/',' http://www.ad4mat.com/en/privacy/',' http://www.ad4mat.com/en/','"European Premium Performance Network"','http://cdn.betteradvertising.com/logos/ad4mat2.png','2191');
INSERT INTO "companies" VALUES('buysellads.com','BuySellAds.com','BuySellAds.com is an online ad exchange that advocates transparency in buying and selling ads online. Its advertising clients can select the website they want to place ads on and pay for the ad directly.  Buysellads.com does not mark up prices beyond what the website owners set as their own price.','http://buysellads.com/about','https://www.buysellads.com/about/contact','http://buysellads.com/about/privacy','http://buysellads.com/','"We help online advertisers and website publishers buy and sell ads better."','http://cdn.betteradvertising.com/logos/buysellads.com1.png','278');
INSERT INTO "companies" VALUES('tumblr','Tumblr','Tumblr is a platform for blogging and sharing online content. Their customizable tools let users post text, photos, quotes, links, music, and videos, from web browsers, phones, desktop and email.','https://www.tumblr.com/about','Not found','https://www.tumblr.com/policy/en/privacy','http://www.tumblr.com/','"Tumblr lets you effortlessly share anything. Post text, photos, quotes, links, music, and videos, from your browser, phone, desktop, email, or wherever you happen to be."','Not found','172');
INSERT INTO "companies" VALUES('brightcove','Brightcove','Brightcove is an online video platform that provides software for publishing and distributing professional video on the Web. Brightcove''s video-management services include hosting videos as well as translating videos into formats for different devices. Their services also assist companies in tracking where their videos are being watched, and help manage advertising.','https://www.brightcove.com/en/company/about','http://go.brightcove.com/forms/contact-sales/?_ga=1.129639244.1165263782.1467064719','http://www.brightcove.com/en/privacy','http://www.brightcove.com/en/','"Brightcove Inc., a leading global provider of cloud content services, provides a family of products used to publish and distribute the world''s professional digital media. The company''s products include Brightcove Video Cloud, the market-leading online video platform, and Brightcove App Cloud, the pioneering content app platform."','http://cdn.betteradvertising.com/logos/brightcove.png','683');
INSERT INTO "companies" VALUES('sonobi','Sonobi','"We''re a digital display advertising company Sonobi Media. We bring web publishers and advertisers together via a single buying and selling solution tuned to enable publishers to maximize ad revenue and advertisers to buy quality impressions."',' http://sonobi.com/about/','http://sonobi.com/contact/','http://sonobi.com/privacy-policy/','http://sonobi.com/','“We bring web publishers and advertisers together via a single buying and selling solution tuned to enable publishers to maximize ad revenue and advertisers to buy quality impressions.”','http://cdn.betteradvertising.com/logos/sonobi_logo.PNG','1412');
INSERT INTO "companies" VALUES('raygun','Raygun','None','https://raygun.com/about','https://raygun.com/about/contact','https://raygun.com/privacy','https://raygun.com/','A Little About Us
Behind every great company there are great people. Raygun is no exception and we strive to deliver the highest quality service and tools for our customers all around the world.

Raygun helps 30,000 developers globally build better software and be the best developers they can be. Our tools integrate in minutes and provide deep insights into problems that are affecting end users, so you can find, diagnose and fix issues faster.

We believe that all software contains errors and problems, but it’s how you deal with those issues as a developer that can set you apart. Only 1% of users actively report issues they encounter, so we’re here to put the power in the developer''s hands.

Our goal is to produce an unbeatable solution for our customers with powerful tools and responsive support. With 10 years experience building tools for developers, we can deliver.','http://cdn.betteradvertising.com/logos/Raygun_Logo_500px_Flat_Blue_WhiteBG.png','4101');
INSERT INTO "companies" VALUES('millenial_media__jumptap_','Millenial Media (Jumptap)','Jumptap is a mobile advertising network that consists of operators (wireless carriers), publishers (provides subscribers and data to advertisers), and developer applications (iPhone).  Jumptap offers advertisers and agencies advertising solutions to reach their audience and make content relevant for mobile users. They can run ads across a comprehensive set of premium mobile channels including 10 different audience segmented packages.','Not found','Not found','http://www.millennialmedia.com/privacy-policy','http://www.millennialmedia.com','"Millennial Media is the leading mobile ad marketplace, making mobile simple for the world’s top brands, app developers, and mobile web publishers. The company''s data and technology assets enable advertisers to connect with target audiences at scale, while driving monetization for publisher and developer partners. AOL acquired Millennial Media on October 23, 2015. Millennial Media boosts AOL''s global, mobile capabilities and scale across ONE by AOL for advertisers and agencies, and offers the most attractive monetization platform for app developers."','http://cdn.betteradvertising.com/logos/millennial2.png','528');
INSERT INTO "companies" VALUES('datalogix','Datalogix','Datalogix is a data driven solution for marketers and advertisers.  They leverage purchase-based audience targeting to improve consumer acquisition, engagement, and retention for traditional and online marketing programs.  Datalogix operates the DLX platform that enables media companies to find Internet users based on offline behaviors and attributes. ','http://www.oracle.com/us/corporate/acquisitions/datalogix/index.html','http://datalogix.com/contact/','https://www.datalogix.com/privacy/','http://www.datalogix.com/','"Datalogix connects offline purchasing data to digital media to improve audience targeting and measure sales impact. Datalogix aggregates and provides insights on over $2 trillion in consumer spending to deliver purchase-based targeting and drive more sales. Over 650 customers including the top US advertisers and digital media publishers use Datalogix to increase the effectiveness and measurability of their advertising.  Datalogix will become part of the Oracle Data Cloud, a leader in Data as a Service. The combination will provide comprehensive consumer profiles that will power personalization across digital, mobile, offline and TV. With Datalogix, Oracle Data Cloud will deliver the richest understanding of consumers across both digital and traditional channels based on what they do, what they say, and what they buy enabling leading brands to personalize and measure every customer interaction and maximize the value of their digital marketing."','http://cdn.betteradvertising.com/logos/oracle-datalogix.png','124');
INSERT INTO "companies" VALUES('inspectlet','Inspectlet','"Inspectlet lets you discover where visitors are getting confused on your site and what''s getting their attention. See every mouse movement, scrolling, clicks, and typing on your site."','https://www.inspectlet.com/company','Not found','https://www.inspectlet.com/legal#privacy','https://www.inspectlet.com/','"Inspectlet monitors your site''s visitors in real-time and relays this information back to the servers, where it''s compiled and presented to you."','http://cdn.betteradvertising.com/logos/inspectlet.png','1254');
INSERT INTO "companies" VALUES('myfonts','MyFonts','None','Not found','Not found','https://www.myfonts.com/info/legal/#Privacy','http://www.myfonts.com/','"Our mission is to make it simple for everyone to find and buy fonts."','http://cdn.betteradvertising.com/logos/myfonts.png','2683');
INSERT INTO "companies" VALUES('the_austrian_web_analysis__owa_','The Austrian Web Analysis (OWA)','The Austrian web analysis / ÖWA is a web analytics firm.','http://oewa.at/index.php?id=982','Not found','http://www.oewa.at/impressum','http://oewa.at/','"With the Scalable Central Measuring System - short tractor - offers a future-proof ÖWA standardized instrument for measuring server-side metrics relating to the use of online services. The advantages of [OWA] include central and platform-independent measurement, analyzes of the data in near real time, clear definition of key performance indicators and comparable statements about all offers [and more]."','http://cdn.betteradvertising.com/logos/owa.png','404');
INSERT INTO "companies" VALUES('admeta','AdMeta','Admeta operates as an online marketing company and provides advertising tracking services in Europe. It designs and develops a web based yield management tool for unsold inventory bidding and selling services. The marketing tool Admeta offers provide campaign management, reporting services and an online marketing platform for integration.','http://www.admeta.com/aboutadmeta','http://www.admeta.com/contact','http://www.admeta.com/upload/Privacy%20Policy.pdf','http://www.admeta.com/','"Admeta is a company focused on delivering full service technology solutions for large online publishers helping them increase yield on online ad inventory. We are one of Europe’s leading suppliers of online ad exchange solutions and are working with some of Europe’s largest premium publishers."','http://cdn.betteradvertising.com/logos/admeta2.png','677');
INSERT INTO "companies" VALUES('nielsen','Nielsen','','http://www.nielsen.com/us/en/about-us.html','http://www.nielsen.com/content/corporate/us/en/privacy-inquiries.html','http://www.nielsen.com/us/en/privacy-policy/digital-measurement.html','http://www.nielsen.com/us/en.html','"Whether you''re eyeing markets in the next town or across continents, we understand the importance of knowing what consumers watch and buy.  That''s our passion and the very heart of our business.
We study consumers in more than 100 countries to give you the most complete view of trends and habits worldwide.  And we''re constantly evolving, not only in terms of where we measure, or who we measure, but in how our insights can help you drive profitable growth.
Whether your business is a multinational enterprise or a single storefront, we believe innovation is the key to success, in both what you create and how you market your products and ideas.  That''s why we continue to develop better solutions to help you meet the needs of today''s consumers, and find out where they''re headed next.
So let''s put our heads together.  We''ll bring our insight to your business and help you grow."
','http://cdn.betteradvertising.com/logos/nielsen1.png','167');
INSERT INTO "companies" VALUES('qualtrics','Qualtrics','None','http://www.qualtrics.com/about/','https://www.qualtrics.com/contact/','http://www.qualtrics.com/privacy-statement/','http://www.qualtrics.com/','"Qualtrics is a leading global provider of enterprise data collection and analysis products for market research, voice of customer, employee performance, and academic research."','http://cdn.betteradvertising.com/logos/qualtrics1.png','2572');
INSERT INTO "companies" VALUES('mouseflow','Mouseflow','Mouseflow is an online tool for performing web analytics and real time user studies on websites. It is a hosted service that can be used on any publicly facing website. Mouseflow helps web administrators pinpoint pages where users are having trouble, pages that respond or render slowly, pages where only few users scroll down to the bottom, pages with high bounce rate, and more.','','https://mouseflow.com/contact/','http://mouseflow.com/privacy','http://mouseflow.com/','"Mouseflow lets you record website visitors and generate instant heatmaps showing where they click, scroll and even pay attention."','http://cdn.betteradvertising.com/logos/mouseflow.png','418');
INSERT INTO "companies" VALUES('ad_river','Ad River','Ad River is a Russian ad serving and analytics company focused on the Russian market in providing advertisers with the technology to execute ad delivery, measure and report campaign effectiveness.','http://www.adriver.ru/about/','Not found','http://www.adriver.ru/about/privacy-en/','http://www.adriver.ru/','"AdRiver began its work in March 2001 and have since become a recognized leader in the Russian market of technological solutions in the field of online advertising."','http://www.adriver.ru/_i/adriver_logo_tag.gif','294');
INSERT INTO "companies" VALUES('zergnet','ZergNet','','http://www.zergnet.com/how','Not found','Not found','http://www.zergnet.com/info','"The idea behind ZergNet is simple.

Websites place article links from other network members on their sites to cross-promote their best content. Websites typically receive significantly more visitors to their site than they send to the network, as their content is displayed across the entire network and ZergNet.com."
','http://cdn.betteradvertising.com/logos/zergnet.png','1924');
INSERT INTO "companies" VALUES('adzerk','Adzerk','Adzerk is a supplier ad-servers and ad-serving technology. Their platform offers features such as real-time reporting, ad serving and network building support.','http://adzerk.com/about/','http://www.adzerk.com/contact/',' http://adzerk.com/privacy/ad-server/','http://adzerk.com/','"The best solution for managing your online ad sales and delivery."','https://c7766333651b0380cb60-0b19aba4099d36477a4cf8f34fa2f9e3.ssl.cf1.rackcdn.com/marketing/integrations/logo-adzerk.png','989');
INSERT INTO "companies" VALUES('realytics','Realytics','None','Not found','Not found','https://www.realytics.io/platform-privacy-policy/','https://www.realytics.io/','','https://www.realytics.io/wp-content/uploads/2015/04/logo1.png','4516');
INSERT INTO "companies" VALUES('sift_science','Sift Science','None','https://siftscience.com/about','https://siftscience.com/contact-support','https://siftscience.com/service-privacy','https://siftscience.com/','"Sift Science monitors your site''s traffic in real time and alerts you instantly to fraudulent activity."','http://cdn.betteradvertising.com/logos/sift_image.jpg','2686');
INSERT INTO "companies" VALUES('cpa_detective','CPA Detective','None','http://www.cpadetective.com/company.html','Not found','http://www.cpadetective.com/privacy-policy.html','http://www.cpadetective.com/','"CPA Detective is an affiliate fraud detection and compliance monitoring service that identifies and eliminates fraud and low-quality traffic sources to improve online advertising campaign performance. CPA Detective will optimize online advertising campaigns (CPA, CPL, CPC, PPC, and CPM ) as well as improve ROI and increase traffic quality."','http://cdn.betteradvertising.com/logos/cpadetective.png','2366');
INSERT INTO "companies" VALUES('infonline','INFOnline','INFOnline is a provider of Internet audience measurement services in Germany.','https://www.infonline.de/de/unternehmen/','Not found','https://www.infonline.de/de/extra/datenschutz/','https://www.infonline.de/','"Infoline is a provider of Internet audience measurement services in Germany."','http://cdn.betteradvertising.com/logos/infoonline.png','89');
INSERT INTO "companies" VALUES('exoclick','ExoClick','ExoClick is an ad network that also offers a ''domain parking'' solution that allows publishers to monetize unused domains through Search Engine Optimization and advertising.  ',' https://www.exoclick.com/about-us/','http://exoclick.com/contact.php','http://www.exoclick.com/privacy.php','http://exoclick.com/','"Exoclick is an innovative advertising network, providing solutions to advertisers and publishers worldwide. The company has developed its own ad-serving technology, delivering text ads, banners, rich-media, popunders and interstitials."','http://cdn.betteradvertising.com/logos/exoclick.png','1068');
INSERT INTO "companies" VALUES('marin_software','Marin Software','Marin Software is a paid search management platform. It offers a browser application to help advertisers and agencies managing paid search advertising campaigns across other major search sites.
',' http://www.marinsoftware.com/about-us/why-marin',' http://www.marinsoftware.com/about-us/contact-us',' http://www.marinsoftware.com/privacy/privacy-central','http://www.marinsoftware.com/','"Marin Software is a leading provider of online advertising management solutions, offering an integrated platform for managing search, display, and social marketing."','http://cdn.betteradvertising.com/logos/marinsoftware.png','226');
INSERT INTO "companies" VALUES('advolution','Advolution','None','Not found','Not found','http://www.advolution.de/datenschutz.php','http://www.advolution.de','"Advolution specializes in web based software development and interface design for digital marketing processes."','http://cdn.betteradvertising.com/logos/advolution.png','3036');
INSERT INTO "companies" VALUES('just_premium','Just Premium','None','Not found','Not found','Not found','http://justpremium.com/','"JustPremium is the world''s first RTB Ad Exchange for High-Impact Adsizes in the Netherlands, Germany, and Belgium. This new exchange offers advertisers state-of-the-art Rich Media Ads on a network of Premium Publishers."','http://cdn.betteradvertising.com/logos/justpremium.png','2882');
INSERT INTO "companies" VALUES('bazaarvoice','Bazaarvoice','Bazaarvoice is a Software as a Service (SaaS) company that enables the world’s biggest brands to capture, analyze, and most importantly, act upon social data – to drive true, customer-centric change.

We achieve that by first letting consumers create and share ratings, reviews, questions, answers, and stories about products and brands on client websites. We then syndicate that content across channels to reach shoppers wherever they are.

This customer-generated content has a tremendously positive influence on purchase decisions. It is also rich with customer intelligence, which we analyze and provide to our clients so they can make real-time, information-based decisions that affect all aspects of their business – marketing, product R&D, and operations.','http://www.bazaarvoice.com/about/','http://www.bazaarvoice.com/contact','http://www.bazaarvoice.com/privacy-policy/','http://www.bazaarvoice.com/','"Bazaarvoice is a network that connects brands and retailers to the authentic voices of people where they shop.
Each month, more than 700 million people view and share authentic opinions, questions and experiences about tens of millions of products in the Bazaarvoice network.
Our technology platform amplifies these voices into the places that influence purchase decisions. Network analytics help marketers and advertisers provide more engaging experiences that drive brand awareness, consideration, sales and loyalty.
Headquartered in Austin, Texas, Bazaarvoice has offices in Chicago, London, Munich, New York, Paris, San Francisco, Singapore and Sydney."','http://cdn.betteradvertising.com/logos/bazaarvoice1.png','1272');
INSERT INTO "companies" VALUES('sharethrough','Sharethrough','Sharethrough is a social video advertising platform and provides viral media distribution solutions. Sharethrough gives content owners and advertisers, access to various consumers. They also distribute video ads across social websites, games, apps, and advertising exchanges,','http://sharethrough.com/company/','http://www.sharethrough.com/contact/','https://platform-cdn.sharethrough.com/privacy-policy','http://sharethrough.com','Sharethrough is all-in-one native advertising software for publishers, app developers and advertisers.','http://cdn.betteradvertising.com/logos/sharethrough.png','718');
INSERT INTO "companies" VALUES('trafficforce','TrafficForce','None','http://www.trafficforce.com/about.html','Not found','http://www.trafficforce.com/terms.html','http://www.trafficforce.com/','"TrafficForce sells targeted web and mobile traffic on a CPM basis. The table below gives you an overview of the impression quantity available and starting bid prices. Campaigns can be created as large or small as you like, paused or started at any time and tracked with guaranteed precision."','http://cdn.betteradvertising.com/logos/trafficforce1.png','3330');
INSERT INTO "companies" VALUES('ebay_partner_network','eBay','eBay Stats provides tools to help improve ad campaigns. These solutions  ranging from simple creatives to putting eBay listings directly on the site.','https://partnernetwork.ebay.com/en/how-it-works','Not found','https://partnernetwork.ebay.com/en/legal#privacy-policy','https://www.ebaypartnernetwork.com','"The eBay Partner Network is eBay''s in-house affiliate program which operates in 13 countries globally. eBay Partner Network has some of the most generous affiliate commissions on the web. With Quality Click Pricing, the amount paid for each click varies depending on the quality of the traffic sent to eBay."','http://cdn.betteradvertising.com/logos/ebaypartnernetwork1.png','220');
INSERT INTO "companies" VALUES('internet_billboard','Internet BillBoard','None','http://www.ibillboard.com/en/about-us/','http://www.ibillboard.com/en/company/contact','http://www.ibillboard.com/en/ibillboard-cookie-and-privacy-policy','http://www.ibillboard.com/en/','"The Internet BillBoard company develops and runs software solutions for a complex internet advertising management and runs the biggest internet advertising network in the Czech Republic and Slovakia.

We develop and run the advertising management system BBelements AdServer, BBelements IntextServer and other products."','http://cdn.betteradvertising.com/logos/internetbillboard1.png','2835');
INSERT INTO "companies" VALUES('sociomantic_labs_gmbh','Sociomantic Labs GmbH','Sociomantic labs provide social targeting and related online display advertising technologies. Their cloud-based targeting service combines behavioral network analysis with data used in more traditional ad targeting methods to connect advertisers to the consumers who are most primed to convert.','https://www.sociomantic.com/company/','https://www.sociomantic.com/contact/','https://www.sociomantic.com/privacy/en/','https://www.sociomantic.com','"Sociomantic Labs is a leading provider of real-time bidding solutions for eCommerce advertisers across the globe. Our RTB eCommerce platform is specially tailored to deliver groundbreaking targeting and ad personalization solutions to help advertisers dramatically improve the performance of their online display advertising."','http://cdn.betteradvertising.com/logos/sociomantic.png','721');
INSERT INTO "companies" VALUES('gravity','Gravity','Gravity is a technology for personalization of content across the Internet. Their platform sifts through and analyzes natural language across client sites to build "interest graphs" for website and content optimization. They also own an analytics platform called Gravity Insights.','http://www.gravity.com/company/',' http://www.gravity.com/get-personalization-for-your-site/','http://privacy.aol.com/privacy-policy/','http://www.gravity.com/','"Through our applications, Gravity understands people''s interests so that our partners can create more relevant experiences for their users. Our proprietary ontology and natural language processing algorithms enable us to extract interests from structured and unstructured content with a high degree of accuracy and to systematically build high-precision Interest Graphs for people."',' http://d1j4pjmilbz7zi.cloudfront.net/2014/05/31/09/17/46/67/Gravity.png','1135');
INSERT INTO "companies" VALUES('eyeota','Eyeota','',' http://www.eyeota.com/about-eyeota/','http://www.eyeota.com/contact/',' http://www.eyeota.com/privacy-policy/','http://www.eyeota.com/','"Eyeota is an audience-targeting data technology company and the leading source for 3rd party audience targeting data for advertisers across Asia-Pacific, Europe and Australia... Eyeota’s solutions are driven by strong, proprietary, data management platform (DMP) and marketplace technologies. Eyeota supplies 3rd party data to all major global and regional ad buying platforms, DSPs and ad networks."','http://cdn.betteradvertising.com/logos/eyeota1.png','1727');
INSERT INTO "companies" VALUES('hubert_burda_media','Hubert Burda Media','None','http://www.hubert-burda-media.com/company/','Not found','http://www.hubert-burda-media.com/privacy/','http://www.hubert-burda-media.com/','"Hubert Burda Media (often abbreviated as simply "Burda") is a German privately held, family-owned global media company with its origins in printing and magazine publishing."

"Burda considers technology to be a central element of every media platform. Moreover, we demonstrate passion, creativity, craftsmanship and last but not least a keen understanding of the needs and interests of consumers. This results in products that attract people."','http://cdn.betteradvertising.com/logos/hubertburdamedia1.png','2810');
INSERT INTO "companies" VALUES('polar','Polar','None','Not found','Not found','http://www.polarb.com/privacy','http://www.polarb.com/','"Polar polls make it super quick and easy for your audience to tell you what they think. We''re a mobile-first mix of photo slideshows and lightweight participation —perfect for today''s world of instant interactions."','http://cdn.betteradvertising.com/logos/polar.png','3428');
INSERT INTO "companies" VALUES('sojern','Sojern','Sojern is a travel oriented ad network for both online and offline advertising. Sojern has partnerships directly with airlines that allow them to place advertisements on boarding passes and other non-traditional offline media. ','Not found',' http://www.sojern.com/contact.php','http://www.sojern.com/privacy-policy/website/','http://www.sojern.com/','"Sojern is the world''s leading data-driven traveler engagement platform that helps brands more efficiently and meaningfully engage with travelers. Our innovative advertising solutions ensure more useful and relevant information reaches consumers. We believe in empowering the consumer to control what ads they see and we advocate consumer choice."','http://cdn.betteradvertising.com/logos/sojern1.png','782');
INSERT INTO "companies" VALUES('adgoal','adgoal','None','https://www.adgoal.de/en/about.html',' https://adgoal.freshdesk.com/support/tickets/new',' https://www.adgoal.de/en/privacy.html','https://www.adgoal.de/en/','"Adgoal is the first German meta-network to over 8,000 affiliate programs from 15 affiliate networks combined and based on that developed innovative advertising formats. Our goal is to develop novel, content-based advertising solutions based on affiliate and CPC models and to create added value for website publishers and advertisers."','','2082');
INSERT INTO "companies" VALUES('vivalu','Vivalu','None','http://www.vivalu.com/en/','http://www.vivalu.com/en/contact/ | Email: contact@vivalu.com','http://www.vivalu.com/privatsphaere-und-datenschutz','http://www.vivalu.com/','Vivalu is a Data-Driven Performance Display agency with its own in-house technology. We offer our customers qualified know-how in the fields of display performance, Media Advertisement, Programmatic Buying, tracking technology and ad serving. In addition to Media Buying transparency at the highest level, we simplify the user profile and data-driven complexity of automated "Programmatic Buying" and achieve for our customers on the basis of a touchpoint attribution model a significant increase in marketing success with a conflict-free maximum revenue share.','http://cdn.betteradvertising.com/logos/unnamed.jpg','3935');
INSERT INTO "companies" VALUES('salesforce','Salesforce','SalesForce is an enterprise cloud computing company that distributes business software on a subscription basis. Its flagship product is a customer relationship management (CRM) tool that is hosted on Salesforce.com and operates on a Software-as-a-Service (SaaS) platform. SalesForce also operates Force.com, a system for running business apps, and Chatter, an enterprise collaboration application.','http://www.salesforce.com/company/','  https://www.salesforce.com/form/contact/contactme.jsp?d=70130000000EeYa','http://www.salesforce.com/company/privacy/full_privacy.jsp','http://www.salesforce.com/','"Salesforce.com is the enterprise cloud computing company that is leading the shift to the Social EnterpriseTM. Our trusted cloud platform and apps—including our flagship CRM solution—help employees collaborate easily and connect with customers like never before."','http://cdn.betteradvertising.com/logos/salesforce1.png','143');
INSERT INTO "companies" VALUES('ixi_services','IXI Services','IXI Corp is a research firm that specializes in customer segmentation. They assist clients in differentiating and targeting consumer households and markets. IXI''s proprietary tools focus on measures of wealth, income, spending capacity, credit, risk, share-of-wallet, and share-of-market. IXI Corp is an Equifax company.','http://www.ixicorp.com/about/company-overview/','http://www.ixicorp.com/about/contact-us/','https://datadrivenmarketing.equifax.com/website-privacy-policy/','http://www.ixicorp.com/','"IXI, an Equifax company, helps the nation’s leading financial services and consumer marketing firms optimize marketing efforts, manage risk, identify growth markets, and enhance practice and performance management. For over 15 years, IXI solutions have enabled marketing, sales, and risk management executives to differentiate and target consumer households through online and offline channels based on measures of wealth, income, spending, credit, investment style, share-of-wallet, and share-of-market." ','http://cdn.betteradvertising.com/logos/ixicorp.png','827');
INSERT INTO "companies" VALUES('nugg.ad','Nugg.ad','Nugg.ad operates a European advertising platform. With unique predictive behavioral targeting, nugg.ad offers customized, cooperative solutions that make it possible for online marketers, agencies and advertisers to increase efficiency, performance and branding impact of online campaigns. Through nugg.ad, target groups for real-time campaigns can be booked instantly and in a standardized format from any nugg.ad client.','http://www.nugg.ad/en/nuggad/company.html','Not found','https://www.nugg.ad/en/privacy/general-information.html','http://www.nugg.ad/en/index','"Nugg.ad operates Europe’s largest targeting platform and offers the most efficient solution for target group-specific online advertising."','http://cdn.betteradvertising.com/logos/nuggad.png','450');
INSERT INTO "companies" VALUES('toro_advertising','TORO Advertising','None','Not found','http://toroadvertising.com/contact.php','http://toroadvertising.com/privacy.php','http://toroadvertising.com/','"...Our campaigns include mobile, surveys, education, business opportunity, dating and many more. TORO Advertising has an exceptional understanding of the industry and experience necessary to help increase ROI for publishers while maximizing exposure, awareness and sales for advertisers."','http://cdn.betteradvertising.com/logos/toroadvertising.png','3135');
INSERT INTO "companies" VALUES('twyn','Twyn','','http://www.twyn.com/twyn.html','Not found','http://www.twyn.com/datenschutz.html','http://www.twyn.com','THE TWYN GROUP SPECIALIZES IN DIGITAL ADVERTISING AND MARKET LEADER IN THE FIELD OF INTEGRATED ONLINE SOLUTIONS

The company is headquartered in Vienna and Wels was founded in 2000 and has since been for innovation and measurability of success.

As a longtime specialist the Twyn Group specifically tailored to their advertisers, agencies and partner solutions implemented in areas such as targeting and performance marketing. With Austria''s leading advertising networks the Twyn Group ensures maximum range. The broad industry experience, a highly professional team of experts and the use of leading, patented technologies guarantee an efficient implementation of online campaigns.','http://cdn.betteradvertising.com/logos/twynlogo.png','1354');
INSERT INTO "companies" VALUES('connexity','Connexity','Connexity is an integrated platform that includes targeting and automatic optimization technology for advertisers to reach their desired audiences.
','http://www.connexity.com/about','http://connexity.com/contact/','http://connexity.com/privacy-policy/','http://www.connexity.com','"Connexity is an integrated digital advertising company and developer of the Audience Discovery Platform™. Connexity’s multi-graph analysis generates fresh, accurate, scalable, first-party data and extracts relevant connections and interests." ','http://photos.prnewswire.com/prn/20150203/173284LOGO/Connexity-Logo','941');
INSERT INTO "companies" VALUES('segment','Segment','"Segment.io is an analytics service for web applications."','Not found','Not found','https://segment.com/docs/legal/privacy/','https://segment.com/','"Segment.io is an analytics service for web applications."','http://cdn.betteradvertising.com/logos/segmentio.png  ','1440');
INSERT INTO "companies" VALUES('outbrain','Outbrain','Visual Revenue provides a predictive analytics solution that helps online media organizations optimize their landing page. Their Front Page Automation Platform provides editors with automated recommendations for selecting article excerpts and their corresponding placement location on homepages in real time.','http://www.outbrain.com/about/company','https://feedback-form.truste.com/watchdog/request','http://www.outbrain.com/legal/privacy','http://www.outbrain.com/engage','"Founded in 2010, Visual Revenue builds a real-time predictive analytics platform that makes human editors the most powerful force in today’s data-driven newsrooms. This helps media organizations to distinguish their brands."','http://cdn.betteradvertising.com/logos/visualrevenue1.png','1043');
INSERT INTO "companies" VALUES('peerius','Peerius','Peerius is provider of technology that provides enhanced product recommendations. Their software integrates with e-commerce platforms to call out products on publishers'' websites based on its "intelligent" recommendation technology.','https://www.peerius.com/about-us/','https://www.peerius.com/contact/','Not found','http://www.peerius.com/','"The next generation recommendation and personalisation technology: delivering maximised sales from the smartest recommendations."','http://cdn.betteradvertising.com/logos/peerius.png','1024');
INSERT INTO "companies" VALUES('media_impact','Media Impact','None','https://mediaimpact.de/artikel/Medien-Vermarktung-Media-Impact_1044242.html','https://mediaimpact.de/kontaktdatenbank.html','https://mediaimpact.de/artikel/-Hinweise-zum-Datenschutz_768445.html','https://mediaimpact.de/index.html','','http://','4847');
INSERT INTO "companies" VALUES('kameleoon','Kameleoon','None','http://www.kameleoon.com/fr/societe.html','Not found','Not found','http://www.kameleoon.com/','"Kameleoon is a complete solution for A / B testing, available in SaaS (Software as a Service)...  Our software is specifically aimed at managers of e-marketing, conversion specialists and enthusiastic leaders pure Internet players."

Translated by Kameleoon','http://cdn.betteradvertising.com/logos/kameleoon1.png','3044');
INSERT INTO "companies" VALUES('media.net','media.net','','http://www.media.net/aboutus','Not found','http://www.media.net/en/privacy-policy','http://www.media.net/','"Media.net has one of the most comprehensive portfolios of advertising technology in the industry across search, display, mobile, native, local, products and video. Its platform & products are licensed by various publishers, ad networks, and other ad tech companies worldwide. Each product implementation has the feature set required to execute successfully. Media.net builds products that auto-learn and optimize to display the most relevant ads and offers to end-users in formats that provide a balance of user experience and revenue, and provide industry leading user privacy protections. This creates long-term sustainable value and, at the same time, maximizes publisher revenue and provides high ROI to advertisers. It simplifies online advertising by building top-tier products across multiple segments within ad tech such that all of the customers’ needs are met without them having to engage multiple vendors, or at their option, to use the Company’s platform to unify the solutions from multiple vendors that they want to manage. Media.net’s offerings incorporate proprietary machine learning algorithms, sophisticated data processing, and detailed analytics capabilities to successfully target internet users. It currently manages traffic that generates 70+ million paid ad clicks each month (as at Q1 2016). To put this into perspective, at the industry average display CTR of 0.08%, it wouldrequire others an estimated 87.5+ billion display ad impressions permonth to generate this volume of ad clicks.
Media.net’s suite is constantly self-optimizing based on its ability to analyze and learn from vast volumes of data. Additional data obtained from the volume of transactions on the platform make its algorithms more intelligent, leading to higher quality matching, stronger ROI for advertisers, and increased revenue for publishers. As a result of this high quality matching, Media.net attracts even more sellers, which in turn attracts more buyers, leading to strong network effects. Further, Media.net is the original creator of the display-to-search (D2S) ad format, a highly sophisticated method of monetizing display placements by identifying user search intent and displaying relevant search keywords which lead to display of search ads bought by advertisers on a cost per click (CPC) pricing model. Advertisers have seen extremely high conversion/sales through this format without the risk of having to buy cost per thousand impressions (CPM) based media where they run the risk of paying for media with which users did not engage. Hence, this format enjoys uncapped advertising budgets as it is seen by advertisers as a cost of sales rather than an operating expense from a discretionary marketing budget. Media.net’s robust technology platform, extensive product features, rigorous quality and compliance standards, and experience in quickly ramping to achieve scale represent meaningful and lasting competitive advantages that have generated powerful results for Media.net’s publisher and advertiser clients."
','http://cdn.betteradvertising.com/logos/medianet.png','1879');
INSERT INTO "companies" VALUES('spot.im','Spot.IM','None','https://community.spot.im/about-us/','Not found','https://www.spot.im/disclaimer/privacy','https://www.spot.im/','"Spot.IM is the creator of the first “everywhere” social network, empowering website owners
and publishers to turn their websites into a social network driven by their own content.
Spot.IM’s technology enables publishers to take back ownership of the conversation
going on around their content, freeing them from having to rely on larger, external social
networks to provide the social space for community content engagement. The company
was founded in 2012 by Nadav Shoval and Ishay Green."','http://cdn.betteradvertising.com/logos/spotim.png','3625');
INSERT INTO "companies" VALUES('fit_analytics','Fit Analytics','None','Not found','Not found','http://www.fitanalytics.com/files/Privacy_Policy_DE-EN_FitA.pdf','http://www.fitanalytics.com/','"UPcload has one of largest databases of body measurements in the world. Using this data, we’re able to give size recommendations and provide detailed fit information."','http://cdn.betteradvertising.com/logos/upcload.png','3351');
INSERT INTO "companies" VALUES('acuity_ads','Acuity Ads','',' https://www.acuityads.com/about-us/','https://www.acuityads.com/contact-us/','https://www.acuityads.com/privacy-policy/','https://www.acuityads.com/','"Acuity Ads is a Consumer Connection Platform. Going beyond traditional Demand Side Platforms, Acuity uses cutting edge machine learning technology and real-time exchanges to give advertisers superior control of their display ads and deliver exceptional ROI."','http://cdn.betteradvertising.com/logos/acuityads1.png','1635');
INSERT INTO "companies" VALUES('extreme_digital','Extreme Digital','Extreme Digital provides the web analytics tool Extreme Tracker. These are tracking scripts that allow web site owners to "picture the visitors" to their web sites. It ranges from simply counting web site visitors to tracking the keywords they use to find you. ','http://extremetracking.com/?kudo','Not found','http://extremetracking.com/?policy','http://www.extremetracking.com/','"Learn about the visitors of your website. Collect Information. Find Patterns. Understand."
','http://cdn.betteradvertising.com/logos/extremedigital.png','65');
INSERT INTO "companies" VALUES('siteimprove','Siteimprove','"With Siteimprove Analytics it''s possible to follow your users'' behavior minute by minute, at any time of the day. An effective, clear, page-by-page analysis provides web editors with the unique potential to react quickly to significant changes in visitor behavior."','http://siteimprove.com/corporate/','Not found','http://siteimprove.com/privacy-policy/','http://siteimprove.com','"With Siteimprove Analytics it''s possible to follow your users'' behavior minute by minute, at any time of the day. An effective, clear, page-by-page analysis provides web editors with the unique potential to react quickly to significant changes in visitor behavior."','http://cdn.betteradvertising.com/logos/siteimprove.png','1447');
INSERT INTO "companies" VALUES('tradedoubler','TradeDoubler','TradeDoubler is an international performance-based digital marketing company. TradeDoubler optimizes Web marketing campaigns by analyzing web clicks, impressions and purchases. Its affiliate program is a banner advertising service which links and transfers website visitors to an advertiser''s site. This boosts traffic and search engine performance by providing traffic for the advertiser.  ','http://www.tradedoubler.com/uk-en/about-tradedoubler/','http://www.tradedoubler.com/en/contact/','http://www.tradedoubler.com/uk-en/privacy-policy/','http://www.tradedoubler.com/','"We are an international performance-based digital marketing company. Founded in Sweden in 1999, we have successfully expanded our business over the past 12 years and today offer an integrated digital marketing portfolio."','  http://www.tradedoubler.com/wp-content/themes/tradedoubler/dist/img/logo@2x.png','668');
INSERT INTO "companies" VALUES('intelligent_reach','Intelligent Reach','None','http://www.intelligentreach.com/about-us/','Not found','Not found','http://www.intelligentreach.com/','"Our platform consumes all of the merchant’s product data, enriching it where necessary, enabling the merchant’s offers to be everywhere potential buyers are looking for them. We track every interaction, automatically optimising marketing performance, onsite conversion and creating the perfect next action."','http://cdn.betteradvertising.com/logos/intelligentreach.png','2589');
INSERT INTO "companies" VALUES('highwinds','Highwinds','None','https://www.highwinds.com/company/about-highwinds/','Not found','https://www.highwinds.com/privacy-policy/','https://www.highwinds.com/','Highwinds is the highest performing content delivery network on the planet and offers a comprehensive suite of solutions including content delivery, storage, analytics, and cloud-based IP services. We deliver content and rich media over our high-performance RollingThunder network to millions of global users every day. Highwinds CDN customers gain unprecedented command and control with the StrikeTracker console and open APIs. We are headquartered in Winter Park, Fla., and maintain operations and data centers around the world.',' https://www.highwinds.com/wp-content/themes/highwinds-quindo/_/img/HW-logo.png','4481');
INSERT INTO "companies" VALUES('index_exchange','Index Exchange','None','http://www.indexexchange.com/about/','http://www.indexexchange.com/contact/','http://www.indexexchange.com/privacy/','http://www.indexexchange.com','Index Exchange is a fully transparent supply side platform and premium media exchange. We believe that automation is the future of media - regardless of channel - and our focus is on making that happen in the smartest way possible.','http://cdn.betteradvertising.com/logos/indexexchange.png','3794');
INSERT INTO "companies" VALUES('stumbleupon','StumbleUpon','StumbleUpon is a tool to help users discover and share websites. They offer a toolbar that delivers high-quality pages matched to users'' personal preferences. These pages have been explicitly recommended by your friends or other websurfers with interests similar.',' http://corp.stumbleupon.com/','http://help.stumbleupon.com/customer/portal/emails/new','http://www.stumbleupon.com/privacy/','http://www.stumbleupon.com/','"StumbleUpon helps you discover and share great websites. As you click Stumble!, we deliver high-quality pages matched to your personal preferences. These pages have been explicitly recommended by your friends or one of over 15 million other websurfers with interests similar to you. Rating these sites you like automatically shares them with like-minded people – and helps you discover great sites your friends recommend."','http://cdn.betteradvertising.com/logos/stumbleupon1.png','1067');
INSERT INTO "companies" VALUES('shopify','Shopify','None','http://www.shopify.com/about','Not found','http://www.shopify.com/legal/privacy','http://www.shopify.com/','"Shopify is a hosted ecommerce solution that allows you to set up and run your own online store."','http://cdn.betteradvertising.com/logos/shopify.png','2179');
INSERT INTO "companies" VALUES('crossengage','CrossEngage','None','Not found','Not found','https://www.crossengage.io/privacy-and-terms/','https://www.crossengage.io/','CrossEngage is a SaaS open marketing platform that combines a customer data platform with cross-channel campaign management capabilities. It easily integrates with all data sources and marketing channels so that your existing infrastructure does not need to be replaced.','http://','4497');
INSERT INTO "companies" VALUES('yieldlab','Yieldlab','Yieldlab develops the operating system for real-time trading and execution of advertising in digital channels. They support Web sites, marketers, media companies and publishers, their relationship with agencies and advertisers to intensify and become more efficient.','  http://www.yieldlab.com/about-yieldlab/','Not found','Not found',' http://www.yieldlab.com/','"Our focus is on the development of software systems for the real-time trading and delivery of advertisements via digital channels. We enable web sites, marketers, media houses and publishers, to strengthen and optimize their business relations with agencies and advertising clients."','http://cdn.betteradvertising.com/logos/yieldlab.png','1194');
INSERT INTO "companies" VALUES('microsoft_advertising','Microsoft Advertising','Microsoft Advertising is the online advertising division of Microsoft Corporation. They offer a variety of advertising products in search and display through their various entities. The Microsoft Advertising platform includes an ad exchange, network as well as their proprietary ad serving platform Microsoft Atlas.','http://advertising.microsoft.com/advertising-online','Not found','https://privacy.microsoft.com/en-us/privacystatement/','http://advertising.microsoft.com/home','"We constantly innovate to simplify the business of digital advertising, so that customers can amplify their brand stories across audiences, channels and screens in the most creative, engaging and efficient ways possible."','http://cdn.betteradvertising.com/logos/microsoftadvertising.png','1028');
INSERT INTO "companies" VALUES('vindico_group','Vindico Group','Vindico Group is an ad-serving platform that provides advertisers with video ad serving, tracking and analytics tools. It allows advertisers and their agencies control over the deployment, assignment, and scheduling of both video and banner ads across broadband networks enabling advertisers to self-manage their campaigns at the site and individual file levels. Vindico Group is a division of BBE (formerly Broadband Enterprises).','','Not found','https://www.sizmek.com/privacy-policy/optedin/','https://vindico.com/','"As the first ad management platform dedicated exclusively to video, VINDICO allows advertisers to buy, serve, track and measure all of their online video ad activity. Since 2006, VINDICO has been the gold standard in online video platforms, providing standardized reporting and analytics for the online video industry."','http://cdn.betteradvertising.com/logos/vindicogroup.png','739');
INSERT INTO "companies" VALUES('smart_adserver','Smart AdServer','Smart AdServer develops and markets ad serving technologies for the management of online campaigns for media agencies and publishers. They provide publishers, ad networks, agencies and advertisers with an integrated display, video, rich-media and mobile ad serving solution. Smart AdServer is a subsidiary of the Axel Springer Group.','http://smartadserver.com/company/about-us','http://smartadserver.com/request-a-demo/','http://smartadserver.com/company/privacy-policy/','http://smartadserver.com/','"Smart AdServer develops and markets premium ad serving solutions for media agencies and publishers to manage display campaigns for Web, mobile and iPad/tablets."','http://cdn.betteradvertising.com/logos/smartadserver.png','631');
INSERT INTO "companies" VALUES('zemanta','Zemanta','Zemanta is a blogging tool for accelerating online content production for web users. User-created text (blog posts, articles, etc) is directly "read" by Zemanta, which recognizes the contextual content. Zemanta then combs the web for the most relevant images, smart links, keywords and text; serving these results to the user to enrich  their content. Zemanta can be deployed on all major content publishing platforms and web browsers through a browser plug-in.','http://www.zemanta.com/about-us/','http://www.zemanta.com/about/#contact','http://www.zemanta.com/legal/privacy','http://www.zemanta.com/','"Zemanta is a revolutionary new platform for accelerating on-line content production for any web user. Any user-created text (a blog post, article or web page) is directly “read” by Zemanta, which recognizes all contextual content. Zemanta then combs the web for the most relevant images, smart links, keywords and text, instantly serving these results to the user to enrich and inform their content."','http://cdn.betteradvertising.com/logos/zemanta.png','189');
INSERT INTO "companies" VALUES('monetate','Monetate','Monetate is a provider of website testing and ad targeting services. Their web-based service provides data on clicks and advertising effectiveness to determine the best performing ads. The company provides an analytics suite and dashboard, enabling users to launch targeted advertising campaigns quickly.','monetate.com/about-monetate/','http://www.monetate.com/about/contact/','http://www.monetate.com/platform-privacy-policy/?p=platform-policy/','http://monetate.com','Monetate powers multi-channel testing & personalization for brands worldwide. Built for speed, the Monetate Platform’s easy-to-use interface allows marketers to create, test and deploy an unlimited number of personalized digital experiences with limited need for IT or consulting resources.','https://wvuimc.files.wordpress.com/2013/02/unknown.jpeg','601');
INSERT INTO "companies" VALUES('nextperf','Nextperf','Next Performance is an audience retargeting company and advertising network based in France. Their solution is used by eCommerce platforms to serve customers target advertisements based on interests inferred from products viewed and other relevant online data.','Not found','Not found','http://www.nextperf.com/privacy/','http://www.nextperf.com/','"Nextperf provides a highly scalable platform helping you take control of your display media by combining real-time user analysis, real-time bidding and dynamic content creation. Use our platform to run your campaigns with full control over segment definition, media buying and your tailored banners, or let us manage some or all of these services for you: Bring greater intelligence to your display media."','http://cdn.betteradvertising.com/logos/nextperf.png','656');
INSERT INTO "companies" VALUES('popads','PopAds','"PopAds is simply the best paying advertising network specialized in popunders on the Internet."','Not found','Not found','https://www.popads.net/privacy-policy.html','https://www.popads.net/','"PopAds is simply the best paying advertising network specialized in popunders on the Internet."','http://cdn.betteradvertising.com/logos/popads.png','1221');
INSERT INTO "companies" VALUES('crimtan','Crimtan','Crimtan is a behavioral ad network built on Red Aril''s proprietary data management and advertising optimization platform. They provide advertisers with audience segmentation, optimization, ad delivery and reporting. Audience intelligence is gathered anonymously from multiple sources of user activity and provides real-time insight into audience interests and purchase intent.
','http://www.crimtan.com/about.html','http://crimtan.com/about-us/#contact','http://crimtan.com/privacy/','http://crimtan.com/','"Crimtan is a technology-rich Digital Advertising Services provider. Our proprietary Data Engine and state-of-the-art technical capability enables Crimtan to offer a wide range of ROI focused products to publishers and advertisers. Crimtan provides advertisers with precise audience targeting, optimisation and reporting. Publishers benefit from enhanced visitor insight and increased revenue."',' http://crimtan.com/wp-content/uploads/2014/06/Crimtan_Logo.png','606');
INSERT INTO "companies" VALUES('ancora','Ancora','None','http://www.ancoramediasolutions.com/what-we-do/','http://www.ancoramediasolutions.com/contact/','http://www.ancoramediasolutions.com/j/privacy','http://www.ancoramediasolutions.com/','The Ancora Platform offers a high quality adserver with a connection to all the demand sources worldwide. This makes the use of a SSP obsolete. Booking a direct campaign or a programmatic order can finally happen within the same interface. Our backend makes sure everything is optimized to boost revenue. Tired of waiting on slow reporting UI''s? We make your life a lot easier by giving you all the data you want realtime so you can store it wherever you like. ','http://cdn.betteradvertising.com/logos/ancora.PNG','4535');
INSERT INTO "companies" VALUES('meetrics','Meetrics','Meetrics is a web analytics provider in the field of algorithmic real-time measurement of ''attention'' on Internet sites. Meetrics supports online media with live reports and usage analysis based on the visibility of web content in the publication of news and optimization of online marketing activities.','https://www.meetrics.com/en/company/#about','Not found','https://www.meetrics.com/en/company/#about','https://www.meetrics.com/en/','"Meetrics supports online media with live reports and usage analysis based on the visibility of web content in the publication of news and optimization of online marketing activities." ','http://www.2hecken.org/images/meetrics222logo_img.jpg','1073');
INSERT INTO "companies" VALUES('revcontent','RevContent','None','https://www.revcontent.com/beyond.the.banner','Not found','https://faq.revcontent.com/customer/en/portal/articles/2703838-revcontent-s-privacy-and-cookie-policy','https://www.revcontent.com/','"RevContent is the industry leading content marketing monetization platform. We are a highly selective marketplace that creates specialized monetization solutions for the world’s leading editorial content providers. Our selectivity ensures that our advertisers see only the highest quality traffic, which translates to industry leading publisher RPMs for our clients."','Not found','3626');
INSERT INTO "companies" VALUES('optimatic','Optimatic','None','http://www.optimatic.com/#team1','Not found','http://www.optimatic.com/wp-content/uploads/2016/11/Privacy_Policy11-16.pdf','http://www.optimatic.com/','"OPTIMATIC is the leading provider of fully managed video advertising solution for publishers. Our universal video advertising platform and world class publisher support makes OPTIMATIC the best solution for publishers."','http://cdn.betteradvertising.com/logos/optimatic.png','2319');
INSERT INTO "companies" VALUES('vizury','Vizury','',' https://www1.vizury.com/story','Not found','http://web.vizury.com/website/in/privacy-policy/',' https://www1.vizury.com/','"Vizury empowers advertisers to engage their website drop-off users in a 1:1 marketing conversation, resulting in both measurable and tangible value, as well as contributing to intangible branding impact. The 1:1 marketing conversation is enabled through thousands of highly personalized rich media ads that are powered by the statistical modeling of user behavior, dynamic message generation module, and response optimization system."','https://www1.vizury.com//images/logo_v.svg','1380');
INSERT INTO "companies" VALUES('zedo','Zedo','Zedo is a privately held ad serving company focused on providing advertisers, publishers and ad networks with hosted technology tools for ad delivery and performance. Zedo uses behavioral targeting to determine appropriate audience segments for ad serving. Their hosted self-service platform include, Universal Pixel Connexion tags that allow ad networks to track user behavior in tandem with publishers serving their ads.','http://www.zedo.com/about-zedo/','https://www.zedo.com/contact-us/','http://www.zedo.com/about-zedo/privacy-policy/','http://www.zedo.com','"ZEDO, Inc. is a digital ad solutions company that offers products and services for a publisher''s premium, self service, and remnant inventory. Products include ad network optimization, innovative rich media formats for publishers'' direct sales teams, full featured ad serving, behavioral targeting data built into the ad server, an exchange-like platform for publishers to sell behavioral and DMA targeted inventory at high CPMs, a self service platform to allow advertisers to buy directly from a publisher, outsourced ad ops and more."',' https://www.zedo.com/wp-content/uploads/2014/12/ZEDO-Logo2.gif','188');
INSERT INTO "companies" VALUES('trustarc','TrustArc','TRUSTe is a privacy certification and verification company. It certifies website and mobile privacy practices as well as approving downloadable software applications. In its compliance efforts, TRUSTe serves notices for the Self Regulatory Program for Online Behavioral Advertising, the program overseen by Digital Advertising Alliance.','https://www.trustarc.com/about/','Not found','https://www.trustarc.com/privacy-policy/','http://www.trustarc.com/','TrustArc powers privacy compliance and risk management with integrated technology, consulting and TRUSTe certification solutions – addressing all phases of privacy program management.

Our new name, TrustArc, reflects our evolution from a certification company into a global provider of technology powered privacy compliance and risk management solutions.

The foundation for our solutions is the TrustArc Privacy Platform which provides a flexible, scalable, and secure way to manage privacy.

Our technology platform, fortified through six years of operating experience across a wide range of industries and client use cases, along with our services, leverage deep privacy expertise and proven methodologies which we have continuously enhanced through thousands of client projects over the past two decades.

Headquartered in San Francisco, and backed by a global team, we help over 1,000 clients worldwide demonstrate compliance, minimize risk, and build trust.','http://cdn.betteradvertising.com/logos/truste1.png','775');
INSERT INTO "companies" VALUES('viglink','VigLink','VigLink is a provider of automated affiliate marketing services. They offer a suite of web technologies to publishers to drive non-advertising revenue from existing content. Publishers offer links on their site and if users purchase a product on the affiliate merchant''s site through the link, the originating publisher is paid a commission on the sale.','http://www.viglink.com/about','http://www.viglink.com/contact-us/','http://www.viglink.com/legal/privacy','http://www.viglink.com/','"Get paid by the sites you link. VigLink lets you supplement your site''s advertising revenue."','http://cdn.betteradvertising.com/logos/viglink.png','421');
INSERT INTO "companies" VALUES('jw_player','JW Player','None','https://www.jwplayer.com/company/our-story/','Not found','https://www.jwplayer.com/privacy/','https://www.jwplayer.com/','If you''ve watched video on the web, you already know us. We''re the New York-based startup that brought online video to more people in the world than anyone else. Our flagship product, JW Player, is live on more than 2 million sites and streams billions of videos each month, across all devices — phones, tablets and desktops. JW Player powers online publishing for clients ranging from Fortune 500s to indie bloggers. Our services such as video hosting and streaming, advertising, and analytics help companies optimize their video workflows and monetize smartly. Now, we''re busy innovating for the future. We''re imagining what comes next for the millions of businesses, users and viewers we serve worldwide.','http://www.videonuze.com/ckfinder/userfiles/images/JW%20Player%20logo.jpg','4338');
INSERT INTO "companies" VALUES('stackadapt','StackAdapt','None','https://www.stackadapt.com/company','https://www.stackadapt.com/contact','http://www.stackadapt.com/privacy','http://www.stackadapt.com/','"StackAdapt technology helps brands reach new audiences with content, understand consumers'' engagement with it, and drive purchase intent"','http://cdn.betteradvertising.com/logos/logo_StackAdapt_255255255.png','3952');
INSERT INTO "companies" VALUES('intent_media','Intent Media','Intent Media provides advertising to e-commerce sites and enables these sites to turn customer intent into new revenue streams. They connect advertisers with markets of interested buyers by providing audience segmentation services and delivers new inventory to performance marketers.','http://intentmedia.com/about/','http://intentmedia.com/contact-us/','http://intentmedia.com/privacy-policy/','http://www.intentmedia.com/','"We’re Intent Media. We’re shaking up the e-commerce industry with a big idea: enable e-commerce publishers to monetize the 97% of visitors who aren’t buying on their sites, while giving advertisers unprecedented access to intent-rich shoppers on a huge scale. Our auction-driven technology platform is easy for e-commerce to implement and contains sophisticated tools for minimizing risk, testing, and optimization."','http://cdn.betteradvertising.com/logos/intentmedia.png','735');
INSERT INTO "companies" VALUES('king.com','King.com','','  https://discover.king.com/',' https://care.king.com/contact','http://about.king.com/consumer-terms/terms/en#privacy','http://www.king.com/','"We''re commited to delivering casual, social games that have connected over 38 million players with over 2.8 billion game plays. We''re a passionate team who have delivered 150 classic and fun new titles in 14 languages, across our growing gaming network on the web, social and mobile."','http://cdn.betteradvertising.com/logos/kingcom.png','1750');
INSERT INTO "companies" VALUES('pagefair','PageFair','None','http://pagefair.com/about/','http://pagefair.com/about/','https://pagefair.com/privacy/','http://pagefair.com/','"Measure how many visitors block your ads, and unlock revenue with non-intrusive ads just for your adblockers."','http://cdn.betteradvertising.com/logos/pagefair1.png','2675');
INSERT INTO "companies" VALUES('pardot','Pardot','Pardot provides interactive marketing solutions. It offers Prospect Insight, a marketing automation suite for sales and marketing professionals for web and mobile, LeadDeck Prospect Monitor, an application that allows sales and marketing teams to get real-time alerts of visitor and prospect activity and VisitorID, which allows tracking and identification of the organizations of anonymous visitors.','http://www.pardot.com/about-pardot/','http://www.pardot.com/company/contact-us.html','http://www.pardot.com/company/legal/privacy-policy.html','http://www.pardot.com/','"Pardot is a B2B Marketing Automation provider that increases revenue and maximizes efficiency for companies with multi-touch sales cycles. Pardot''s lead management software features CRM integration, email marketing, lead nurturing, lead scoring, and ROI reporting to help marketing and sales teams work together to generate and qualify sales leads, shorten sales cycles, and demonstrate marketing accountability."','http://www.pardot.com/content/themes/pardot/assets/images/pardot-logo.png','228');
INSERT INTO "companies" VALUES('wwwpromoter','wwwPromoter','None','http://wwwpromoter.com/company.html','Not found','http://wwwpromoter.com/privacy.html','http://wwwpromoter.com/','WWWPromoter. Promoter. Triple W Promoter. However you want to call us, you can’t deny our name is fitting. It’s a simple way to describe what we do: World Wide Web Promoter. No fuss, no mess. Straight to the point.

Our mantra: at the heart of every journey is the power to shake things up.

Since our company’s inception in 2014, we shake & bake’d our way into the industry with authority. We are a group of innovators and do’ers. We envision something, we do it. Simple.

But what’s more important is we are unconventional thinkers. In order to stay relevant, let alone excel, we must be unusual. Different. Distinct.','http://wwwpromoter.com/img/logo.png','4392');
INSERT INTO "companies" VALUES('avail','Avail','None','http://avail.com/company/overview/','http://avail.com/company/contact/','http://www.parkingcrew.net/privacy.html','http://avail.com','"Since 2000, Avail has been a constant pioneer and leader by customers and independent analysts. Today, we are Europe’s largest provider of online merchandising platforms, counting many of the leading retailers in each sector as our customers."','http://cdn.betteradvertising.com/logos/avail.png','2596');
INSERT INTO "companies" VALUES('iovation','iovation','iovation aims to help companies determine which online visitors to trust in order to reduce fraud, abuse, and protect customers and online communities. iovation utilizes its database of devices used to access the web in order to determine the levels of risk associated with the different types of online transactions.','https://www.iovation.com/about','https://www.iovation.com/contact/','https://www.iovation.com/legal/privacy/','http://www.iovation.com/','"iovation helps companies know which online visitors to trust in order to reduce fraud, abuse, and protect customers and online communities. We apply the world''s largest database of devices used to access the internet to determine the level of risk associated with any type of online transaction."','http://cdn.betteradvertising.com/logos/iovation.png','388');
INSERT INTO "companies" VALUES('tradetracker','TradeTracker','TradeTracker is a SaaS (Software as a Service) provider.  Their tracking software helps advertisers assess their ad performance and provide access to a network of affiliates.

','Not found','Not found','https://tradetracker.com/privacy-policy/','https://tradetracker.com/','"TradeTracker is the largest affiliate network in the Netherlands, with more than 700 merchants."','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBWGOFa6NaZk6X5bvTNSDkGdpHURnZwpUuu78mHw6oNNyaBYccbRJm0_I','815');
INSERT INTO "companies" VALUES('adform','Adform','AdForm is an integrated online marketing platform that combines media planning, ad serving, search engines, web analytics and reporting in one system. The  platform facilitates tracking of entire websites as well as spotlight tracking of selected web pages to give a thorough view into the effectiveness of marketing campaigns.','http://site.adform.com/company/about/','Not found','http://site.adform.com/privacy-policy/en/','http://site.adform.com/',' ''Adform is the independent and open full stack ad-tech platform that encompasses data, creativity and trading, servicing media agencies, trading desks, advertisers and publishers globally. All of our solutions are modular and easily inter-operate with all major technologies used throughout the digital advertising ecosystem. Adform was founded in Denmark in 2002 and is among the world’s largest private and independent advertising technology companies. With offices in 18 countries, Adform has more than 700 employees globally throughout Europe, North America and APAC. Visit http://www.adform.com or http://join.adform.com for more information''','http://cdn.betteradvertising.com/logos/Adform_logo_RGB_%281%29.jpg','457');
INSERT INTO "companies" VALUES('richrelevance','RichRelevance','RichRelevance is a content recommendation engine focused on optimizing content on e-commerce websites to improve product recommendations based on user purchase histories and browsing behavior.','http://www.richrelevance.com/company','Not found','http://www.richrelevance.com/privacy','http://www.richrelevance.com','"RichRelevance powers personalized shopping experiences for the world’s largest and most innovative retail brands. RichRelevance helps retailers increase sales and effectively monetize site traffic by providing the most relevant products, content and offers to shoppers as they switch between web, store and mobile." ','http://cdn.betteradvertising.com/logos/richrelevance.png','140');
INSERT INTO "companies" VALUES('facebook','Facebook','Facebook is an online social network accessible to anyone with an active email address. People use Facebook to keep up with friends, upload photos, share links and videos, and learn more about the people they meet.','https://www.facebook.com/about/','Not found','https://www.facebook.com/full_data_use_policy','http://www.facebook.com/','"Facebook gives people the power to share and makes the world more open and connected. Millions of people use Facebook everyday to keep up with friends, upload an unlimited number of photos, share links and videos, and learn more about the people they meet."','http://cdn.betteradvertising.com/logos/facebook.png','249');
INSERT INTO "companies" VALUES('clickintext','ClickInText','ClickInText is an advertising agency that provides a variety of technologies to meet the advertising needs of their advertisers.','http://www.clickintext.com/about/','http://www.clickintext.com/about/contact.php','https://www.clickintext.com/about/confidentialite-retargeting.php','http://www.clickintext.com/','"ClickInText tm was developed in 2005 to link our advertisers and the heart of websites, their content. The technologies in place continue to evolve and become more and more regularly in line with the expectations of advertisers and publishers.

ClickInText tm conjoitement was performed by two Internet companies: Kloïs Development qu''Adstours and who manages it."','http://cdn.betteradvertising.com/logos/clickintext.png','1081');
INSERT INTO "companies" VALUES('rollbar','Rollbar','None','http://www.rollbar.com/about','Not found','http://www.rollbar.com/privacy','http://www.rollbar.com/','"Rollbar collects and analyzes errors so you can find and fix them faster."','http://cdn.betteradvertising.com/logos/rollbar.png','2925');
INSERT INTO "companies" VALUES('adspirit','AdSpirit','AdSpirit.de is an independent ad serving solution that provides an ad serving platform for publishers/advertisers, marketers and agencies. AdSpirit is a Linux-based system with an Apache server and mySQL as the database server. ',' http://www.adspirit.de/ueberuns0.0.html',' http://www.adspirit.de/sofortkontakt0.0.html',' http://www.adspirit.de/datenschutz00.0.html','http://www.adspirit.de ','"AdSpirit is designed specifically for the needs of publishers and publishers , online marketers and networks as well as advertisers and agencies designed, allowing the management and placement of online advertising. Campaigns can be booked in AdSpirit quickly and easily, and automatically delivered by the optimized system."','http://cdn.betteradvertising.com/logos/adspirit.png','1326');
INSERT INTO "companies" VALUES('kiosked','Kiosked','None','http://www.kiosked.com/about/','http://www.kiosked.com/contact-us/','http://www.kiosked.com/privacy-policy.html','http://www.kiosked.com/','"Kiosked turns any online content, images, videos and applications into interactive and viral storefronts... Kiosked enables brands to turn their content into storefronts and engage directly with their fans everywhere. Publishers can monetize the impulses they generate through Kiosked content. Through kiosks anyone can buy, want and get more information when an impulse is born."','http://cdn.betteradvertising.com/logos/kiosked.png','3136');
INSERT INTO "companies" VALUES('openx','OpenX','OpenX Limited is an open source advertising community that develops independent ad servers and services. The OpenX Market is an exchange platform that enables publishers to sell their supply directly to ad buyers through real-time auctions, while providing technology to ad networks, sales houses and affiliate networks for ad serving. OpenX features an integrated banner management interface and tracking system to gather statistical data across the exchange.','http://openx.com/about/','http://www.openx.com/contact-us','http://openx.com/legal/privacypolicy/','http://www.openx.com/','
"OpenX creates quality programmatic advertising markets that drive superior monetization for publishers and optimal value for brands. As monetization partners to more than 1,200 publishers worldwide, OpenX has the largest knowledge base of publishers needs and trends. Our robust global technology infrastructure that ensures full reliability for all ad formats across all digital environments."','http://cdn.betteradvertising.com/logos/openx.png','131');
INSERT INTO "companies" VALUES('sas','SAS','','http://www.sas.com/en_us/company-information.html','Not found','http://www.sas.com/en_us/legal/privacy.html',' http://www.sas.com/en_us/home.html','"SAS helps organizations anticipate and optimize business opportunities. We do this through advanced analytics that turn data about customers, performance, financials and more into meaningful information."','http://cdn.betteradvertising.com/logos/sas1.png','479');
INSERT INTO "companies" VALUES('sirdata','Sirdata','None','http://www.sirdata.com/about/','http://www.sirdata.com/contact-us/','http://www.sirdata.com/privacy/','http://www.sirdata.com/home/','Sirdata is a French-based start-up that develops innovative data technology solutions for Web publishers and advertisers. After three years of research and development, two technology entrepreneurs founded the company in 2012. Today, Sirdata has become the premiere third-party data collecting self-service platform in eight countries across the globe. With an entrepreneurial spirit at its core, Sirdata has built and harnessed the expertise of a multi-disciplinary team. This highly skilled team has become a close family, and each member is an essential element to the success and growth of Sirdata. Using advanced algorithm technology Sirdata has become a global leader in the growing market of third-party data collection technology. Providing targeted data that identifies the intentions, interests and behaviors of Web users, Sirdata enables their advertising partners and clients to create more strategic marketing and advertising campaigns.','http://www.sirdata.com/wp-content/uploads/2014/09/logo_fB.png','4526');
INSERT INTO "companies" VALUES('wikia','Wikia','None','http://www.wikia.com/about','Not found','http://www.wikia.com/Privacy_Policy',' http://www.wikia.com/fandom','"Wikia operates the world’s largest network of collaboratively published video game, entertainment, and lifestyle content on the web through a trusted and customizable platform designed to help people share what they know and love."','','2095');
INSERT INTO "companies" VALUES('intelliad','intelliAd','None',' http://www.intelliad.de/warum-intelliad/','Not found',' http://www.intelliad.de/datenschutz/','http://www.intelliad.de/','"intelliAd is a global leader and pioneer in Bid Management and Multichannel Tracking.
We offer advertisers and agencies an on-demand software solution to optimize their SEM efforts by translating data into actionable items in order to leverage organic and paid search efforts."','http://cdn.betteradvertising.com/logos/intelliad.png','2192');
INSERT INTO "companies" VALUES('crazy_egg','Crazy Egg','Crazy Egg is an analytics service that provides graphical and text analysis of visitor behavior on a website. It tracks where visitors click and allows webmasters to fine-tune their site''s performance. ','https://www.crazyegg.com/overview','https://help.crazyegg.com/contact','https://www.crazyegg.com/privacy','https://www.crazyegg.com/','"Crazy Egg is like a pair of x-ray glasses that lets you see exactly what people are doing on your website.
Like, showing you where people are clicking… and where they aren''t.
Or how many people scroll down your pages (and where most people stop).
Or where those people are coming from to begin with, and who clicks on what the most!"','http://cdn.betteradvertising.com/logos/crazy-egg-logo.png','50');
INSERT INTO "companies" VALUES('tubemogul','TubeMogul','TubeMogul provides a technology platform for simplifying the delivery of video ads and maximizing the impact of advertisers'' ad spend. Their PlayTime platform delivers video ads to audiences in multiple formats, and various devices.','https://www.tubemogul.com/guiding-principles/','https://www.tubemogul.com/contact-us/','https://www.tubemogul.com/compliance/privacy-policy/','https://www.tubemogul.com/','"TubeMogul''s programmatic advertising software enables brands and agencies to plan, buy, measure and optimize their global advertising.
See TubeMogul’s Software in Action
Simplify planning and buying across multiple channels, devices and inventory sources while verifying the success of global campaigns, all from a single programmatic advertising software platform.
Execute cross-screen campaigns and track the efficacy of your ad dollars from a centralized platform.
With a consolidated approach to campaign management, our cross-channel advertising software allows you to run global, sophisticated brand campaigns using 1st and 3rd party data across premium inventory on all devices, formats and channels. From the platform dashboard, real-time metrics enable you to track performance, economic impact and investments across product lines while making data-driven optimizations at any point during the campaign."
','http://cdn.betteradvertising.com/logos/tubemogul.png','953');
INSERT INTO "companies" VALUES('bidtheatre','BidTheatre','None','http://www.bidtheatre.com/about-us/','http://www.bidtheatre.com/contact/','http://www.bidtheatre.com/privacy-policy/','http://www.bidtheatre.com/','"Our mission is to build RTB infrastructure and an easy-to-use efficient management system that allows for exact execution, control and reporting of online media campaigns for media agencies and ad networks in the Nordics."','http://cdn.betteradvertising.com/logos/bidtheatre.png','3272');
INSERT INTO "companies" VALUES('tradelab','Tradelab','None','http://tradelab.com/en/company/','Not found','http://tradelab.com/en/privacy/','http://www.tradelab.fr/','Tradelab is a leading programmatic technology company over
Europe and LATAM, headquartered in Paris, France. Tradelab offers a
proprietary multi-device platform to Agencies and Brands. A pioneer in
programmatic media technology, Tradelab offers clients a suite of powerful,
unique and customizable solutions including tailor-made algorithms per
advertiser, proprietary data, geo-targeting, and dynamic creative
optimization. As we believe in the covenant Man + Machine, our team of
experts is 100% dedicated to programmatic.
','Not found','2690');
INSERT INTO "companies" VALUES('powerlinks','PowerLinks','None','http://www.powerlinks.com/about','http://www.powerlinks.com/contact-us','http://www.powerlinks.com/privacy-policy/','http://www.powerlinks.com/','"PowerLinks delivers ad management and ad serving solutions to companies that buy, create or sell online advertising. Leading web publishers, advertisers, ad networks and agencies use PowerLinks in order to incrementally grow their online advertising businesses. Our products offer market leading rich media, video and mobile compatibility which combine with PowerLinks expertise in ad serving and media planning. This allows us to deliver a high ROI for advertisers whilst empowering publishers to remain in complete control of their web assets."','http://cdn.betteradvertising.com/logos/powerlinks.png','2197');
INSERT INTO "companies" VALUES('ve_interactive__formely_gdm_digital_','VE Interactive (Formely GDM Digital)','','  https://www.veinteractive.com/us/about-us/','http://www.veinteractive.com/about-us/legal-policies/privacy-policy/',' https://www.veinteractive.com/us/about-us/contact-us/','http://www.veinteractive.com/','"Ve is a world-leading technology company whose platform has become an essential component for any online business to acquire, engage and convert customers."','http://cdn.betteradvertising.com/logos/velogo_primary_resized.jpg','1810');
INSERT INTO "companies" VALUES('turn_inc.','Turn Inc.','Turn is an online data-driven technology and software services company. They provide technology to bring efficiencies of search to display advertising and connect advertising agencies with targeted audiences. Turn also provides technology infrastructure, optimization algorithms, real-time analytics, and media and data management for delivery of data-driven digital advertising.','http://www.turn.com/company','http://www.turn.com/company/contact-us',' http://www.turn.com/trust/privacy-guidelines','http://www.turn.com','"Turn has developed the digital advertising industry’s only integrated, end-to-end platforms for data and media management. The Turn Audience Platform and Turn Media Platform are currently utilized to manage digital advertising campaigns for Global 2,000 brands. Turn’s global infrastructure, intuitive software and analytics, and open ecosystem for partners – all available in a real-time integrated environment – represent the future of digital advertising."
to:
"What makes Turn different?
Insights
Every interaction with mobile apps, web content, streaming video, or a social network creates valuable new consumer data. Information about who they are, their product preferences, purchasing patterns, and even their geographic location. Turn centralizes all this data on our massive platform, blends in real-time media data—then mines it all for clear insights that drive successful marketing relationships.
ROI
Data-driven insights work with Turn’s patented real-time algorithms and lightning-fast execution platform, helping marketers deliver the right message on the best media channel at the right moment in time. The result? Superior campaign performance that exceeds expectations and delivers better ROI than any other marketing platform.
Control
In a world where consumer attention bounces among a multitude of devices and content sources, Turn is a unifying force. A single login puts the marketer in control, providing a powerful dashboard of all multi-channel digital advertising activities. With one-click access to the right mix of data, inventory, and technology vendors for any campaign, marketers can think big, while retaining the ability to dive deep into any component and optimize it for best performance.
Real Time
With an integrated technology platform, marketers can convert strategy into results in real time. Turn is the only marketing platform with data management, media execution and marketing analytics on a unified infrastructure, empowering marketers to build digital advertising strategies, then immediately execute them—with no data loss and no wasted time. In fact, as the Turn platform tracks in-flight campaign actions, it updates audience information instantly.
Software Focus
Turn is a Silicon Valley technology company with a highly scalable multi-tier server infrastructure. Our core expertise is in building great software that supports the digital advertising workflow and solves the challenges of global marketers."
','http://cdn.betteradvertising.com/logos/turninc.png','173');
INSERT INTO "companies" VALUES('imonomy','imonomy','None','http://imonomy.com/about/','http://imonomy.com/contact/','http://imonomy.com/privacy-policy/','http://imonomy.com','imonomy’s in-image advertising platform has been proven to add value to the user experience, while generating lucrative incremental revenue for publishers around the world.

Our trusted in-image monetization model has been integrated onto thousands of websites from niche blogs to internationally recognized online brands.','http://cdn.betteradvertising.com/logos/imonomy.png','3908');
INSERT INTO "companies" VALUES('parse.ly','Parse.ly','Parse.ly is a personalization and optimization engine for content providers. They leverage data from individuals and groups of users to improve is personalization and share  the behavioral patterns among the Parsely community.
','http://www.parsely.com/about/ ','http://www.parsely.com/contact.html','http://www.parsely.com/privacy-policy/','http://www.parsely.com/','"Parse.ly’s flagship product, Dash, helps publishers to connect their readers with the most relevant, compelling content according to their interests, ultimately improving core metrics such as unique visitors, time-on-site and return visits." ','http://cdn.betteradvertising.com/logos/parsely.png','1009');
INSERT INTO "companies" VALUES('switch_concepts','Switch Concepts','Switch Concepts is a digital marketing network that connects advertisers that want to speak to social businesses to websites that target social entrepreneurs.
','http://www.switchconcepts.com','http://www.switchconcepts.com/contact.php','http://www.switchconcepts.com/privacy','http://www.switchconcepts.com','"Switch Concepts is a unique digital marketing network that looks to connect advertisers who want to speak to social businesses with websites who target social entrepreneurs."','https://static.wixstatic.com/media/467347_c39006de3fb34686a1afebc1ac73a60d~mv2.png/v1/fill/w_237,h_48,al_c,usm_0.66_1.00_0.01/467347_c39006de3fb34686a1afebc1ac73a60d~mv2.png','846');
INSERT INTO "companies" VALUES('sitescout','SiteScout','"We build ad serving technology such as our real-time bidding (RTB) platform that allows advertisers to buy traffic in ways that were never before possible. In addition, we have an enterprise-level ad server for advertisers that is unmatched in performance and power for premium (direct) media buying."','http://www.sitescout.com/about/','http://www.sitescout.com/contact/','http://www.sitescout.com/privacy/','http://www.sitescout.com','"In 2009, we were media buyers. But, the media buying tools available lacked the capabilities that we needed to run profitable ad campaigns. So, we built our
own proprietary solution and
made it available to everyone.
Since then, SiteScout has been used by thousands of advertisers to buy billions of ad impressions across the web and on mobile devices.
Our commitment to developing powerful, easy-to-use technology, that puts real-time advertising into the hands of marketers, has made us the world’s favorite self-serve ad buying platform."
','http://cdn.betteradvertising.com/logos/sitescout1.png','1256');
INSERT INTO "companies" VALUES('semasio','Semasio','None','http://semasio.com/company','http://semasio.com/contact','http://semasio.com/privacy-policy','http://semasio.com/','"The User Intelligence Platform enables you to turn all of the potentially hundreds of contacts you have with digital media users into data points from which a qualitatively new level of information is derived – information which belongs to you and only you."','http://cdn.betteradvertising.com/logos/semasio1.png','2088');
INSERT INTO "companies" VALUES('linkedin','LinkedIn','LinkedIn is a social networking site. It provides tools to create and maintain professional connections, recommend job opportunities, and connect with industry experts and businesses.  Their services are available through website, mobile applications, and developer platforms.','https://www.linkedin.com/about-us','https://help.linkedin.com/app/ask/path/ppq','https://www.linkedin.com/legal/privacy-policy','https://www.linkedin.com/','"LinkedIn takes your professional network online, giving you access to people, jobs, and opportunities. Built upon trusted connections and relationships, LinkedIn has established the world’s largest and most powerful professional network.

To learn more about how we collect and use information for online advertising, please visit:

https://www.linkedin.com/legal/privacy-policy

If you are a LinkedIn member, we recommend that you opt out from your LinkedIn Privacy Settings here: https://www.linkedin.com/settings/?trk=nav_account_sub_nav_settings&modal=nsettings-enhanced-advertising. This will opt you out from LinkedIn data collection and targeting cookies on any computers, mobile devices and browsers you use to visit third party sites, provided you have logged onto LinkedIn."','http://cdn.betteradvertising.com/logos/linkedin.png','831');
INSERT INTO "companies" VALUES('vi','Vi','None','http://www.vi.ru/pages.aspx?id=569f5c03-71cd-4e9c-8e5f-cd1889f7c4b5','Not found','http://www.vi.ru/confedent.aspx','http://www.vi.ru/','"Vi - the largest in Russia and Eastern Europe media advertising market operator. The Company sells media advertising opportunities and provides them with comprehensive analytical services, legal and IT-support. Vi serves leading television stations across Russia, Belarus and Kazakhstan, the Russian federal radio, Internet resources, a network of cinemas, as well as digital indoor shopping malls, supermarkets, airports, etc."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/vi.png','3165');
INSERT INTO "companies" VALUES('stroer','Stroer',NULL,'','Not found','http://www.stroeer.de/service/datenschutz.html',' http://www.stroeer.de/','“adscale is Germany’s leading marketplace for digital advertising, bringing advertisers and website operators together to buy and sell video, display and text advertising.”',' http://www.stroeer.de/fileadmin/templates/img/logo-de.png','342');
INSERT INTO "companies" VALUES('flxone','FlxOne','None','http://flxone.com/#about','http://www.flxone.com/#contact','Not found','http://www.flxone.com/','"We distil the advertising world’s most advanced technologies into easy-to-use tools that put buyers and sellers back in the driver’s seat. Our solutions cut through the digital clutter – giving you greater transparency, razor-sharp targeting and unparalleled insights to make the right decisions every step of the way."','http://cdn.betteradvertising.com/logos/flxone.png','2710');
INSERT INTO "companies" VALUES('spongecell','Spongecell','Spongecell is an advertising technology company, specializing in online banner ads with rich-media-like functionality.  The company works with creative and media agencies to deliver interactive display ads that combine different dynamic elements.','http://www.spongecell.com/about','http://www.spongecell.com/contact-us ','http://www.spongecell.com/privacy-policy','http://www.spongecell.com/','','http://cdn.betteradvertising.com/logos/spongecell1.png','552');
INSERT INTO "companies" VALUES('yandex','Yandex','Yandex is a Russian search engine and Internet services firm. They also offer a variety of other online services including: news, weather, traffic, maps, personal email, and a web analytics platform. Yandex also operates an ad network.','https://yandex.com/company/general_info/yandex_today/','https://yandex.com/company/contacts/moscow/','https://yandex.com/legal/privacy/','https://www.yandex.com/','"We are the leading internet company in Russia, operating the most popular search engine and the most visited website. We also aggregate and organize extensive local, national and international content and offer a broad range of additional services."','http://cdn.betteradvertising.com/logos/yandex.png','185');
INSERT INTO "companies" VALUES('clever_push','Clever Push','None','Not found','https://cleverpush.com/contact','https://cleverpush.com/privacy','https://cleverpush.com/','','https://yt3.ggpht.com/-5zrVJ4ECV5E/AAAAAAAAAAI/AAAAAAAAAAA/fp0TcDNnk_w/s100-c-k-no-mo-rj-c0xffffff/photo.jpg','4487');
INSERT INTO "companies" VALUES('ipg_mediabrands','IPG Mediabrands','None','https://www.ipgmediabrands.com/about-us/','Not found','https://www.ipgmediabrands.com/privacy-policy/','https://www.ipgmediabrands.com/','WHO WE ARE

First, let’s talk about what we’re not.

We’re not a network that is limited by our size, outdated procedures or our structure. We’re not too proud or stratified to recognize the power of collaboration – in fact, we encourage it. We’re not satisfied with maintaining the status quo because we are already planning for tomorrow’s challenges and innovations.

We are IPG Mediabrands, a new world agency group designed with dynamic marketing at its core.

We are 8,500 marketing communication, media and technology specialists in over 130 countries. We are a diverse group of innovators, technologists, designers, scientists, musicians, strategists, buyers, thinkers, planners and mathematicians that are committed to building new solutions for the world’s top brands.

We are dynamic, empowered and entrepreneurial.

WHAT WE BELIEVE

Our network is unified by a shared philosophy we call “Dynamic By Design”. More than just a catch phrase, Dynamic By Design is our commitment to our clients, partners and each other to think and work differently.

It makes us agile, freeing us from the burdens of old ways of thinking and enabling us to leap into opportunity.

It breaks down barriers, building a single integrated business where communication and collaboration come as standard.

It thrives on questions, leaving behind a “set and forget” mentality, embracing adaptation and innovation.

It helps our clients grow, bringing a better experience and bigger results every time.','http://cdn.betteradvertising.com/logos/IPG_Mediabrands.PNG','4181');
INSERT INTO "companies" VALUES('amazon_associates','Amazon','Amazon Associates product advertising API allows publishers to advertise Amazon products on their Web sites using product search, customer reviews, wish lists and look up capabilities. Publishers make money off referral fees when users buy qualifying products off Amazon sites.','Not found','https://www.amazon.com/gp/help/contact-us/features-and-services.html?ie=UTF8&nodeId=&type=email&skip=true','http://www.amazon.com/gp/help/customer/display.html?ie=UTF8&nodeId=468496','https://affiliate-program.amazon.com/','"The Product Advertising API provides programmatic access to Amazon’s product selection and discovery functionality so that developers like you can advertise Amazon products to monetize your website. You can make money using the Product Advertising API to advertise Amazon products in conjunction with the Amazon Associates program."','http://cdn.betteradvertising.com/logos/amazonassociates.png','14');
INSERT INTO "companies" VALUES('maxmind','MaxMind','"MaxMind provides IP intelligence through the GeoIP brand. By pinpointing the location of Internet customers and visitors by country, geographic region, city, and postal code, GeoIP data provides online businesses with a valuable marketing tool as well as the ability to customize their websites to better serve clients."','https://www.maxmind.com/en/about-maxmind','Not found',' https://www.maxmind.com/en/privacy_policy','http://www.maxmind.com/  ','"MaxMind provides IP intelligence through the GeoIP brand. By pinpointing the location of Internet customers and visitors by country, geographic region, city, and postal code, GeoIP data provides online businesses with a valuable marketing tool as well as the ability to customize their websites to better serve clients."','http://cdn.betteradvertising.com/logos/maxmind2.png','1460');
INSERT INTO "companies" VALUES('soundcloud','SoundCloud','','http://soundcloud.com/pages/contact','Not found','http://soundcloud.com/pages/privacy','http://soundcloud.com/','"SoundCloud is the world’s leading social sound platform where anyone can create sounds and share them everywhere. Recording and uploading sounds to SoundCloud lets people easily share them privately with their friends or publicly to blogs, sites and social networks."','http://cdn.betteradvertising.com/logos/soundcloud.png','1817');
INSERT INTO "companies" VALUES('owneriq','OwnerIQ','OwnerIQ collects and interprets product purchase intent and ownership data as consumers travel the Web. This enables advertisers to target their online advertising, direct marketing, and market research based on consumer purchase behavior and patterns. OwnerIQ operates a wholly owned product support site, ManualsOnline.com.','http://www.owneriq.com/about','Not found','http://www.owneriq.com/privacy-policy','http://www.owneriq.com/','"The ownerIQ second-party data difference
ownerIQ’s launchpad into the Qniverse is the first and only second-party data marketplace for brands, retailers and advertisers (or companies that have existing relationships) to share their often related online audiences for dynamic digital advertising. There are over 600 brands and retailers are collaborating and benefiting from the power of the Qniverse today."','http://cdn.betteradvertising.com/logos/owneriq.png','321');
INSERT INTO "companies" VALUES('bombora','Bombora','Madison Logic is a B2B ad network focused on online lead generation and performance marketing. Their LeadFocus technology provides a yield and inventory management solution for publishers to monetize content.','http://bombora.com/about/','http://bombora.com/contact/','http://bombora.com/privacy/','http://bombora.com/','"Bombora’s experienced management team has extensive B2B data and marketing expertise having worked with some of the world’s most renowned companies including: Madison Logic, IndustryBrains, DoubleVerify, AdFin, Bizo, Ziff-Davis and Experian."','http://cdn.betteradvertising.com/logos/bombora.png','933');
INSERT INTO "companies" VALUES('adnologies_gmbh','ADNOLOGIES GmbH','Adnologies GmbH is a provider of digital marketing solutions for agencies, portal operators and marketers. At the core is their ASP (Application Service Provider) ad serving solution HEIAS. The nature of the product design allows for flexibility and quick customization across many platforms. Services also include retargeting.','http://www.adnologies.com/en/company/  ','Not found','http://ads.heias.de/w3c/policy.html','http://www.adnologies.com/en/','"ADNOLOGIES GmbH is an independent supplier of software solutions for contemporary digital marketing to agencies, sales houses, networks and the operators of portals."','http://cdn.betteradvertising.com/logos/adnologies1.png','466');
INSERT INTO "companies" VALUES('usabilla','Usabilla','None','https://usabilla.com/about','Not found','https://usabilla.com/privacy','https://usabilla.com/','"At Usabilla, we believe in the power of continuous, visual live user feedback. We develop online tools that help our clients test, measure, and improve both the usability and the UX of their websites."','http://blog.usabilla.com/demo/wp-content/uploads/2015/06/logo-1.png','2858');
INSERT INTO "companies" VALUES('integral_ad_science','Integral Ad Science','AdSafe Media provides online advertising brand protection and risk management solutions. The company offers a suite of products and services for brands, agencies, ad networks and publishers. Its rating system provides a third-party content rating and certification platform to help standardize and control the online advertising ecosystem.','http://integralads.com/about/','http://integralads.com/contact-us','http://integralads.com/privacy-policy','http://integralads.com/','"Ahead of the class and nowhere near finished

We are a global media valuation platform that enables digital buyers and sellers to assess the value of every ad opportunity across channels and screens, and make informed decisions that maximize ROI.

Through constant technological innovation, key partnerships, and strong client relationships, we’re driving the industry toward realizing the full potential of online advertising."','http://cdn.betteradvertising.com/logos/integraladsci.png','474');
INSERT INTO "companies" VALUES('userreport','UserReport','"We measure usability and shows where different kind of visitors click on your website. Lets users voice their ideas on how to improve your website through a feedback forum."','http://www.userreport.com/about-userreport/','Not found','http://www.userreport.com/general-invitation-privacy-policy/','http://www.userreport.com/','"We measure usability and shows where different kind of visitors click on your website. Lets users voice their ideas on how to improve your website through a feedback forum."','http://cdn.betteradvertising.com/logos/userreport.png','1462');
INSERT INTO "companies" VALUES('ibm','IBM',NULL,'Not found','https://www.ibm.com/scripts/contact/contact/us/en/privacy/','https://www.ibm.com/privacy/details/us/en/','https://www.ibm.com/us-en/marketplace/analytics-for-your-digital-properties','"IBM® Digital Analytics, formerly Coremetrics Web Analytics, is a platform for near real-time digital analytics, data monitoring and comparative benchmarking. It analyzes and reports on your visitors'' digital journeys—across marketing touchpoints and channels—to provide customer insights that help marketers deliver more personalized, relevant and effective marketing. You can expand the IBM Digital Analytics platform with options to analyze multiple sites, offline customer behavior, ad relevancy, impression attribution and social media channels.
The IBM Digital Analytics platform helps you:
Gain marketing insights quickly with intuitive dashboards that monitor behavioral customer data on demand.
Remove barriers for applying web analytics data by harnessing near real-time analytics and surfacing them quickly in your marketing plans and actions.
Identify real campaign contributions and attribution insights by evaluating individual channels as well as the combined effect of multiple marketing touchpoints.
Turn behavioral insights into automated digital marketing action across digital channels for faster revenue gains.
Simplify web analytics management and delivery by integrating analytics data easily with your marketing systems."','http://cdn.betteradvertising.com/logos/IBM.png','48');
INSERT INTO "companies" VALUES('33across','33Across','33Across is a social advertising company that develops technology to identify users for online marketing purposes. It offers SocialDNA, a platform that creates custom segments to help advertisers and agencies understand customers who are socially connected to brands.   33Across enables advertisers to utilize social data both within and outside of social networks to provide cross-publisher display campaigns and improve brand and direct response programs.','http://33across.com/about/','http://33across.com/contact/','http://33across.com/privacy-policy/','http://33across.com/','33Across is the first publisher traffic and monetization platform to guarantee quality through ads that are 100 percent in-view with a pre-bid fraud filter. Through our advanced technology, and insight into how people view, consume and share content across devices, we enable more than one million publishers to increase revenue and traffic. The 33Across traffic building, insights, and monetization tools allow publishers to do what they do best – create great content.

','http://cdn.betteradvertising.com/logos/33across2.png','375');
INSERT INTO "companies" VALUES('dataxu','DataXu','DataXu is an optimization platform that incorporate bidding algorithms that evolve based on performance insights. This allows them to value, buy and optimize each ad impression in real-time for decision opportunities as they occur. DataXu''s approach is designed to improve on technologies that require pre-optimized categories or broad audience segments.','http://www.dataxu.com/about-us/','http://www.dataxu.com/contact-us/','http://www.dataxu.com/about-us/privacy/data-collection-platform/','http://www.dataxu.com/','"DataXu provides the leading real-time media management platform for digital advertising campaigns across online, mobile and video channels. With a transformative approach to digital advertising - combining automated media buying, optimization and analytics - DataXu helps brands and their agencies use dynamic ad decisioning intelligence for the highest media effectiveness, better operational efficiencies and unique consumer insights."','http://cdn.betteradvertising.com/logos/dataxu_logo_RGB.svg','292');
INSERT INTO "companies" VALUES('leadplace','LeadPlace','None','http://leadplace.co.uk/','Not found','http://leadplace.co.uk/vieprivee.html','http://leadplace.co.uk/','LeadPlace creates Anticipation Marketing campaigns,
allowing advertisers to anticipate, target, identify the life events,
desire for change of their Customers, Prospects.','http://cdn.betteradvertising.com/logos/leadplace.jpg','3989');
INSERT INTO "companies" VALUES('catchpoint_systems','Catchpoint Systems','None','http://www.catchpoint.com/about.html','Not found','http://www.catchpoint.com/privacy-policy.html','http://www.catchpoint.com/','"Catchpoint provides real time analytics in the end to end performance of internet services. Our web performance and application monitoring tools allow companies to measure the behavior of their services from multiple vantage points to better understand their performance and the factors impacting it."','http://cdn.betteradvertising.com/logos/catchpoint.png','2897');
INSERT INTO "companies" VALUES('taboola','Taboola','','https://www.taboola.com/our-story','https://www.taboola.com/contact','https://www.taboola.com/privacy-policy','https://www.taboola.com/','"Seven years before Taboola started, we were just a bunch of geeks in the Israeli army, passionate about the unique problems that can be solved with advanced mathematics. In the early days, Adam Singolda, our Founder & CEO, became passionate about the discovery problem as he realized that people don’t really wake up in the morning thinking about new videos or articles they would like to consume that day. Search could never solve that problem: how can someone search for something they don’t even know exists?
In July 2007, Taboola was founded and we began thinking about content consumption patterns, and ways to predict the videos people may like before ever expressing an interest in watching them. It took us 3.5 years to innovate around what became the foundation for Taboola''s mathematical predictive engine, Taboola EngageRank™, that later became part of publishers’ workflows given its various optimization capabilities. This algorithmic innovation around video then helped Taboola broaden its solution to recommend articles and slideshows, providing world-leading publishers with a single, ultimate discovery and monetization solution.
These days, passionate about connecting people around-the-world with content they may like, there are over 400 of us "Taboolars" drilling out recommendations between NY, Pasadena, London, Israel, India and Bangkok. Taboola is widely recognized as the world’s leading content discovery platform, reaching 1B unique visitors and serving over 360 billion recommendations every month.
Publishers, marketers, and agencies leverage Taboola to retain users on their site, monetize their traffic and distribute their content to drive high quality audiences. Publishers using Taboola include USA Today, NYTimes, TMZ, Politico.com, BusinessInsider, CafeMom, Billboard.com, Fox Television, Weather.com, Examiner, and many more."
','http://cdn.betteradvertising.com/logos/taboola.png','1463');
INSERT INTO "companies" VALUES('rubicon_project','Rubicon Project','The Rubicon Project is a publisher network focused on promoting publisher content to premium advertisers. REVV for Publishers is a yield management optimization platform engineered to accelerate revenue for premium web publishers.','http://rubiconproject.com/whoweare/','http://rubiconproject.com/contact-us/','http://rubiconproject.com/rubicon-project-yield-optimization-privacy-policy/','http://rubiconproject.com','"Rubicon Project is a leading technology company automating the buying and selling of advertising. Relentless in its efforts for innovation, Rubicon Project has engineered one of the largest real-time cloud and Big Data computing systems, processing trillions of transactions within milliseconds each month.  The company''s pioneering technology created a new model for the advertising industry – similar to what NASDAQ did for stock trading. Rubicon Project''s automated advertising platform is used by the world''s leading publishers and applications to transact with top brands around the globe.ounded in 2007, Rubicon Project''s mission is to keep the Internet free and open and fuel its growth by making it easy and safe to buy and sell advertising. Rubicon Project pioneered advertising automation technology to enable the world''s leading brands, content creators and application developers to trade and protect trillions of advertising requests each month and to improve the advertising experiences of consumers. Rubicon Project is a publicly traded company (NYSE: RUBI) headquartered in Los Angeles, California. - See more at: http://rubiconproject.com/whoweare/#sthash.lysxULOn.dpuf"
','http://cdn.betteradvertising.com/logos/rubicon_project_new.png','168');
INSERT INTO "companies" VALUES('lengow','Lengow','None','https://www.lengow.com/about/',' https://www.lengow.com/contact-us/','https://www.lengow.com/legal-notice/','http://www.lengow.com/','"Distribute your product catalogues on all comparison shopping sites, marketplaces, affiliate networks, social networks and sponsored links!"','http://cdn.betteradvertising.com/logos/lengow.png','2127');
INSERT INTO "companies" VALUES('adition_technologies_ag','Adition Technologies AG','Adition Technologies provides ad serving technology.  Their flagship product, ADITION adserving delivers, reports and analyzes users'' behavior after an ad has been served to a user. With ADITION adserving, clients have a single solution for display, mobile and video advertising.','https://www.adition.com/unternehmen/','https://www.adition.com/kontakt/','https://www.adition.com/kontakt/datenschutz/','http://www.adition.com/','"ADITION technologies AG specializes in the development and sale of proprietary ADITION adserving technology. The history of ADITION adserving began in 2001, as the base technology for the marketing portfolio of virtual minds AG was conceived. The continuously advanced ad serving technology in 2004 introduced into the new founded ADITION technologies AG, with the aim of independent product development and commercialization.
As one of the few remaining independent ad-serving service providers in Europe, we offer a single solution for publishers and marketers as well as for agencies, direct clients and specialist suppliers (eg. B. Performance-marketeers). Thus ADITION across the segments of the technology partners No.1 for Unified Adserving Solutions.
ADITION with more than 70 billion ad requests per month from DoubleClick (Google) the second largest premium ad serving provider in the German area and one of the key players in the European market.
OUR QUALITY STANDARDS
With a constantly high quality, fast response times and a partnership operation we have always convince our customers and partners - every day anew. Under strict compliance with German and European data protection rules, we provide our customers with legal security, brand and investment protection, and the highest quality in terms of performance, efficiency and stability.
A STRONG ALLIANCE
As an independent and neutral technology company in the composite of the virtual minds group ADITION supports an international customer base in the implementation of its digital strategy which includes, among 1 & 1, Otto, Payback, Performance Media, Plan.Net, redblue (Media Markt, Saturn), Sixt, mirror QC swisscom and Telefónica count."
','http://cdn.betteradvertising.com/logos/aditiontechnologiesag.png','459');
INSERT INTO "companies" VALUES('smartclip','smartclip','','http://www.smartclip.com/about-us','Not found','http://www.smartclip.com/privacy-policy','http://www.smartclip.com/','"smartclip is the European Leader for Video Advertising, delivering video ads across a variety of platforms and devices with utmost media efficiency. The company works with publishers, media agencies and advertisers, enabling all parties benefit from the placement of online video ads."','http://cdn.betteradvertising.com/logos/smartclip.png','1371');
INSERT INTO "companies" VALUES('bunchbox','Bunchbox','None','http://docs.bunchbox.co/en/basics','Not found','Not found','https://app.bunchbox.co/login','Bunchbox uses a JavaScript file on your website to do its work. Every account in Bunchbox has its own file. It contains the generic code that''s the same for every account. And it also contains the information about experiments, variants, rules that is specific to the account.','http://cdn.betteradvertising.com/logos/bunchbox.png','4095');
INSERT INTO "companies" VALUES('tag_commander','Tag Commander','','http://www.tagcommander.com/en/company/about-us','http://www.tagcommander.com/en/contact/','https://www.commandersact.com/en/privacy/','http://www.tagcommander.com/en/','"A new vision for smarter omni-channel engagement
our-story
A trio of digital marketing experts was experiencing first-hand the nightmare of tag management. While on board their flight Mike, François and Sam came to the conclusion that while the marketing and advertising ecosystem was taking off, integration and data management issues were left stuck on the ground.
There had to be a smarter way.
Several airline napkins later the idea for TagCommander was born."
','http://cdn.betteradvertising.com/logos/tagcommander.png','1789');
INSERT INTO "companies" VALUES('trustpilot','Trustpilot','None','http://','Not found','http://legal.trustpilot.com/end-user-privacy-terms','http://www.trustpilot.com','Trustpilot.com is a website founded in Denmark in 2007. Purported consumers can post reviews for online businesses, which Trustpilot is free to delete at their discretion. The site charges fees to merchants to promote their businesses.','http://cdn.betteradvertising.com/logos/trustpilot-oresund-startups-cphftw-logo.png','3861');
INSERT INTO "companies" VALUES('new_relic','New Relic','New Relic is the web application performance tool for monitoring performance from the end user experience, through servers, and down to the line of application code.','https://newrelic.com/about','https://newrelic.com/about/contact-us','https://newrelic.com/privacy','https://newrelic.com/','"New Relic gives you deep performance analytics for every part of your software environment. You can easily view and analyze massive amounts of data, and gain actionable insights in real-time. For your apps. For your users. For your business.
Lew Cirne founded New Relic in 2008 with a revolutionary vision: To deliver application performance monitoring (APM) as a purely SaaS product. By embracing the power and accessibility of the cloud, New Relic grew rapidly and quickly became an integral tool for developers, IT ops teams, and executives around the world.
Today, New Relic is helping thousands of customers consistently improve their software performance, every day, all day. See why our dynamic suite of software analytics products is changing the game for modern business."','http://cdn.betteradvertising.com/logos/newrelic.png','942');
INSERT INTO "companies" VALUES('adloox','Adloox','"Our mission: to enable advertisers and media agencies to protect their digital communication and to help adnetworks and platforms to raise the value of their inventory."',' http://www.adloox.com/solutions','http://www.adloox.com/en/contact.php','http://adloox.com/legal-notice/','http://www.adloox.com','"Our mission: to enable advertisers and media agencies to protect their digital communication and to help adnetworks and platforms to raise the value of their inventory."','http://cdn.betteradvertising.com/logos/adloox.png','1455');
INSERT INTO "companies" VALUES('visible_measures','Visible Measures','Visible Measures is a provider of independent third party measurement solutions for internet video publishers and advertisers. Visible Measures benchmarks the world of online video providing industry standard performance metrics across video content, video ads and audiences for the online video community.','http://www.visiblemeasures.com/about/our-company/','http://www.visiblemeasures.com/contact/','http://www.visiblemeasures.com/privacy-policy/','http://www.visiblemeasures.com/','"It all comes down to our data. Visible Measures was founded by a core team of engineers with the purpose of measuring and analyzing video performance for brands and publishers. We’ve built up the world’s largest viewership data footprint for branded video over the past seven years– longer than anyone else in the business.
We’ve tracked over 14,000 campaigns. We know how 380 million consumers engage with branded video content. We’ve studied consumer behavior from 3 trillion (yes, with a “t”) video views. Today – every day – we’ll monitor over 500 million videos.
Our data allows us to partner with global brands and publishers, distributing video content and offering real-time analytics and feedback that illuminates and informs those responsible for telling stories through video."','http://cdn.betteradvertising.com/logos/visiblemeasures.png','569');
INSERT INTO "companies" VALUES('intimate_merger','Intimate Merger','None','https://corp.intimatemerger.com/about/','Not found','https://corp.intimatemerger.com/privacypolicy-en/','https://corp.intimatemerger.com/','Intimate-merger Co., Ltd. as the center the President Yanashima with a track record of big data analysis became RSCTC 2010 Discovery Challenge third in the world in (the world''s largest statistical algorithm contest), established in June 2013 It is has been DMP specialized company. Using about 400 million audience data and high analysis technology boasts Japan''s largest, has been mainly carried out the assistance of data marketing of DMP building and client companies and agencies of national clients and large-scale portal site.','http://cdn.betteradvertising.com/logos/Intimate-Merge.png','4067');
INSERT INTO "companies" VALUES('hi-media_performance','Hi-media Performance','Hi-media Performance is an online advertising network. Hi-media Performance and sister company Allopass, micro-payments solutions provider, are owned by the Hi-media Group.','http://www.hi-mediaperformance.co.uk/en_GB/corporate','Not found','http://www.hi-mediaperformance.co.uk/en_GB/index/informations-legales/optout','http://www.hi-mediaperformance.co.uk/en_GB','"Hi-media delivers a wide range of services: Internet site publishing via Hi-media Publishing; content monetization via Hi-media Services."','http://cdn.betteradvertising.com/logos/himedia.png','1079');
INSERT INTO "companies" VALUES('exponential_interactive','Exponential Interactive','Exponential Interactive operates as a media services company. The company delivers products and services to online and digital advertisers. It offers site-specific, channel-wide, and run-of-network placements to CPM advertisers. The company also provides performance marketing solutions and lead generation services in targeted industry verticals.
','http://exponential.com/advertisers-overview/','http://exponential.com/contact/','http://exponential.com/privacy/','http://www.exponential.com/','"At Exponential, we enable advertisers and brands to drive real audience engagement across all of the interactive environments that consumers are embracing today – desktop, smartphone and tablet. Our platform fuses one of the largest digital media footprints and proprietary data with user-centric ad formats designed to drive engagement and action."','http://cdn.betteradvertising.com/logos/exponential2.png','64');
INSERT INTO "companies" VALUES('adverserve','adverServe','None','http://www.adverserve.com/en/technologies/','http://www.adverserve.com/en/contact/','http://www.adverserve.com/fileadmin/adverserve/dokumente_download/datenschutzerklaerung_adverserve_29.8_RV_englisch.pdf','http://www.adverserve.com/','"[adverServe] provides full service in the fields of media and technology. From campaign set-up, through database and campaign management, to integration of third-party tags campaign, optimization requirements as well as the management and development of new forms of advertising."

Tranlated by Google Translate','http://cdn.betteradvertising.com/logos/adverserve.png','2726');
INSERT INTO "companies" VALUES('hola_cdn','Hola CDN','None','https://holacdn.com/about','Not found','Not found','https://holacdn.com/','Hola was founded with the goal of making a better Internet through advanced routing technologies - making the web faster, more open and cheaper to operate. We''ve fundamentally disrupted markets with our products.

Hola is profitable, and growing fast! It has global presence, and top tier investors including DFJ (Silicon Valley), Trilogy (Seattle), Magma (Israel), Horizons Ventures (Hong Kong), and Orange (France).','http://cdn.betteradvertising.com/logos/holacdn.PNG','4896');
INSERT INTO "companies" VALUES('olark','Olark','Olark provides offers a live chat product for business websites. Their solution integrates live support and chat to businesses'' existing CRM efforts and software.','https://www.olark.com/about','https://www.olark.com/contact','https://www.olark.com/tos','https://www.olark.com/','"Olark brings hassle-free live chat to your website to track leads, drive sales, and provide top-tier support. Engage visitors on your website while they browse using your mobile device or instant messenger while viewing real-time and contextually relevant customer information (Visitor location, geographic location, and even shopping cart balances and contents with our CartSaver product)."','http://cdn.betteradvertising.com/logos/olark.png','1008');
INSERT INTO "companies" VALUES('bounce_exchange','Bounce Exchange','None','http://bounceexchange.com/#what_we_do','http://bounceexchange.com/#demo','https://www.bouncex.com/privacy/','http://bounceexchange.com','"Leveraging our exclusive "exit-intent" technology, Bounce Exchange™ is leading the paradigm shift in automated customer acquisition."','http://cdn.betteradvertising.com/logos/bounceexchange.png','2468');
INSERT INTO "companies" VALUES('beeswax','Beeswax','None','http://beeswax.com/about/','Not found','http://beeswax.com/privacy.html','http://beeswax.com/','"Beeswax hosts a dedicated RTB bidder for you in our cloud. You only listen to the auction traffic you want and you can extend and customize the bidder with your own code and services.
 We connect to all the major exchanges and normalize the supply into a single, clean OpenRTB stream across display, banners, and video. You set the specific filters you want and fine-tune supply to meet your needs.
The Beeswax Bidder-as-a-Service™ comes with a full featured campaign management and reporting system we call "Buzz". So while your tech team builds cutting edge integrations with your bidder, ad ops gets to work in a familiar DSP-style interface."
','http://cdn.betteradvertising.com/logos/beeswax.png','4160');
INSERT INTO "companies" VALUES('iadvize','iAdvize','None',' http://www.iadvize.com/en/company/','  http://www.iadvize.com/en/contact/','http://www.iadvize.com/en/privacy/','http://www.iadvize.com/','"Reassure visitors and help e-merchants reduce their dropout rates.

iAdvize is displayed as a chat bar at the bottom of the browser window and remains visible throughout the navigation session. At any time, visitors can contact a site representative for advice about a product or for help in navigation if they are confused."','http://cdn.betteradvertising.com/logos/iadvize.png','2128');
INSERT INTO "companies" VALUES('juggcash','JuggCash','None','http://www.juggcash.com/about.php?','Not found','Not found','http://www.juggcash.com','"Juggcash was created with the goal of making our affiliates more money online than any other adult affiliate programs. Juggcash was developed by Brazzers and we look forward to working with you to increase your profits online for free."','http://cdn.betteradvertising.com/logos/juggcash.png','2021');
INSERT INTO "companies" VALUES('360i','360i','360i is a digital ad agency specializing in social media, search and mobile technologies. 360i is an Innovation Interactive company.  ','https://360i.com/about/','https://360i.com/about/contact/','https://360i.com/about/privacy/','https://360i.com/','360i is an award winning digital marketing agency that drives results for Fortune 500 marketers through insights, ideas and technologies. 360i helps its clients think differently about their online presence and evolve their strategies to take advantage of the new world of marketing communications one where brands and consumers engage in interactive and multi directional conversations.
','http://cdn.betteradvertising.com/logos/_360i_.png','309');
INSERT INTO "companies" VALUES('traffic_stars','Traffic Stars','None','https://trafficstars.com/#aboutus','Not found','','https://trafficstars.com/#index_page','We started with a blank page to create TrafficStars.com. We studied all available technologies and mixed the best features from each one to develop our own system from scratch. User experience was placed in the center of our problematic. We wanted to make it powerful, secure, flexible and easy to use so everyone can benefit from our technology: from beginners to media buying experts.','https://trafficstars.com/static/landing/images/logo.png','4753');
INSERT INTO "companies" VALUES('liveperson','LivePerson','LivePerson is a chat and expert advice company. Their product connects businesses and experts with consumers seeking help on the Web. LivePerson''s hosted software platform creates a personalized online experience for the consumer, and offers live chat, click to talk and email management solutions.
','http://solutions.liveperson.com/company','http://www.liveperson.com/company/contact','http://www.liveperson.com/policies/privacy','http://www.liveperson.com/','"LivePerson is the market leader in real-time intelligent customer engagement. Our mission is to help companies create deeper connections with their customers, and our investment in real-time analytics, metrics and a world-class hosted platform makes this possible at scale."','http://cdn.betteradvertising.com/logos/liveperson.png','100');
INSERT INTO "companies" VALUES('doubleverify','DoubleVerify','DoubleVerify is a data quality verification company providing agencies, marketers, publishers and networks with real-time data auditing services to prevent duplication across audience segments.','http://www.doubleverify.com/about/','http://www.doubleverify.com/company/contact/','http://www.doubleverify.com/privacy/','http://www.doubleverify.com/','"Our accredited technology platform provides an independent, third-party set of measurements about ad impression delivery and website traffic to help advertisers and advertising inventory sellers confirm accurate delivery characteristics, including brand safety, viewability metrics, contextual and environmental parameters (e.g., the website on which an ad appears, and where it appears on the webpage) and ad impression and website traffic quality characteristics, and to help ensure that advertisers and their partners are in compliance with their agreements, as applicable. Additionally, advertisers use information we provide about ad impression opportunities to preemptively decide if they want their creative displayed in the available impression environment. DoubleVerify collects this data about advertising delivery and website traffic on behalf of both advertisers and sellers and shares the information we collect to drive transparency and accountability in the online advertising marketplace."','http://cdn.betteradvertising.com/logos/doubleverify1.png','58');
INSERT INTO "companies" VALUES('dc_storm','DC Storm','DC Storm is a technology company delivering Software as a Service (SaaS) technology for online marketing. DC Storm provides web analytics (StormAnalytics) and PPC optimization technology (StormOptimiser) to digital marketing agencies as well as directly to advertisers. Their product suite ˜StormIQ allows clients to manage, optimize and analyze their campaigns and websites through one interface.
','http://dc-storm.com/en-uk/about-us/','http://dc-storm.com/en-uk/contact-us/','http://dc-storm.com/en-uk/privacy-policy/','http://www.dc-storm.com/','"Rakuten Attribution (formerly DC Storm) delivers Measured Success™ which arms digital businesses with performance measurement tools, analysis and reporting, powering great decisions and driving success.
Since its launch in 2004 as DC Storm, Rakuten Attribution has gained an enviable reputation for building tailored solutions which respond to both client and industry needs. It now works with many of the most progressive digital brands who use the Storm Platform to accurately value and optimise their online marketing activities.
With offices in the UK, Germany and the USA, DC Storm currently works with over 1000 websites worldwide. Its clients not only benefit from using its award-winning technology modules, but also receive exceptional service, support and training."
','http://cdn.betteradvertising.com/logos/rakuten.dc.storm.png','237');
INSERT INTO "companies" VALUES('bauer_media','Bauer Media','None','https://www.bauermedia.com/unternehmen/','Not found','https://www.bauermedia.com/datenschutz/','http://www.bauermedia.com','"Bauer Media is a division of the Bauer Media Group, Europe’s largest privately owned publishing Group. The Group is a worldwide media empire offering over 300 magazines in 15 countries, as well as online, TV and radio stations."','http://cdn.betteradvertising.com/logos/bauermedia.png','2001');
INSERT INTO "companies" VALUES('onesignal','OneSignal','None','https://onesignal.com/about','Not found','https://onesignal.com/privacy_policy','https://onesignal.com/','Our mission is to become the ubiquitous platform for all mobile and web notification messages that apps send to users, and we''re well on our way. Our easy-to-use developer SDKs empower developers and marketers to deliver effective push notifications to their users on all smartphone platforms.

Our stack includes Ruby, Rails, Rspec, Coffeescript, PostgreSQL, and Redis. Our backend systems currently send tens of millions of notifications per day and process upwards of 400,000 API requests per minute.','http://cdn.betteradvertising.com/logos/OneSignal-logo-80.lv_.jpg','4304');
INSERT INTO "companies" VALUES('pubmatic','PubMatic','PubMatic provides ad optimization solutions to online publishers. It provides  online publishers with a single interface to integrate with multiple ad networks and exchanges selecting the most lucrative ads available on a real-time auction basis.','http://www.pubmatic.com/about-us.php','http://pubmatic.com/about-us.php#officelocations','http://www.pubmatic.com/privacy-policy.php','http://www.pubmatic.com/','PubMatic is the leading marketing automation software company for publishers. Through real-time analytics, yield management, and workflow automation, PubMatic enables publishers to make smarter inventory decisions and improve revenue performance. Focused on serving the needs of premium publishers, PubMatic inspires buyer confidence by providing flexibility in audience discovery and planning media campaigns through its Media Buyer Console and APIs. The company''s marketing automation software platform provides a global roster of comScore publishers with a single view into their advertiser relationships across every screen, every channel and every format. PubMatic was ranked by Deloitte as one of the fastest growing companies in the US for the fourth consecutive year in 2015. The company has offices worldwide, and is headquartered in Redwood City, California.','http://cdn.betteradvertising.com/logos/pubmatic2.png','348');
INSERT INTO "companies" VALUES('perfect_market','Perfect Market','None','http://perfectmarket.com/about-us/','http://perfectmarket.com/contact-us/','http://perfectmarket.com/privacy-policy/','http://perfectmarket.com/','"Perfect Market, Inc. is [a] provider of digital publishing software solutions for driving traffic, engagement and revenue."','http://cdn.betteradvertising.com/logos/perfectmarket.png','2736');
INSERT INTO "companies" VALUES('flowplayer','FlowPlayer','None','https://flowplayer.org/about/','https://flowplayer.org/contact/','https://flowplayer.org/about/privacy-policy.html','https://flowplayer.org/','Our mission is to build the best system for online video. No matter whether you are an enterprise, small business or an individual blogger.','http://','4848');
INSERT INTO "companies" VALUES('metapeople','Metapeople','None','http://www.metapeople.com/uber-uns/','http://www.metapeople.com/kontakt/','http://www.metapeople.com/datenschutz/','http://www.metapeople.com/','"Metapeople GmbH together with its associated subsidiaries stands for customized solutions for national and international online marketing projects in the areas of Search-Engine-Marketing, Search-Engine-Optimization, Affiliate-Marketing, Social-Media and Online-Media."','http://cdn.betteradvertising.com/logos/metapeople.png','2783');
INSERT INTO "companies" VALUES('sailthru','Sailthru','',' http://www.sailthru.com/company/','http://www.sailthru.com/contact-us/','http://www.sailthru.com/legal/#privacy-statement','https://www.sailthru.com','"Sailthru is the only company that provides fully automated, 1:1 email and onsite recommendations using a unique behavioral targeting platform."','http://cdn.betteradvertising.com/logos/sailthru1.png','1550');
INSERT INTO "companies" VALUES('connextra','Connextra','Connextra is an ad serving company focused on the gambling and travel industries. Their technology enables integration of live pricing into online ads helping to maximize the performance of the creative and to improve results from publishing partners and affiliates. Connextra''s services include IP and browser targeting, linking live data to editorial content, real-time statistics and reporting and real-time editing of Flash, HTML or GIF advertisements.','http://connextra.net/aboutUs/aboutUs.htm','Not found','http://connextra.net/privacy_policy.htm','http://connextra.net/index.htm','"Connextra is the gaming industry’s No 1 adserver, delivering live prices & messages into dynamically-built online adverts."','http://cdn.betteradvertising.com/logos/connextra.png','502');
INSERT INTO "companies" VALUES('lkqd','LKQD','None','','http://lkqd.squarespace.com/contact','http://lkqd.squarespace.com/privacy-policy','http://www.lkqd.com/','Introducing LKQD FUSION, a feature-rich single tag solution capable of delivering both Flash and HTML5 video ads in any desktop player.  Paired with an intelligent dynamic ad decisioning process that helps maximize publisher revenue without requiring constant management of advertiser tags.  Never manage a "waterfall" again.  Read More','http://cdn.betteradvertising.com/logos/lkqd.png','4757');
INSERT INTO "companies" VALUES('pushcrew','Pushcrew','None','http://','https://pushcrew.com/contact-us/','https://pushcrew.com/privacy-policy/','https://pushcrew.com/','','https://pushcrew.com/assets/images/logo.png','4418');
INSERT INTO "companies" VALUES('clickonometrics','Clickonometrics','None','Not found','http://clickonometrics.pl/','Not found','http://clickonometrics.pl/','"We develop tools and technologies that collect and analyze data for business. We support companies and institutions operating in the online advertising market."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/clickonometrics.png','2889');
INSERT INTO "companies" VALUES('wordpress.com','WordPress.com','WordPress.com is a hosted version of the open source blogging package WordPress. WordPress.com offers more limited functionality on the look, feel and capabilities of the WordPress blogs they host. They generate revenue by offering paid a la carte upgrades on their hosted blogs. WordPress.com is owned by Automattic.','http://en.wordpress.com/about/','http://en.support.wordpress.com/contact/','https://automattic.com/privacy/','http://www.wordpress.com','"We created WordPress.com, a hosted version of the open source package where you can start a blog in seconds without any technical knowledge."','http://cdn.betteradvertising.com/logos/wordpressdotcom.png','21');
INSERT INTO "companies" VALUES('adtrue','AdTrue','None','http://adtrue.com/about/','http://adtrue.com/contact/','Not found','http://adtrue.com/','','http://adtrue.com/logo-dark-adtrue.png','4648');
INSERT INTO "companies" VALUES('ensighten','Ensighten','Ensighten provides tag management technology. Ensighten Manage, the company''s flagship product, supports all vendors in a native format, as well as within Flash and other compiled applications. It eliminates the need for development resources to implement, customize or remove vendor tags in any technological environment.
','http://www.ensighten.com/company/about-us/','http://www.ensighten.com/company/contact-us/','http://www.ensighten.com/privacy-policy/','http://www.ensighten.com','"Ensighten''s tag management platform for web, flash and mobile provides organizations with web agility - allowing them to effectively deploy, manage, test and optimize 3rd party applications for analytics, advertising, content targeting and many others."','http://cdn.betteradvertising.com/logos/ensighten.png','728');
INSERT INTO "companies" VALUES('flashtalking','Flashtalking','Flashtalking is a UK based independent provider of rich media & video ad serving. They build tools to enable creative agencies to design engaging and effective advertising campaigns for global client lists. Flashtalking technology uniquely allows agencies to create high quality video and smaller video files for seamless ad delivery using innovative video and rich media effects.','http://www.flashtalking.com/us/about-us/','Not found','http://www.flashtalking.com/privacypolicy/','http://www.flashtalking.com/','"Flashtalking is Europe''s largest independent provider of award-winning, innovative Rich Media & Video Ad Serving. Through a powerful combination of a proprietary creative platform, elegant workflow, advanced analytics (cross site duplication, path to conversion, search integration, etc.), hands-on full service and decades of rich media experience, Flashtalking delivers exactly what forward-thinking teams need to develop highly effective Global digital campaigns very efficiently."','http://cdn.betteradvertising.com/logos/flashtalking.png','442');
INSERT INTO "companies" VALUES('adara_analytics','ADARA Analytics','Adara Media (formerly Opinmind) provides tools for optimizing  advertising across multiple ad networks and exchanges for advertisers. Adara Media collects, organizes and interprets Web traffic data  categorizing high-value audience segments used to target consumers.','http://adara.com/about-us','Not found','http://adara.com/privacy-promise','http://adara.com/','"ADARA provides digital advertising and analytic services for the benefit of our business customers, giving them the ability to reach Internet users and consumers (like you) who are most likely to be interested in their respective products and services. ADARA provides these services to customers such as website operators and mobile application developers that have installed ADARA Tags or SDKs (“Marketing Partners”). Consumers (like you) benefit from ADARA’s technology by receiving more relevant online marketing content."
','http://cdn.betteradvertising.com/logos/Adaralogo.png','286');
INSERT INTO "companies" VALUES('whos.amung.us','whos.amung.us','Whos.Amung.Us is a web analytics service that uses widgets to enable web publishers to collect data on sources ranging from individual users to popular pages. Its map widget shows where all of the past and current visitors have come from.  The maps are customizable and the background, pin style/colors, and size are all configurable.','http://whos.amung.us/about/','http://whos.amung.us/contact/','http://whos.amung.us/legal/privacy/','http://whos.amung.us/','"Our widgets tell you how many users are on your website or blog right now, what pages they are on, how many of them there has been in the past, and where they come from - live."','http://cdn.betteradvertising.com/logos/whosamungus.png','239');
INSERT INTO "companies" VALUES('effective_measure','Effective Measure','Effective Measure is a web analytics company that provides data about visitors to a website. Their patent-pending Digital Helix technology addresses cookie deletion issues and unique visitor audience calculations. This allows advertisers and publishers to define and measure audience numbers accurately without duplication, and track data points over a specific time period.','http://www.effectivemeasure.com/about','http://www.effectivemeasure.com/contact','http://www.effectivemeasure.com/privacy-policy/','http://www.effectivemeasure.com/','Effective Measure is a leading provider of digital audience, brand and advertising effectiveness measurement and targeting solutions, bringing best practice online measurement data to premium publishers, agencies, networks, advertisers and researchers.

The EM solutions offer brands, media and agencies invested in Oceania, Southeast Asia, Europe, Middle East North Africa and South Africa, a clear insight into their online audience and the ever-growing Internet population.','http://cdn.betteradvertising.com/logos/effectivemeasure_logo.png','607');
INSERT INTO "companies" VALUES('run','RUN','','Not found','Not found','http://www.runads.com/privacy-policy','http://www.runads.com/','"Our focus at RUN revolves around real time bidding technologies and the proper utilization of multiple tactics, cross-digital audience planning/buying, API integration, real time analytics, data visualization, and much, much more. Our platform weaves together and streamlines various vertical technology solutions currently found in the marketplace through a single, agnostic, cross platform trading desk." Run is owned by Project X Labs.','http://cdn.betteradvertising.com/logos/run1.png','1806');
INSERT INTO "companies" VALUES('branch_metrics_inc','Branch Metrics Inc','None','https://branch.io/about/','Not found','https://branch.io/privacy_policy/','https://branch.io/','"Branch provides free deep linking technology for mobile app developers to gain and retain users. We''re on a mission to help solve mobile discovery by connecting users to relevant app content through deep links.

We''re backed by amazing investors who share that vision. In total, we''ve raised over $53 million in funding from Founders Fund, New Enterprise Associates, Ben Narasin, Pejman Mar Ventures, Cowboy Ventures, Zach Coelius, Madrona Venture Group, Greylock Partners, Redpoint Ventures, Lightspeed Venture Partners and TriplePoint Capital."','http://cdn.betteradvertising.com/logos/branchDOTio.png','4164');
INSERT INTO "companies" VALUES('seznam','Seznam','None','https://onas.seznam.cz/cz/o-firme/vize-firmy/','Not found','Not found','https://onas.seznam.cz/cz/','','https://onas.seznam.cz/frontend/img/logo-onas2.gif','4620');
INSERT INTO "companies" VALUES('komoona','Komoona','',' http://www.komoona.com/#about-us','http://www.komoona.com/#contact-us','Not found','http://www.komoona.com/#home','"Our mission is to bring true monetization and optimization abilities to the long tail and maximize publisher’s income. With billions of impressions being served through our system, we are able to offer sites of all caliber services that are usually only available for top brand publishers."','http://cdn.betteradvertising.com/logos/komoona.png','1865');
INSERT INTO "companies" VALUES('intercom','Intercom','Intercom is a customer relationship management and messaging tool for web app owners.','https://www.intercom.com/about','https://www.intercom.com/contact','https://docs.intercom.com/pricing-privacy-and-terms/intercom-inc-privacy-policy','https://www.intercom.com/','Intercom is a customer relationship management and messaging tool for web app owners.','http://cdn.betteradvertising.com/logos/intercom.png','1161');
INSERT INTO "companies" VALUES('cxense','Cxense','cXense provides web-based services to businesses to improve the overall relevance of their web applications. These services are advertising, analytics, search and personalization.','https://www.cxense.com/about-us',' https://www.cxense.com/contact-us','http://www.cxense.com/about-us/privacy-policy','http://www.cxense.com/','"Cxense (pronounced see•sense) is a global software company founded by a team of software and internet media leaders who share a passion for delivering innovative and intuitive solutions that help companies understand their audience and build great online user experiences."','http://cdn.betteradvertising.com/logos/cxense2.png','1160');
INSERT INTO "companies" VALUES('rythmone','RythmOne','None','https://www.rhythmone.com/about','Not found','https://www.rhythmone.com/privacy-policy','https://www.rhythmone.com/','Our mission is to enrich consumer experiences online by enabling access to content anytime, anywhere. To this end, RhythmOne connects audiences with premium content and advertising across the web.  We work with advertisers, publishers and content providers to provide value through:

Fully integrated advertising solutions, spanning desktop and mobile video, rich media, display, social and native formats.
Cross-screen targeting - following audiences as they migrate across devices.
Massive reach, delivered through our owned and operated channels, and quality distributed partners.
Video content distribution that enhances web experiences for publishers and consumers.
The aim of RhythmOne is to streamline the campaign planning experience, making it a more consolidated and efficient process. By understanding the target audience, the advertising goal, and the spend amount, we can collaborate with brands to optimize the campaign and maximize ROI by using the appropriate formats across the appropriate screens.','http://','3994');
INSERT INTO "companies" VALUES('browser-update','Browser-Update','Browser-Update is a widget that informs website visitors to update their browser if their current one is ''out-of-date''.','Not found','Not found','Not found','http://www.browser-update.org/','"An initiative by web designers to inform users about browser updates."','http://cdn.betteradvertising.com/logos/browserupdate.png','1146');
INSERT INTO "companies" VALUES('marketgid_ru','Marketgid RU','None','Not found','Not found','https://www.mgid.com/privacy-policy','http://www.mgid.com/','','http://marketgid.com/images/img_ru/logo.png','4790');
INSERT INTO "companies" VALUES('elastic_ad','Elastic Ad','None','Not found','Not found','Not found','http://www.elasticad.com','We focus on infrastructure, you focus on advertising. Use our technology and you won’t have to ask publishers to modify their websites to be suitable for native ads. Just white label the ElasticAd platform and you are ready to go!','http://','3803');
INSERT INTO "companies" VALUES('engage:bdr__blink_new_media_','engage:BDR (Blink New Media)','Engage:BDR is a global display advertising network with a proprietary ad serving technology, Blink New Media.  They specialize in Brand-safe and placement-specific inventory that they buy directly through publishers.  ','http://engagebdr.com/about-us/','http://engagebdr.com/contact-us/','http://engagebdr.com/privacy-policy/','http://engagebdr.com/','"Engage:BDR is a top-tier display network. Engage:BDR was formed in 2007 as one of the first companies to offer both premium and placement-specific display marketing solutions and the ability to distribute campaigns through its own display platforms and channels."','http://engagebdr.com/wp-content/uploads/2015/06/logo-2015-ret.png','845');
INSERT INTO "companies" VALUES('underdog_media','Underdog Media','Underdog Media is a network that delivers both direct response and branding initiatives. Underdog''s system features campaign controls, optimization tools, site and channel targeting opportunities, and real-time data.','http://www.underdogmedia.com/about-us/','Not found','http://www.underdogmedia.com/privacy/','http://www.underdogmedia.com','"Since 2007, Underdog Media has stayed true to the vision of powering Internet advertising solutions that increase the consumer base for our advertising partners. Our proprietary Consumer Modeling Approach allows us to define each consumer by gathering statistically relevant first-party data points to create relative proximities of a user’s mindset and intent. We are dedicated to the continued evolution of our Internet Advertising technology."','http://cdn.betteradvertising.com/logos/Underdog_Media_logo.PNG','748');
INSERT INTO "companies" VALUES('exactag','Exactag','None','http://www.exactag.com/about-us/','Not found','http://www.exactag.com/datenschutz/','http://www.exactag.com','"Exactag...offers eCommerce providers and online agencies an approved solution, which enables them to manage, measure and evaluate advertising campaigns according to their success – across all online marketing channels."','http://cdn.betteradvertising.com/logos/exactag-logo.png','2723');
INSERT INTO "companies" VALUES('criteo','Criteo','Criteo is an advertising network that specializes in retargeting.  They provide pay-per-click, personalized, re-targeting solutions to e-tailers, content portals, community sites and advertising platforms. Criteo''s technology enables advertisers to find potential customers who have left a website and re-engage them through dynamic banner ads generated in real-time.  Each ad contains relevant, product specific information determined on a user''s previous visit to an e-commerce site.','http://www.criteo.com/about-us/','http://www.criteo.com/us/contact-us/customer','http://www.criteo.com/privacy/full-privacy-text/','http://www.criteo.com/','"We''ve Created the World’s Most Intelligent Performance Marketing Engine.
Compiling hundreds of billions of dollars of actual sales data and an unmatched network of global publishers, we make sense of digital user behavior—across any device—to deliver relevant, personalized ads that drive incremental sales.
Who We Are
A Transformative Company Committed to Excellence.
Founded by a small group of great minds at a start-up incubator in Paris, Criteo rapidly became the global leader in digital performance advertising in a few short years. Driving this growth: tech superiority and data-rich customer insights, measurable ROI for our clients, and the ingenuity and spirit of our 2,000 employees worldwide.
What We Offer
We Offer True Performance Marketing.
Unlike the vast majority of the market, we use a transparent cost-per-click model and we measure value purely on post-click sales. This demanding model is supported by ongoing, automated learning of each shopper wherever they are in mobile apps or online, along with your campaign’s performance against thousands of variations of dynamically-created ads."
','http://cdn.betteradvertising.com/logos/criteo3.png','51');
INSERT INTO "companies" VALUES('amplitude','Amplitude','None','https://amplitude.com/about','Not found','https://amplitude.com/privacy','https://amplitude.com/','"We work on creating a comprehensive, transparent, and easy-to-use mobile analytics platform to help developers make data-driven decisions and grow their business."','http://cdn.betteradvertising.com/logos/amplitude.png','3070');
INSERT INTO "companies" VALUES('adocean','AdOcean','AdOcean is a Poland based technology company.  Their ad serving system separates the main server, which acts as the management system, from the ad impression servers.  This allows for effective management on a high volume of advertisements by requiring less communication between the server and the web browsers of the users. The data on each ad impression are recorded in a database and used to build statistics for campaigns. AdOcean is a Gemius S.A. company.','http://adocean.cz/en/history.html','Not found','http://adocean.cz/en/privacy.html','http://adocean.cz/en','"AdOcean is a new generation ad server which takes advantage of a technologically advanced platform for delivering advertisements on the Internet. The system is based on a decentralised structure (separation of the data processing & statistics server from the delivery servers) which allows for effective management of a great number of advertisements."','http://cdn.betteradvertising.com/logos/adocean.png','468');
INSERT INTO "companies" VALUES('triplelift','TripleLift','None','','http://triplelift.com/contact','http://www.triplelift.com/privacy-page/','http://www.triplelift.com/','"By tapping into the wealth of data on how consumers engage with and share brands'' visual content, our mission is to fundamentally transform advertising towards that truly resonate with customers."
','http://cdn.betteradvertising.com/logos/triplelift1.png','2609');
INSERT INTO "companies" VALUES('akanoo','Akanoo','None','http://www.akanoo.com/en/about-us','','http://www.akanoo.com/legal','http://www.akanoo.com/','On-site personalisation and real-time targeting solution to increase revenues and prevent cart abandonment.','http://cdn.betteradvertising.com/logos/logo_akanoo.png','3500');
INSERT INTO "companies" VALUES('propeller_ads','Propeller Ads','None','Not found','http://www.propellerads.com/contacts','http://www.propellerads.com/privacy','http://www.propellerads.com/','"Providing access to a large number of ad places on sites of various categories and using our sophisticated technologies you will find the right spot to place your advertisement and achieve the best results by attracting the audience you are looking for."','http://cdn.betteradvertising.com/logos/propellerads.png','2744');
INSERT INTO "companies" VALUES('baidu','Baidu','None','http://ir.baidu.com/phoenix.zhtml?c=188488&p=irol-homeprofile','http://ir.baidu.com/phoenix.zhtml?c=188488&p=irol-contacts','http://ir.baidu.com/phoenix.zhtml?c=188488&p=privacy','http://www.baidu.com/','"Baidu was founded...with the mission of providing the best way for people to find what they’re looking for online. Over the past decade we have strived to fulfill this mission by listening carefully to our users’ needs and wants. To provide intelligent, relevant search results for the tens of billions of queries that are entered into our search platform every day, we focus on powering the best technology optimized for up-to-date local tastes and preferences."','http://cdn.betteradvertising.com/logos/baidu.png','2500');
INSERT INTO "companies" VALUES('adfox','AdFox','AdFox is a Russian contextual advertising company.','http://adfox.ru/about/','https://www.adfox.ru/en/about/contact/','https://www.adfox.ru/en/about/privacy/','http://adfox.ru','"Convenient and powerful management technology online advertising for everyone who works with it: websites and advertisers , advertising agencies, and networks."','http://cdn.betteradvertising.com/logos/adfox.png','669');
INSERT INTO "companies" VALUES('netseer','NetSeer','NetSeer is an ad network focused on contextual media and ad targeting. They offer content scanning technology that identifies concepts within and across websites to help advertisers accurately contextually target ads, and publishers monetize their site content.','http://www.netseer.com/the-humans/','http://www.netseer.com/contact-us/','http://www.netseer.com/privacy-policy/','http://www.netseer.com/','"NetSeer takes a Concept-based approach to ad targeting for advertisers and publishers. Concepts offer an accurate, nuanced picture of your audience’s mindset – which results in algorithms that think more like humans, and less like machines. NetSeer’s patented, seriously brawny ConceptGraph™ reads between the lines to decode the signals of consumer intent, to give you more precise, predictive targeting."','http://cdn.betteradvertising.com/logos/netseer.png','938');
INSERT INTO "companies" VALUES('quisma','Quisma','QUISMA is a German performance based marketing agency, specializing in keyword advertising and search engine marketing (SEM), search engine optimization (SEO) and affiliate marketing and display advertising. As a global full-service agency, they participate in all phases of online marketing activity, from strategic consulting to campaign implementation including cost-efficiency and control.','http://www.quisma.com/en/#about-us','http://www.quisma.com/en/#contact','http://privacy.quisma.com/uk/privacy-policy/quisma-technologies/','http://www.quisma.com/en_GB','"QUISMA is an online performance marketing agency which currently operates across Europe.  The main task of QUISMA is to develop and implement customised solutions for online advertisers...including search engine advertising, affiliate marketing, or display advertising. To implement these advertising measures as efficiently as possible for advertisers and users, cookies are used to place advertising material. Information is stored in the cookies that helps make the advertising displayed more relevant, and to ensure that as far as possible the respective user is only shown advertising which is of interest to them."',' http://www.quisma.com/en/wp-content/uploads/2015/09/quisma_logo_claim_kl_w_web_100_3.png','626');
INSERT INTO "companies" VALUES('metrigo','Metrigo','None','http://metrigo.com/company','Not found','http://metrigo.com/en/privacy-policy/','http://metrigo.com/','"Metrigo provides an innovative platform that can reach the company to display advertising sales and quantitative range goals. We use advanced bidding strategies in media buying. We employ intelligent models to optimize your campaign."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/metrigo.png','2100');
INSERT INTO "companies" VALUES('media_innovation_group','Media Innovation Group','The Media Innovation Group (MIG) develops technology products focused on digital media acquisition, optimization, and measurement. Their key technology includes ZAP (Zeus Advertising Platform), an integration and analytics tool that give advertisers visibility on ad campaign performance.  B3, is the agency tool for media acquisition and optimization of display advertising. Media Innovation Group is a WPP company.','http://www.themig.com/en-us/technology.html','Not found','http://www.themig.com/en-us/privacy.html','http://www.themig.com/en-us/','"The Media Innovation Group (MIG) develops innovative technology products and services that improve the process of acquiring, optimizing, and measuring consumer touch points across digital channels for agency and advertiser clients."','http://cdn.betteradvertising.com/logos/mig.gif','259');
INSERT INTO "companies" VALUES('adsnative','AdsNative','None','http://adsnative.com/about/','Not found','http://adsnative.com/privacy-policy/','http://adsnative.com/','"Maximize Native Revenue, Automatically:  Supply Side Platform for premium publishers to expedite their native ad strategies."','http://cdn.betteradvertising.com/logos/adsnative.png','3277');
INSERT INTO "companies" VALUES('sundaysky','SundaySky','','https://sundaysky.com/company/about-sundaysky/','http://www.sundaysky.com/contact/','  https://sundaysky.com/privacy-policy/','http://www.sundaysky.com/','"SmartVideo delivers a compelling, personalized, real-time video experience designed to reach people with what they need to know in the most engaging, entertaining and informative way possible....Our platform generates hundreds of thousands of SmartVideos daily that attract traffic, retarget prospects, convert prospects to customers, support customers and enhance customer relationships."','','1896');
INSERT INTO "companies" VALUES('effiliation','Effiliation','None','http://www.effiliation.com/en/about-effiliation/','http://www.effiliation.com/en/contact-3/','http://www.effiliation.com/mentions/','http://www.effiliation.com/en/','"EXPERIENCE, CONSULTANCY
Effiliation, the first affiliation consultancy agency in France, has developed its reputation thanks to the creativity and advice it provides to its advertisers and publishers.
RELIABLE, STABLE, MATURE
Effiliation’s reliability, the stability and maturity of its technical platform, its team that is both reactive and available, have led to numerous collaborations with the most prestigious advertisers who have remained loyal to Effiliation.
INDEPENDENCE, SOUND FINANCIAL HEALTH
An independent production consultancy wholly owned by its executives, Effiliation federates skill clusters that allow it to work on all conceptual aspects of client marketing based on performance.
Relying on a network of 10,000 partner sites, it is currently the only agency to offer comprehensive « marketing services » that provide the solution to each advertiser problem:
Creating traffic
Expanding sales
Recruiting prospects
Management chart, follow-up and analysis
Recommendations on recruitment strategies
Producing the mechanism and its media (web creation studio)
Deployment of the mechanism on Effiliation Network
Managing the affiliation relationship (trusted third party, payment, disputes)"
','http://cdn.betteradvertising.com/logos/effiliation.png','2943');
INSERT INTO "companies" VALUES('hotjar','Hotjar','None','','Not found','http://www.hotjar.com/privacy','http://www.hotjar.com/','"Hotjar is a new all-in-one Analysis and Feedback tool that reveals the online behaviour and feedback of a website''s visitors. By combining both A) Analysis and B) Feedback tools, Hotjar gives our clients the ''big picture'' of how to improve their site''s experience and its performance."','http://cdn.betteradvertising.com/logos/hotjar.png','3632');
INSERT INTO "companies" VALUES('xing','XING','None','https://corporate.xing.com/no_cache/english/company/xing-ag/','Not found','http://www.xing.com/privacy','http://www.xing.com/','"XING is the social network for business professionals."

"XING is the social network for business contacts. XING has close to 11 million users in its core German-speaking market (September 2016)."

"XING is a platform where professionals from all kinds of different industries can meet up, find jobs, colleagues, new assignments, cooperation partners, experts and generate business ideas."','http://cdn.betteradvertising.com/logos/xing.png','2787');
INSERT INTO "companies" VALUES('quantcast','Quantcast','Quantcast provides real-time detailed audience profiles for advertisers to buy, sell, connect and learn more about what consumers are doing online.','https://www.quantcast.com/about-us/','https://www.quantcast.com/contact-us/','https://www.quantcast.com/privacy/','http://www.quantcast.com','"Quantcast helps create a more personalized digital world.  We have built one of the world''s most sophisticated data-intelligence platforms, using big data and machine learning to solve the biggest challenges in marketing and create more rewarding experiences across the digital landscape. Publishers use our insights to better understand audiences and how content resonates with consumers they want to attract and retain. Marketers utilize our understanding of online behavior and our predictive advertising capabilities to reach the customers most likely to engage with their messages. Consumers see the results of our work in relevant stories and advertisements that create a personalized experience across all of their devices."
','http://cdn.betteradvertising.com/logos/quantcast_logo.png','139');
INSERT INTO "companies" VALUES('threatmetrix','ThreatMetrix','','http://www.threatmetrix.com/company/company-overview/','https://www.threatmetrix.com/company/contact-us/','http://www.threatmetrix.com/privacy-policy/','http://threatmetrix.com/','"ThreatMetrix™ is a provider of integrated cybercrime prevention solutions. The ThreatMetrix™ Cybercrime Defender Platform helps companies protect customer data and secure transactions against fraud, malware, data breaches, as well as man-in-the browser (MitB) and Trojan attacks."','http://cdn.betteradvertising.com/logos/threatmetrix1.png','1812');
INSERT INTO "companies" VALUES('sophus3','Sophus3','Sophus3 is a provider of tools for website analysis and optimization services.','Not found','http://www.sophus3.com/contact-us','http://www.sophus3.com/services-privacy-policy/','http://www.sophus3.com/','"Our services range from industry benchmarking services to management information solutions to individual projects. Our advanced and objective analysis gives you the insight you need to make strong business decisions."','http://cdn.betteradvertising.com/logos/sophus3.png','1078');
INSERT INTO "companies" VALUES('qualityunit','QualityUnit','None','Not found','Not found','https://www.qualityunit.com/privacy-policy-quality-unit/','http://www.qualityunit.com/','Quality Unit was established in 2004, as a software development company. Our primary effort was on developing web based applications. From start up, we have always had a dual marketing focus. While we concentrate on developing our own best selling products, we also function as a custom design group, creating quality web applications for external clients. We provide total service, from the initial consultation, to project realization, through on-going support and maintenance. We perform and collaborate!','http://cdn.betteradvertising.com/logos/qualityunit1.png','2404');
INSERT INTO "companies" VALUES('united_digital_group__fka_nonstopconsulting_','United Digital Group (FKA nonstopConsulting)','None','http://www.nonstopconsulting.co.uk/company/','https://www.udg.de/en/contact/','https://www.udg.de/en/privacy-policy/','https://www.udg.de/en','The world is digital. As one of the largest agencies in Germany we combine the expertise of three different agency models into one unique service portfolio.','http://cdn.betteradvertising.com/logos/nonstopconsulting.png','2403');
INSERT INTO "companies" VALUES('at_internet','AT Internet','',' http://www.atinternet.com/en/company/',' http://www.atinternet.com/en/contact-us/','http://www.atinternet.com/en/company/data-protection/data-collection-on-at-internets-sites/','http://www.atinternet.com/en/','"AT Internet is an independent and trustworthy company that enables an integral analysis of websites, intranet and mobile sites." ','http://cdn.betteradvertising.com/logos/atinternet1.png','1270');
INSERT INTO "companies" VALUES('polldaddy','Polldaddy','Polldaddy is a market research company that helps clients interact with and learn from their clients. They offer a platform for creating online surveys, polls and quizzes, which they host but is then served via email, mobile, or other online methods.','Not found','Not found','http://polldaddy.com/privacy/','http://polldaddy.com/','"Conduct your staff, user and customer surveys with Polldaddy to get a better handle on how well you''re serving them. Our robust online survey software feeds the data you collect into powerful reporting systems to help you make the most informed decisions you can."','http://cdn.betteradvertising.com/logos/polldaddy.png','935');
INSERT INTO "companies" VALUES('popcash_network','PopCash Network','None','Not found','http://popcash.net/contact.php','http://popcash.net/privacy-policy','http://popcash.net/','"We use a bidding system where you can choose how much you will pay for a visitor and where you have full control over your costs... We don''t have fixed rates, our CPM is fully dynamic and strong related to many factors like your website niche, visitor''s country or your traffic quality..."','http://cdn.betteradvertising.com/logos/popcashnetwork.png','3047');
INSERT INTO "companies" VALUES('disqus','Disqus','Disqus is a comment and discussion management platform that allows publishers to moderate conversations regarding content, across various social media sites. They also provide track backs and analytics reporting.','https://disqus.com/company/','Not found','https://help.disqus.com/customer/portal/articles/466259-privacy-policy','https://disqus.com/','"Advertising
Disqus monetizes our publisher pages through a programmatic native ad marketplace across desktop and mobile. Our marketplace is one of the largest in the world with over 2.5 Billion imps/mo worldwide. Our sales team manages the day to day activities with our advertisers and our publisher partners.
Engineering
The Engineering Team is focused on developing and understanding everything we build. We are engineers and analysts, focused on creating products and systems and keeping Disqus up and running.
Product
The Product Team is all about making stuff that matters and getting it in front of people. We are designers, product managers, and customer success agents collaborating with Engineering to build and support the future of Disqus.
People Ops
The People Operations team builds programs to support the happiness of the entire Disqus team. From staffing to office operations to culture to benefits and everything in between, our focus is making Disqus an awesome place to be. We are on an ambitious quest to push the boundaries of what HR and Operations can achieve."
','http://cdn.betteradvertising.com/logos/disqus2.png','311');
INSERT INTO "companies" VALUES('doublepimp','DoublePimp','DoublePimp is an adult advertising network focused on serving banner ads on adult publisher websites for advertisers.','Not found','http://doublepimp.com/tos/','Not found','http://doublepimp.com/','"Doublepimp creates additional revenue sources for publishers and advertisers looking to squeeze every penny out of their traffic. Our network is 100% high-impact off page ad units such as overlays, popunders, message windows, and toolbars. These units provide the strongest branding and ROI conversion."','http://cdn.betteradvertising.com/logos/doublepimp.png','57');
INSERT INTO "companies" VALUES('pingdom','Pingdom','None','https://www.pingdom.com/about/','https://www.pingdom.com/contact/','https://www.pingdom.com/legal/privacy-policy/','https://www.pingdom.com/','"Real User Monitoring let''s you know exactly how real visitors experience your website. Analyze performance data and how it relate to browsers, platforms and even countries, all in real-time. Improve your customers experience now."
','http://cdn.betteradvertising.com/logos/pingdom1.png','2566');
INSERT INTO "companies" VALUES('trafficjunky','TrafficJunky','',' http://www.trafficjunky.com/about-us','Not found','http://www.trafficjunky.com/privacy-policy',' http://www.trafficjunky.com/','"TrafficJunky is an online advertising network that provides a versatile, intelligent CPM-based advertising platform. Our self-serve, CPM-bidding ad network is designed to help advertisers and publishers alike achieve their most ambitious web marketing goals by serving cost-effective, large volumes of targeted web, mobile and tablet traffic and providing content monetizing solutions."','http://cdn.betteradvertising.com/logos/trafficjunky1.png','1819');
INSERT INTO "companies" VALUES('springserve','SpringServe','None','Not found','http://springserve.com/#contact','http://springserve.com/privacy-policy/','http://springserve.com/','"SpringServe was founded to provide a suite of ad serving tools that make digital advertising more efficient. We have designed our products to operate as openly as possible, and to work within the digital advertising ecosystem in a friction-free manner. Customization is at the heart of effective ad serving, and our tools are engineered to adapt to your business environment. With real-time reporting, white box optimization, a blazing-fast user interface, SpringServe is truly ad serving as it was meant to be."','http://cdn.betteradvertising.com/logos/springserve.png','2581');
INSERT INTO "companies" VALUES('kenshoo','Kenshoo','The Kenshoo Universal Platform delivers automation, business intelligence, integration and scale to make better marketing investments. ','http://kenshoo.com/about/company/','http://www.kenshoo.com/contact-us/','http://kenshoo.com/privacy-policy/','http://www.kenshoo.com/','"Kenshoo is a digital marketing software company that engineers technology solutions for search marketing and online advertising. Kenshoo’s global platform delivers the control, automation and results needed to make better investments across search, social and display campaigns."','http://cdn.betteradvertising.com/logos/kenshoo1.png','1299');
INSERT INTO "companies" VALUES('markmonitor','MarkMonitor','None','https://www.markmonitor.com/company/','https://info.markmonitor.com/request-contact','https://www.markmonitor.com/legal/privacy.php','https://www.markmonitor.com/','"When the world''s leading brands rely on you to protect their revenue and reputation in the digital world, you develop powerful insights and unrivalled methodologies to help combat sophisticated, evolving online threats. MarkMonitor clients look to our unique combination of industry-leading expertise, advanced technologies and extensive industry relationships to preserve marketing investments, revenues and customer trust."','http://cdn.betteradvertising.com/logos/markmonitor.png','2149');
INSERT INTO "companies" VALUES('tns','TNS','TNS Global is a market research firm that focuses on providing market insights. Their research covers all stages of the product life-cycle from development to brand building, including marketing communications. TNS is a Kantar Group company.','http://www.tnsglobal.com/who-we-are','http://www.tnsglobal.com/contact-us','http://www.tnsglobal.com/what-we-do/privacy-policy','http://www.tnsglobal.com/','  As one of the largest research agencies worldwide we provide actionable insights that help you make impactful decisions that drive growth. We are part of Kantar, one of the world''s largest insight, information and consultancy groups.',' http://www.tnsglobal.com/sites/default/files/tns-logo.jpg','411');
INSERT INTO "companies" VALUES('digiteka','Digiteka','None','Not found','http://digiteka.com/presence-de-digiteka-dans-le-monde/','http://digiteka.com/policy/','http://digiteka.com/','','http://digiteka.com/wp-content/uploads/2016/05/Sans-titre-1.png','4705');
INSERT INTO "companies" VALUES('shareaholic','Shareaholic','None','https://www.shareaholic.com/about/','https://www.shareaholic.com/contact/','https://www.shareaholic.com/privacy/','https://www.shareaholic.com/','"Shareaholic...is the leader in making content discovery & sharing on the web a simple, delightful and elegant experience for readers while providing powerful tools to content publishers to measure, analyze and improve the effectiveness of their content to drive even more visibility, traffic, leads and views."','http://cdn.betteradvertising.com/logos/shareaholic2.png','2278');
INSERT INTO "companies" VALUES('adspyglass','AdSpyglass','None','https://www.adspyglass.com/#top','Not found','Not found','https://www.adspyglass.com/','AdSpyglass - Ad networks mediation service for publishers and website owners
If you work with ExoClick, PopCash, Ero-Advertising, JuicyAds and others, you can increase your income up to 100%. AdSpyglass automatically selects the most profitable offers from ad networks and displays ads with the highest CPM on you websites.
AdSpyglass is already being used by over 1900 websites, 4800 ad campaigns
displaying over 156 Million ads daily.','http://','4778');
INSERT INTO "companies" VALUES('etracker_gmbh','etracker GmbH','Etracker provides web analytics solution based on pixel technology. By loading an invisible counter pixel, every page impression provides more precise measurement and analysis of website traffic statistics than log files.','https://www.etracker.com/en/company/overview.html','https://www.etracker.com/en/company/contact.html','https://www.etracker.com/datenschutz/','https://www.etracker.com/en/','"etracker - A Strong Partner at your Side

Like almost no other provider, etracker is known for its best-practice solutions in the field of professional website optimization and online marketing. Thanks to our highly developed technology, numerous innovations, personal support and well-balanced price-performance ratio, we are one of the leading industry in Europe.

The secret to our success is a combination of personal assistance, simple product integration and operation, recommendations for action tailored to customer requirements, and many years of experience. With over 110,000 customers satisfied by the quality and reliability of our products and services, we strive to reach new levels of performance each and every day."','http://cdn.betteradvertising.com/logos/etracker1.png','62');
INSERT INTO "companies" VALUES('recreativ','Recreativ','None','https://recreativ.ru/site/about','http://recreativ.ru/contact','https://recreativ.ru/site/policy','https://recreativ.ru/site/index','"Recreativ - is heading advertising network with an exceptionally high quality traffic, low cost of advertising exposure and potential for high earnings for webmasters!"

Translated by Google Translate','http://cdn.betteradvertising.com/logos/recreativ.png','2212');
INSERT INTO "companies" VALUES('infolinks','Infolinks','Infolinks is an online advertising company that provides in-text advertising services to website owners. Their product scans web pages using a proprietary algorithm and converts selected keywords into relevant Pay Per Click (PPC) in-text ads. These ads appear as double underlined hyperlinks in the Web content itself.
','http://www.infolinks.com/company','http://www.infolinks.com/contact-us','http://www.infolinks.com/privacy-policy/','http://www.infolinks.com/','"We combine advanced internet technologies with advertising strategy and extensive buyer-behavior analysis to bring premium advertising to pre-screened websites and blogs worldwide. Advertisers reach global markets with local precision, via 300 million unique views across 50,000+ premium sites that work exclusively with Infolinks."','http://cdn.betteradvertising.com/logos/infolinks2.png','88');
INSERT INTO "companies" VALUES('tensquare','TenSquare','TENSQUARE develops custom technological solutions for the Internet and other digital media. They work with technology to provide concepts, design, and software development for websites, Intranets, Extranets and CD/DVD.','Not found','Not found','http://www.tensquare.de/cnt/p3p/policy.html?_ga=1.23987706.1560024373.1466454521','http://www.tensquare.com/','TENSQUARE ist ein Fullservice-Dienstleister für die digitalen Medien. Für die Ziele unserer Kunden entwickeln wir erfolgreiche Lösungen und Strategien im Internet, für Desktop und Mobilgeräte. Auf dem gemeinsamen Weg leisten wir Konzeption, Gestaltung, Software-Entwicklung und Service.

TENSQUARE is a full service provider for the digital media. For the goals of our customers, we develop successful solutions and strategies on the Internet, for desktop and mobile devices. On the common way we are making conception, design, software development and service.','http://cdn.betteradvertising.com/logos/tensquare.png','1004');
INSERT INTO "companies" VALUES('sexadnetwork','SexAdNetwork','','Not found','Not found','Not found','http://www.sexadnetwork.com/','','http://cdn.betteradvertising.com/logos/sexadnetwork.png','1820');
INSERT INTO "companies" VALUES('videoplaza','Videoplaza','None','http://www.videoplaza.com/company/','Not found','http://www.ooyala.com/websiteprivacy','http://www.videoplaza.com/','"Videoplaza empowers broadcasters, publishers and ad networks to maximise their advertising revenues from the New IP-delivered TV. Videoplaza’s sell side ad management platform, Karbon, is used to monetise video experiences across PCs, mobile devices, tablets, game consoles, IPTV and Smart TVs."','http://cdn.betteradvertising.com/logos/videoplaza.png','2801');
INSERT INTO "companies" VALUES('gfk_nurago','GfK Group','We are your partner for Digital Brand Leadership, User Experience and media planning Optimisation. With our deep understanding of the digital world in combination with methodical expertise, we can support you in the optimisation of your digital touch points. We do this by combining data about consumer behaviour and attitudes in a truly unique way. This powerful combination of behaviour and attitudes is made possible by our flexible research technology platforms; through which nurago sets market standards and provides extremely efficient and effective research services to our clients. ','http://www.nurago.com/en/company/','Not found','http://www.gfk.com/Pages/Privacy.aspx','http://nurago.com/','"We are your partner for Digital Brand Leadership, User Experience and media planning Optimisation...We do this by combining data about consumer behaviour and attitudes in a truly unique way."','http://cdn.betteradvertising.com/logos/nurago.png','1097');
INSERT INTO "companies" VALUES('iperceptions','iPerceptions','iPerception is analytics company utilizing customer feedback including surveys and website traffic analysis in assisting publishers optimize content as well as serve advertising.','http://www.iperceptions.com/en/company/about','https://www.iperceptions.com/en/support/contact-us','https://www.iperceptions.com/en/privacy-policy','http://www.iperceptions.com/','"At iPerceptions, we help companies create a direct dialog with their customers. By turning millions of customer data points into actionable directives, we improve the customer experience at every level. From the website to customer service to feedback on advertising -- with broad access to near real-time market research, iPerceptions prioritizes issues that matter most to customers."','http://cdn.betteradvertising.com/logos/iperceptions1.png','92');
INSERT INTO "companies" VALUES('liveintent','LiveIntent','LiveIntent provides an email and social marketing solution that enables advertisers to serve dynamic ads through traditionally non-dynamic channels such as email and newsletters. LiveIntent serves dynamic and personalized ads to viewers based on data gathered about the user in real time.','https://liveintent.com/about/our-philosophy/','https://liveintent.com/contact-us/','http://www.liveintent.com/services-privacy-policy/','http://www.liveintent.com/','"LiveIntent is an Email Advertising and Trading Desk company with the first technology for email and display designed to support brand and direct response advertisers and agencies."','http://cdn.betteradvertising.com/logos/liveintent.png','674');
INSERT INTO "companies" VALUES('weborama','Weborama','Weborama is a French analytics and behavioral targeting company. Their solutions enable advertisers, agencies and publishers to optimize online marketing investments. The adPerf suite is used to track, manage and optimize web-based ad performance while the Lab is their marketing intelligence and research center.  ','','Not found','http://www.weborama.com/e-privacy/our-commitment/','http://weborama.com','"Weborama is one of the pioneers of online marketing technologies in Europe. Weborama''s Ad Analytics suite & Behavioral Targeting services are used by leading advertisers, agencies and publishers to optimize their online marketing investments."','http://cdn.betteradvertising.com/logos/Pastille_RED_2015_HD.png','633');
INSERT INTO "companies" VALUES('pixalate','Pixalate','None','http://www.pixalate.com/about/','Not found','http://www.pixalate.com/privacypolicy/','http://www.pixalate.com/','Pixalate is the first and only data platform with a comprehensive suite of products specifically built to bring transparency to programmatic advertising. Pixalate monitors hundreds of billions of ad events in real time by tapping into the global RTB data stream, providing insights to optimize performance, benchmark supply quality, and eliminate fraud.

Together, we’re raising the bar for RTB.','http://cdn.betteradvertising.com/logos/pixalate_logo1.png','4097');
INSERT INTO "companies" VALUES('bidswitch','Bidswitch','None','http://www.bidswitch.com/vision/','http://www.bidswitch.com/contact-us/','http://www.bidswitch.com/privacy-policy/','http://www.bidswitch.com/','BidSwitch provides immediate and seamless real-time access for Supply and Demand Partners across all media types (display, mobile, video, native, etc.).Like a network switch, BidSwitch allows platforms to quickly enable new buyers/sellers, enter new geographical regions, and turn on new media types—all through a single integration.','http://www.bidswitch.com/wp-content/uploads/2015/02/BidSwitch_logo2.jpg','4672');
INSERT INTO "companies" VALUES('chatango','Chatango','None','http://www.chatango.com/help?help_about#chatango','Not found','http://www.chatango.com/page?full_privacy','http://www.chatango.com/','"Add free live chat to any web page."','http://cdn.betteradvertising.com/logos/chatango.png','2700');
INSERT INTO "companies" VALUES('twitter','Twitter','Twitter is a service used to communicate and stay connected through the exchange of quick, frequent online and mobile messages. People write short updates, often called "Tweets" of 140 characters or fewer. These messages are dynamically posted to a Twitter profile or a blog and sent to your followers ','https://about.twitter.com/company','Not found','https://twitter.com/privacy?lang=en','https://twitter.com/','"Our mission: To give everyone the power to create and share ideas and information instantly, without barriers."
','http://cdn.betteradvertising.com/logos/twitter1.png','174');
INSERT INTO "companies" VALUES('decibel_insight','Decibel Insight','None','https://www.decibelinsight.com/Product/','Not found','https://www.decibelinsight.com/PrivacyPolicy/','https://www.decibelinsight.com/','"Decibel Insight records every action visitors take on your web or mobile site. See what content they interact with, optimize the experience and turn more visitors into customers."','http://cdn.betteradvertising.com/logos/decibelinsight.png','3679');
INSERT INTO "companies" VALUES('lotame','Lotame','Lotame is a data-driven technology platform.  Publishers, agencies, and brands leverage Lotame''s Crowd Control technology to build customized audiences built on first and third-party data. ','http://www.lotame.com/about','https://www.lotame.com/contact/','https://www.lotame.com/legal/','http://www.lotame.com','Lotame is a data management platform (DMP) that lets marketers, agencies and publishers harness audience data to make smarter marketing, product and business decisions. Through our platform, clients can learn more about their most valuable customers, find prospects that look and act exactly like them, and then execute ad campaigns and content strategies that target them across any digital device.','http://cdn.betteradvertising.com/logos/lotame1.png','103');
INSERT INTO "companies" VALUES('epoq','epoq','None','http://www.epoq.de/unternehmen/ueber-uns/','http://www.epoq.de/unternehmen/kontakt/','https://www.epoq.de/en/how-to/data-protection/?','http://www.epoq.de/','"The epoq internet services GmbH specializes in the development of innovative technologies for online stores."','http://cdn.betteradvertising.com/logos/epoq.png','2898');
INSERT INTO "companies" VALUES('feedbackify','Feedbackify','','Not found','Not found','http://www.feedbackify.com/privacy.php','http://www.feedbackify.com/','"Protect your brand by being the first to know about problems with your website. Gather ideas and suggestions from your most valuable asset, your visitors. Measure and improve visitor satisfaction by continuously listening."','http://cdn.betteradvertising.com/logos/feedbackify.png','1867');
INSERT INTO "companies" VALUES('linkpulse','Linkpulse','None','Not found','Not found','http://www.linkpulse.com/privacy','http://www.linkpulse.com/','"Linkpulse is an analytics tool tailor made for high traffic news sites. Optimize and prioritize your front page backed by live data."','http://cdn.betteradvertising.com/logos/linkpulse.png','2368');
INSERT INTO "companies" VALUES('skimlinks','SkimLinks','SkimLinks is a London based affiliate marketing platform. Their tools and products provide Web site owners the ability to monetize their site through placement of affiliate links. The SkimLinks JavaScript code is placed on their site, which then scans the website''s content and converts product references to links to those products from marketers.','http://skimlinks.com/company','http://skimlinks.com/find-us/london','http://skimlinks.com/privacy-policy','http://www.skimlinks.com/','"Skimlinks creates native monetization solutions for publishers, rewarding them for any e-commerce they drive by automatically turning product links and references into trackable affiliate links. Integrated with more than 20,000 merchants, Skimlinks processes 300 million clicks a month on over 1.5 million sites around the web. Our technology helps publishers like Time Inc, Gawker Media, Condé Nast, Hearst and The Huffington Post earn revenue and gain insights from their commerce-related content." ','http://cdn.betteradvertising.com/logos/skimlinks.png','587');
INSERT INTO "companies" VALUES('dotomi','Dotomi','Dotomi offers Internet advertising and media management services to advertisers. They provide media marketing, re-marketing, data management, campaign management, creative design, performance analysis services, media buying, technical integration and online reporting services. Their technology platform EXACCT, is a real-time profiling tool that creates a predictive picture of each consumer. These profiles feed all decision making across the platform enabling marketers to target more relevant advertisements to their audience.','Not found','http://www.conversantmedia.com/contact-us','http://www.conversantmedia.com/legal/privacy','http://www.conversantmedia.com/','"Conversant, Inc. (Nasdaq: CNVR) is the leader in personalized digital marketing. Combining the strengths of Dotomi, ValueClick Media, Commission Junction, Greystripe and Mediaplex, Conversant helps the world’s biggest brands grow by creating personalized experiences that deliver higher returns for marketers and greater satisfaction for consumers. We offer a fully integrated personalization platform solution, personalized media programs and industry leading affiliate marketing. All fueled by a deep understanding of what motivates people to engage, connect and buy."','http://cdn.betteradvertising.com/logos/conversant.png','56');
INSERT INTO "companies" VALUES('perform_group','PERFORM Group','None',' http://www.performgroup.com/about/','http://www.performgroup.com/contact/',' http://www.performgroup.com/privacy-policy/','http://www.performgroup.com/','"PERFORM commercialises multimedia sports content across internet-enabled digital platforms, driving revenues through a mix of Content Distribution, Advertising & Sponsorship, the development and management of Subscription Platforms and Technology & Production."','http://cdn.betteradvertising.com/logos/performgroup.png','2167');
INSERT INTO "companies" VALUES('marketo','Marketo','Marketo provides on-demand marketing software for B2B professionals looking to optimize their sales and marketing efforts. It offers marketing through standard channels like e-mail, lead generation, and optimization of site visits. They also provide analytics tools for results tracking.','http://www.marketo.com/company','https://www.marketo.com/company/contact/',' http://legal.marketo.com/privacy/','http://www.marketo.com/','"Marketo Lead Management gives Marketers the power and flexibility to automate demand generation campaigns and deliver high quality leads with less effort. Marketo Sales Insight helps Sales understand, prioritize and interact with the hottest leads and opportunities to close more business faster. Marketo Revenue Cycle Analytics enables marketers to measure, optimize, and forecast the revenue cycle."','http://cdn.betteradvertising.com/logos/marketo.png','108');
INSERT INTO "companies" VALUES('snap_engage','Snap Engage','None','http://','Not found','https://snapengage.com/privacy-policy','https://snapengage.com','','http://','3941');
INSERT INTO "companies" VALUES('content.ad','Content.ad','None','https://www.content.ad/our-story','https://www.content.ad/contact','https://www.content.ad/privacy-policy/','https://www.content.ad/','"Content.ad analyzes your pages on an ongoing basis and displays links to the content on your site that your readers will find most interesting. Our algorithm creates a complete "engagement" profile of each piece of content based on popularity, social sharing, comments and other metrics, and then promotes your best content so as to maximize page views, time-on-site, and revenue."','http://cdn.betteradvertising.com/logos/contentad.png','2086');
INSERT INTO "companies" VALUES('whatsbroadcast','WhatsBroadcast','None','Not found','https://www.whatsbroadcast.com/contact/','https://www.whatsbroadcast.com/privacy/','https://www.whatsbroadcast.com/','','http://www.psvberlin-fechten.de/images/foerderer/logo_whatsbroadcast.png','4750');
INSERT INTO "companies" VALUES('xplosion_interactive','xplosion interactive','"The intelligent retargeting mix developed by xplosion interactive under the name of xretarget unites brand-strategic applicability with user-sensitivity."',' https://www.xplosion.de/#company','Not found',' https://www.xplosion.de/datenschutz.php','http://www.xplosion.de/en/home.html?no_cache=1','"The intelligent retargeting mix developed by xplosion interactive under the name of xretarget unites brand-strategic applicability with user-sensitivity."','http://cdn.betteradvertising.com/logos/xplosion.png','1356');
INSERT INTO "companies" VALUES('zopim','Zopim','Zopim is a provider of support and live chat software. Their flagship product, Zopim Live Chat, uses in-browser pop-ups to interact with users when they visit clients'' websites and allows them to provide sales support.','Not found','Not found','https://www.zendesk.com/company/privacy/','http://www.zopim.com/','"Our flagship product - Zopim Live Chat - makes selling online easy and effective for small medium businesses. With Zopim, they can monitor and chat directly with website visitors who have problems making purchases on the site."','https://d1eipm3vz40hy0.cloudfront.net/sites/zopim/images/p-header/logo-white.png','979');
INSERT INTO "companies" VALUES('marketgid_usa','MarketGid USA','MarketGid USA is a lead generation and website traffic generation service provider. Its offerings include an online catalog, a news aggregator widget, a targeted advertising platform and a traffic exchange system.
','http://mgid.com/about/','http://mgid.com/advertisers','http://mgid.com/privacy-policy','http://www.mgid.com/','"MGID is a news and product portal which connects thousands of websites around the web."','http://cdn.betteradvertising.com/logos/mgid.png','577');
INSERT INTO "companies" VALUES('errorception','Errorception','','Not found','Not found','http://errorception.com/privacy','http://errorception.com/','"Errorception is a simple and painless way to find out about JavaScript errors, as they occur in your users'' browsers."','http://cdn.betteradvertising.com/logos/errorception1.png','1549');
INSERT INTO "companies" VALUES('ab_tasty','AB Tasty','None','https://www.abtasty.com/us/about-us/','https://en.abtasty.com/contact','https://www.abtasty.com/uk/terms-of-use/','https://www.abtasty.com/us/','Our mission
To provide the most simple, intuitive and effective solutions, so that you can bring your own optimisation ideas to life and measure their impact, before mobilising technical resources for their final implementation.

To offer cross-device, open testing and personalisation solutions to provide your users with a seamless browsing experience, whatever kind of screen they are using, for effortless integration of third party solutions (e.g. web analytics solutions, tag management systems, data management platforms, etc.)

To offer local support so that you get the most from our solution throughout our collaboration, by providing you with testing ideas, by planning your roadmap, by ensuring its compliance and assisting you technically, if needed','Not found','3037');
INSERT INTO "companies" VALUES('digidip','Digidip','None','Not found','Not found','Not found','http://www.digidip.net/','Monetizing the largest premium content websites
The most detailled analytics for international performance marketing.','http://','4891');
INSERT INTO "companies" VALUES('uservoice','UserVoice','UserVoice is web focus group software that assists advertisers with customer interaction in a forum setting to help improve their services. UserVoice is a social media integrated feedback platform providing analysis of brand recognition to advertisers.','https://www.uservoice.com/about/','Not found','https://www.uservoice.com/privacy/','https://www.uservoice.com','"UserVoice helps companies listen to their customers to build better products and improve customer satisfaction. We’ve built a platform that helps companies, from startups to Fortune 500’s, collect feedback from thousands, and sometimes millions, of customers."','http://cdn.betteradvertising.com/logos/uservoice.png','177');
INSERT INTO "companies" VALUES('bugsnag','Bugsnag','None','https://bugsnag.com/about','Not found','http://docs.bugsnag.com/legal/privacy-policy/','https://bugsnag.com/','"Headquartered in San Francisco, Bugsnag provides software development teams with an automated crash detection platform for their web and mobile applications."','http://cdn.betteradvertising.com/logos/bugsnag.png','3347');
INSERT INTO "companies" VALUES('sumome','SumoMe','None','http://sumome.com/about','Not found','https://help.sumome.com/customer/en/portal/articles/1963436-privacy-policy','http://sumome.com/','"We''ve spent over 4 years building these tools internally to grow our AppSumo Newsletter. They helped us grow to over a million subscribers.

We''ve noticed many struggle to do the same or don''t collect emails at all because the tools aren''t available or are too expensive. So we thought why not make them available so you can do the same?

That''s our goal, plain and simple, to help you grow your website traffic."','https://load.sumome.com/images/sumome-site-logo.png','3560');
INSERT INTO "companies" VALUES('mixpanel','Mixpanel','Mixpanel is an analytics solutions provider. It''s API-based analytics tools allow input from data sources across the Internet: Facebook applications, iPhone/Android applications, and standalone destination websites.  Their real time reporting helps companies understand how users interact with Web applications.','http://mixpanel.com/about/','http://mixpanel.com/feedback/type/5/','http://mixpanel.com/privacy/','http://mixpanel.com/','Mixpanel''s mission is to help the world learn from their data. We offer the most sophisticated analytics platform companies online can use to understand how users behave. We do all of our data analysis in real-time.','http://cdn.betteradvertising.com/logos/mixpanel1.png','227');
INSERT INTO "companies" VALUES('adnet.de','adNET.de','None','Not found','Not found','http://www.adnet.de/index-6_datenschutz.html','http://www.adnet.de','','http://cdn.betteradvertising.com/logos/adnetde.png','2407');
INSERT INTO "companies" VALUES('conviva','Conviva','Convivia is an Internet video content solution that distributes and manages delivery for video websites and aggregators. Their Software as a Service (SaaS) platform integrates multiple media sources like content delivery networks and data providers and powers real-time analytics and performance monitoring on each video and media delivery.','http://www.conviva.com/about-us/',' http://www.conviva.com/contact-conviva/',' http://www.conviva.com/home/privacy-policy/','http://www.conviva.com/','"Conviva helps media companies and carriers increase revenue and improve their relationship with viewers by boosting minutes watched and providing real-time, per-user performance information that results in more profitable video businesses."','http://cdn.betteradvertising.com/logos/conviva.png','819');
INSERT INTO "companies" VALUES('heatmap','Heatmap','None','Not found','https://heatmap.me/contact-us','https://heatmap.me/privacy','https://heatmap.me/','"Most online contents are short-lived and only real-time analytics allow you to act right on time."','http://cdn.betteradvertising.com/logos/heatmap.png','3511');
INSERT INTO "companies" VALUES('net-metrix','NET-Metrix','None','http://www.net-metrix.ch/ueber-uns','Not found','http://www.net-metrix.ch/ueber-uns/datenschutz','http://www.net-metrix.ch/','"The NET-Metrix AG is an independent Swiss authority for Internet usage research. We offer the most comprehensive research system to use web offerings in Switzerland and Liechtenstein. NET-Metrix provides the market with standardized and certified data."','http://cdn.betteradvertising.com/logos/netmetrix.png','2625');
INSERT INTO "companies" VALUES('research_now','Research Now','None','http://www.researchnow.com/en-US/AboutUs.aspx','http://www.researchnow.com/en-US/ContactUs/Dallas.aspx','http://www.researchnow.com/en-US/Help/PrivacyPolicy.aspx','http://www.researchnow.com/','"We are the world’s leading digital data collection company, and uniquely positioned as a true single source solution for any and all research projects."','http://cdn.betteradvertising.com/logos/researchnow1.png','2770');
INSERT INTO "companies" VALUES('unruly','Unruly','','http://unruly.co/about-us/#intro','https://unruly.co/contact-us/','http://unruly.co/privacy/','http://unruly.co/','"Video ad tech company Unruly is the leading programmatic platform for social video advertising, powered by UnrulyX, the first supply side platform (SSP) for mobile video to offer scaled delivery of native ad formats and guarantee the viewability of premium video impressions bought via RTB."','http://cdn.betteradvertising.com/logos/unruly.png','1904');
INSERT INTO "companies" VALUES('mediametrie','Mediametrie','Mediametrie is a media research company. It offers marketing test services for measuring the effectiveness of advertising and promotions on sales and attitudes. They measure audiences and conduct media research for companies within the media and communications market. ','http://www.mediametrie.com/mediametrie/index.php','http://www.mediametrie.com/mediametrie/contact.php','http://www.mediametrie.com/pages/privacy-policy.php?page=86','http://www.mediametrie.com/','"Médiamétrie is now the benchmark when it comes to audience measurement. The company is developing its range of services and extending its scope by working on new media, telephony, new multimedia practices, Cross-media, etc." ','http://cdn.betteradvertising.com/logos/mediametrie1.png','379');
INSERT INTO "companies" VALUES('getintent','GetIntent','None','http://getintent.com/en/about/','Not found','Not found','http://www.getintent.com/','"GetIntent is a Russian pioneering DSP (Demand Side Platform) targeted mostly to eCommerce web-sites. Our unique machine-learning algorithms open new horizons to audience and programmatic buying. We know intentions of your customers."','http://cdn.betteradvertising.com/logos/getintent.png','3163');
INSERT INTO "companies" VALUES('paypal','PayPal','None','https://www.paypal-media.com/about','Not found','https://www.paypal.com/us/webapps/mpp/ua/privacy-full','https://www.paypal.com','"PayPal is the faster, safer way to pay and get paid online, via a mobile device and in store. The service gives people simpler ways to send money without sharing financial information, and with the flexibility to pay using their account balances, bank accounts, credit cards or promotional financing."','http://cdn.betteradvertising.com/logos/paypal.png','2595');
INSERT INTO "companies" VALUES('adxpansion','AdXpansion','AdXpansion is a contextual advertising network for the adult community. Their proprietary content matching platform allows advertisers of all sizes to compete for high volume targeted traffic. Publishers can benefit from AdXpansion''s competition based bidding system.
','http://www.adxpansion.com/','http://www.adxpansion.com/en/index/contact','http://www.adxpansion.com/en/index/privacy','http://www.adxpansion.com/','"AdXpansion is the first Targeted Advertising Network for the Adult industry. Using our proprietary content matching platform, advertisers large and small can compete for high volume targeted traffic." ','http://cdn.betteradvertising.com/logos/adxpansion.png','755');
INSERT INTO "companies" VALUES('emetriq','emetriq','None','https://www.emetriq.com/unternehmen/ueber-uns/','Not found','https://www.emetriq.com/datenschutz/','http://www.emetriq.com','Wir haben es uns als einziger Anbieter zur Aufgabe gemacht, starke Partner der Digital Advertising Branche zusammen zu bringen, um über eine strategische Kooperation, der Intelligent Data Alliance (IDA), gemeinsam den größten deutschen Datenpool zu etablieren, der sich in Qualität, Nutzen und im Hinblick auf deutsche Datenschutzvorgaben deutlich vom Wettbewerb abhebt.
Unsere Mitarbeiter sind langjährige Profis der digitalen Branche, die ihr gebündeltes Wissen rund um intelligentes Datenmanagement mit großer Leidenschaft einbringen, um Ihnen und Ihren Kunden mit qualitativ hochwertigen Daten auf Basis einer maximalen Datenmenge zu einer präzisen Zielgruppenansprache für Ihre Kampagnenausspielung zu verhelfen.','http://cdn.betteradvertising.com/logos/Logo-Emetriq-Anker-Magenta-Web_small.png','3970');
INSERT INTO "companies" VALUES('smartlook','SmartLook','None','Not found','Not found','https://www.smartlook.com/privacy','https://www.smartlook.com/','Smartlook is a simple tool which records the screens of real users on your website. You can see what visitors clicked with their mouse, what they filled into a form field, where they spend most of their time, and how they browse through each page.','https://www.smartlook.com/assets/images/logo.png?v=2','4505');
INSERT INTO "companies" VALUES('webtrekk','Webtrekk','The name says it all: For seven years, the company supports its customers to make Web sites and online stores successfully and to manage effectively. Webtrekk will track "the user data from website visitors, which can be derived a number of success factors and optimization options for an effective web presence.
* automatic translation','https://www.webtrekk.com/en/about/','https://www.webtrekk.com/en/about/contact/','https://www.webtrekk.com/en/legal/opt-out-webtrekk/','https://www.webtrekk.com/en/home/','"Webtrekk

The Digital Intelligence Suite has six fully integrated analytics and marketing solutions. Know your visitors  cross-channel and cross-device. Individualise your marketing. Adapt your strategy. Test your changes. And drive your profit."
','Not found','335');
INSERT INTO "companies" VALUES('yieldify','Yieldify','None','http://www.yieldify.com/about','http://www.yieldify.com/contact','http://www.yieldify.com/privacy-policy','http://www.yieldify.com/','"Yieldify is a simple to use software solution which allows you to maximise your opt-in rates and revenue from visitors leaving your website. Once you have decided the type of campaign you want to run, Yieldify uses its algorithm learning engine to optimise the Overlay (an interactive message) displayed to the user. The Yieldify Algorithm Learning Engine (Y.A.L.E.) precisely tracks the visitor''s mouse movements, speed and user behaviour to determine the style and timing of the overlay."','http://cdn.betteradvertising.com/logos/yieldify1.png','2874');
INSERT INTO "companies" VALUES('vg_wort','VG Wort','VG Wort is a German online database.','http://www.vgwort.de/die-vg-wort.html','http://www.vgwort.de/kontakt.html','http://www.vgwort.de/datenschutz.html','http://www.vgwort.de/startseite.html','"The purpose of the non-profit association is entrusted [with] contract rights and compensation claims of its members and persons [who are] entitled to exercise. This means, among other things, an equitable remuneration of authors and publishers and make sure to [collect] money from those who use the intellectual property of others. The monies collected from various sources are then directed to set distribution plans to authors and publishers." ','http://cdn.betteradvertising.com/logos/vgwort.png','1075');
INSERT INTO "companies" VALUES('trackjs','TrackJS','None','http://www.trackjs.com/about','Not found','https://trackjs.com/privacy/','http://www.trackjs.com/','"Building a Better Web
We built TrackJS for developers like us. We are front-end developers who constantly push to build better applications for the web. The web is amazing and powerful, but only when it works great for users. Too many web applications break on unexpected browsers or poor networks connections. TrackJS is for you. Find your bugs. Get the context to fix them fast. Build a better web."','Not found','3549');
INSERT INTO "companies" VALUES('sessioncam','SessionCam','None','http://www.sessioncam.com/about-us/','Not found','http://www.sessioncam.com/privacy-policy-cookies/','http://www.sessioncam.com/','"SessionCam is an industry leader in Visible Web Analytics, Session Replay and Heatmap technology. Our many clients have been using SessionCam to gain previously unseen and unrivalled insights into their customers’ on-line behaviour."','http://cdn.betteradvertising.com/logos/sessioncam.png','2365');
INSERT INTO "companies" VALUES('sizmek','Sizmek','MediaMind is a global provider of digital advertising solutions that optimize online media for enhanced performance. Its platform integrates display advertising, search, rich media, video, dynamic ads, mobile and emerging media. This provides marketers with a cross-channel view of ad campaigns. MediaMind is formerly known as Eyeblaster.','http://www.sizmek.com/about/',' http://go.sizmek.com/contact','http://www.sizmek.com/privacy-policy/','http://www.sizmek.com','"Sizmek (NASDAQ: SZMK) fuels digital advertising campaigns for advertisers and agencies around the world with the most cutting-edge technology to engage audiences across any screen. ...Sizmek has proudly pioneered industry firsts in digital, including rich media, video and online targeted advertising across channels. Sizmek''s open ad management stack delivers the most creative and impactful multiscreen digital campaigns, across mobile, display, rich media, video and social, all powered by an unrivaled data engine."','http://cdn.betteradvertising.com/logos/sizmek.png','384');
INSERT INTO "companies" VALUES('orange_mobile','Orange Mobile','','http://www1.orange.co.uk/about/','Not found','http://web.orange.co.uk/documents/ice/privacy/orange_privacy_and_cookie_policy_for_mobile_20101206.pdf','http://www.orange.co.uk/  http://ee.co.uk/our-company/about-us','"Orange is one of the main European operators for mobile and broadband internet services and, under the brand Orange Business Services, is one of the world leaders in providing telecommunication services to multinational companies."
','http://cdn.betteradvertising.com/logos/orange.png','1203');
INSERT INTO "companies" VALUES('grand_slam_media','Grand Slam Media','None','http://grandslammedia.com/#about','http://grandslammedia.com/#contact','Not found','http://www.grandslammedia.com/','"Global web communications agency focused on delivering the best results for buyers and sellers."','http://cdn.betteradvertising.com/logos/grandslammedia.png','2552');
INSERT INTO "companies" VALUES('tealium','Tealium','Tealium is a provider of tag management technology. The Tealium Universal Tag is a simplified tag that can work with various combinations of web analytics and digital marketing solution providers. Their translation engine lets non-technical, web analytics practitioners map the collected data into vendor-specific values, and send the data to any number of web analytics tools. ','http://tealium.com/company/','http://tealium.com/contact/','http://tealium.com/privacy/','http://tealium.com/','"Tealium powers the new era of real-time customer engagement and marketing, enabling global businesses to unlock their customer data and create more meaningful, relevant customer experiences.
The company’s industry-leading customer data platform, comprised of an enterprise tag management solution, omnichannel customer segmentation and action engine, and suite of rich data services, creates a vendor-neutral data foundation that spans web, mobile, offline and IoT.
More than 600 organizations worldwide trust Tealium to eliminate data silos and build a unified, actionable customer profile."
','','662');
INSERT INTO "companies" VALUES('delta_projects','Delta Projects','','  http://www.deltaprojects.com/about-us/','http://www.deltaprojects.com/contact/','http://www.deltaprojects.com/privacy-policy/',' http://www.deltaprojects.com/','"Delta Projects’ business idea is to offer solutions for efficient online marketing. The internet as a sales and marketing channel has a vastly unexploited potential. Our mission is to support people and companies utilizing the full potential of internet in an optimal and creative way."','http://cdn.betteradvertising.com/logos/deltaprojects_primary_rgb.png','1955');
INSERT INTO "companies" VALUES('tawk','Tawk','None','http://','Not found','https://www.tawk.to/privacy-policy/','https://www.tawk.to/','"You never have to pay for live chat software again

Tired of paying a monthly subscription ''per agent''? Well you can officially cancel
your current subscription, as tawk.to is completely free & it always will be.

The best products are free

The web''s biggest companies, and arguably the best products, are almost always free.
From Facebook to Google, Twitter and Instagram - free does not mean cheap.

tawk.to is jam packed with all the features you need to provide winning customer support - it is lightning fast, reliable and scalable. If you already use live chat on your site, there really is no reason to keep paying per agent!

Every day we listen to user feedback, to learn more about the features we should be focussing on. Feel free to chat with us at any time to discuss your specific live chat needs."','http://cdn.betteradvertising.com/logos/tawk.png','4210');
INSERT INTO "companies" VALUES('visualiq','VisualIQ','Founded in 2006, Visual IQ is the world’s leading cross channel marketing intelligence software company. Our IQ Intelligence Suite™ of hosted software products reveals cross channel performance insights hidden within your marketing data, providing both executive level and practitioner level recommendations to improve your marketing performance. Visual IQ is listed as a “leader” in The Forrester Wave™: Interactive Attribution, Q4 2009.','http://www.visualiq.com/about','http://www.visualiq.com/contact-us/form','http://visualiq.com/privacy','http://visualiq.com/','"Visual IQ is the world’s leading cross channel marketing intelligence software company. Our IQ Intelligence Suite™ of hosted software products reveals cross channel performance insights hidden within your marketing data, providing both executive level and practitioner level recommendations to improve your marketing performance."','http://cdn.betteradvertising.com/logos/visualiq.png','1095');
INSERT INTO "companies" VALUES('answers.com','Answers.com','None','http://wiki.answers.com/page/about_us','Not found','http://wiki.answers.com/about/legal_notices.html#privacy','http://www.answers.com/','"Answers Corporation is the world’s leading Q&A resource, delivering trusted answers to all of your questions through web, mobile, and social channels. We harness the knowledge from our vast community of online experts, syndicated sites, and social media platforms to connect you with the most timely and relevant information."','http://cdn.betteradvertising.com/logos/answerscom1.png','2110');
INSERT INTO "companies" VALUES('refined_labs','Refined Labs','None','http://www.refinedlabs.com/en/about-refined-labs','http://www.refinedlabs.com/en/contact',' https://www.refinedlabs.com/datenschutz-website','  https://www.refinedlabs.com/','"Refined Labs is a leading provider of performance marketing software."','http://cdn.betteradvertising.com/logos/refinedlabs1.png','2062');
INSERT INTO "companies" VALUES('cedexis','Cedexis','Cedexis provides a collective intelligence platform for next-generation web traffic management strategies. Cedexis Radar provides IT organizations with the collective intelligence necessary to evaluate and compare a wide range of infrastructure options, from traditional data centers and delivery networks to emerging cloud storage and cloud computing platforms.','http://www.cedexis.com/about/','http://www.cedexis.com/contact/','http://www.cedexis.com/privacy-policy/  ','http://www.cedexis.com/','"Founded in 2009, Cedexis optimizes web performance across data centers, content delivery networks (CDNs) and clouds, for companies that want to ensure 100% availability and extend their reach to new global markets."','http://cdn.betteradvertising.com/logos/cedexis.png','691');
INSERT INTO "companies" VALUES('hurra_communications','Hurra Communications','Hurra Communications is a Germany based company that provides search engine marketing solutions. They offer search engine campaign design and optimization services. Hurra also provides production promotional tools and design and produce direct response and Web television advertising campaigns.
','http://www.hurra.com/EN/about','http://www.hurra.com/EN/contact','http://www.hurra.com/EN/privacy-policy','http://www.hurra.com/en/','"Founded in 1998, we have since grown into one of Europe''s leading search marketing agencies. In addition to our agency services, we are also a provider of integrated online marketing technologies."','http://cdn.betteradvertising.com/logos/hurra1.png','843');
INSERT INTO "companies" VALUES('impact_radius','Impact Radius','None','http://www.impactradius.com/about-us/','http://www.impactradius.com/contact-us','http://www.impactradius.com/privacy','https://www.impactradius.com/','"Transforming digital marketing technology.
Impact Radius is transforming how advertisers manage media and performance marketing partnerships. On a single platform our clients can track all media channels, automate tag management, onboard and pay direct partners, while viewing and optimizing all conversion paths.
The company was founded in 2008 by a team of Internet marketing and technology experts who previously founded Commission Junction, Savings.com and LeadPoint. We’re headquartered in Santa Barbara, California with offices in New York, London and Cape Town."
','http://cdn.betteradvertising.com/logos/impact-radius-logo.png','2230');
INSERT INTO "companies" VALUES('onthe.io','onthe.io','None','Not found','Not found','https://onthe.io/pp','https://t.onthe.io/media','','http://','4494');
INSERT INTO "companies" VALUES('affimax','AffiMax','None','Not found','Not found','https://www.affimax.de/l/3-Datenschutz.html','https://www.affimax.de','','http://cdn.betteradvertising.com/logos/affimax.png','2090');
INSERT INTO "companies" VALUES('statcounter','StatCounter','Statcounter is web tracking and hit counter software.','http://statcounter.com/about/','http://statcounter.com/about/contact/','http://statcounter.com/about/legal/#privacy','http://statcounter.com/','"A free yet reliable invisible web tracker, highly configurable hit counter and real-time detailed web stats."','http://cdn.betteradvertising.com/logos/statcounter1.png','162');
INSERT INTO "companies" VALUES('gumgum','GumGum','GumGum is an ad network that tracks, reports and monetizes licensing content for Internet use. They provide ad serving within images on publisher websites, where images have a width and height both greater than 150 pixels.','http://gumgum.com/about','http://www.gumgum.com/about/contact/','http://www.gumgum.com/privacy-policy/','http://gumgum.com','As the inventor of in-image advertising, GumGum is the digital marketing platform for the visual web. Our technology unlocks the value of connected images, and delivers highly visible campaigns and rich insights to marketers. Reaching over 400 million visitors as they view images and content across more than 2,000 premium publishers, GumGum ads consistently achieve an 81% viewability rate and deliver 10 times better engagement than traditional display options, resulting in superior brand lift for marketers and increased revenue for publishers. Powered by its core image recognition technology, GumGum also offers Mantii, a real-time image recognition tool for brands to identify and activate their most important images and engage their top influencers on social media.

With GumGum, leading brands from AdAge’s top 100 US advertising spenders list, including Disney, L’Oreal and Toyota, can target audiences with contextually relevant content through in-image and in-screen ads, native, video and programmatic options. GumGum is headquartered in Santa Monica, California, with six additional offices in the US and in the UK. Founded in 2007, GumGum is backed by investors including Morgan Stanley, NEA, Upfront Ventures, First Round Capital and Crosscut Ventures.','http://cdn.betteradvertising.com/logos/Screen_Shot_2015-10-27_at_3.23.07_PM.png','84');
INSERT INTO "companies" VALUES('keen_io','Keen IO','None','Not found','Not found','https://keen.io/privacy-policy?source=footer','https://keen.io','"Keen IO was specifically built to capture and store event data — those constant little interactions that happen all day, every day, in your apps. Event data can be anything, and Keen IO gives you the ability to grab as much of it as you want, then store it forever on our cloud database."','http://cdn.betteradvertising.com/logos/keenio.png','2915');
INSERT INTO "companies" VALUES('kaltura','Kaltura','"Kaltura is the world''s first Open Source Online Video Platform, providing both enterprise level commercial software and services, fully supported and maintained by Kaltura, as well as free open-source community supported solutions, for video publishing, management, syndication and monetization."','http://corp.kaltura.com/About-Kaltura','http://corp.kaltura.com/company/contact-us','http://corp.kaltura.com/privacy-policy','http://corp.kaltura.com/','"Kaltura is the world''s first Open Source Online Video Platform, providing both enterprise level commercial software and services, fully supported and maintained by Kaltura, as well as free open-source community supported solutions, for video publishing, management, syndication and monetization."','http://cdn.betteradvertising.com/logos/kaltura.png','1480');
INSERT INTO "companies" VALUES('groupm','GroupM','GroupM is a media holding company. Its operating goal is to support its clients Maxus, MEC, MediaCom, Mindshare and Kinetic in client-focused activities including trading, content creation and digital communications among others. GroupM is a WPP company.','http://www.groupm.com/content/about-us','http://groupm.com/contact','http://www.groupm.com/privacy-policy','http://www.groupm.com/','"GroupM invests in people, content, technology and data to make its agencies optimally effective and efficient for clients, providing intelligence to find or create valuable audiences and outcomes. Our leadership, inventiveness and scale drive success for our clients, partners and people."','http://cdn.betteradvertising.com/logos/groupm.png','274');
INSERT INTO "companies" VALUES('nanigans','Nanigans','','http://www.nanigans.com/about/','http://www.nanigans.com/contact/','http://www.nanigans.com/privacy-policy/','http://www.nanigans.com/','"Nanigans’ Ad Engine automates the labor-intensive process of managing and optimizing large-scale Facebook ad campaigns, measuring beyond the initial ad clickthrough to meet specific business goals: from driving App installs and Page Likes to viral referrals, repeat purchases and more."','http://www.featuredcustomers.com/media/Company.logo/nanigans-logo-color.jpg','1751');
INSERT INTO "companies" VALUES('rtb_house','RTB House','None','https://www.rtbhouse.com/about/team/','http://www.rtbhouse.com/contact/','http://www.rtbhouse.com/privacy/','http://www.rtbhouse.com/','RTB House is a global company that provides state-of-the-art retargeting
technology for top brands worldwide. The company’s proprietary ad buying
engine, powered by deep-learning algorithms, helps leading advertisers
generate outstanding results to reach their short, mid and long-term goals.
Founded in 2012, RTB House serves over a thousand campaigns across EMEA,
APAC, and LATAM regions with main locations in Singapore, Moscow, Dubai,
São Paulo and Warsaw.','http://cdn.betteradvertising.com/logos/rtbhouse.png','3371');
INSERT INTO "companies" VALUES('adyoulike','Adyoulike','None','Not found','Not found','http://www.adyoulike.com/privacy-uk/index.html','http://www.adyoulike.com/','"Adyoulike offer[s] a new advertising experience thanks to intuitive and interactive formats completely fit to the editorial content."','http://cdn.betteradvertising.com/logos/adyoulike.png','2629');
INSERT INTO "companies" VALUES('livechat','LiveChat','None','http://www.livechatinc.com/about/','Not found','http://www.livechatinc.com/privacy-policy/','http://www.livechatinc.com','Our mission is to deliver fast and simple communication between e-commerce owners and best prospects on their websites and to make online sales process easier.

Company motto – “Keep it simple!”','http://cdn.betteradvertising.com/logos/livechat.png','2653');
INSERT INTO "companies" VALUES('igodigital','iGoDigital','iGoDigital offers a suite of product recommendations and social commerce solutions to online retailers. The individual tools that iGoDigital offers range from product finders, to customized selling or guided selling tools, to product attribute libraries.','http://www.igodigital.com/about','http://www.igodigital.com/about/contact','http://www.igodigital.com/privacy','http://www.igodigital.com/','"iGoDigital is the leading provider of personalization services that guide smarter retail. Powered by the Customer Intelligence Engine, iGoDigital is the only provider in the market with the technology to observe customer behavior, ask explicit questions, leverage social profiles and analyze "wisdom of the crowed" in order to deliver a truly personalized user experience."','http://cdn.betteradvertising.com/logos/igodigital1.png','689');
INSERT INTO "companies" VALUES('getsitecontrol','GetSiteControl','None','https://getsitecontrol.com/about/','Not found','https://getsitecontrol.com/privacy/','https://getsitecontrol.com/','GetSiteControl is an easy-to-use set of smart widgets for website optimization. It lets a website owner quickly add elements that engage website visitors and help to increase conversions. With average visitors spending less than a minute on a website, it is important to make sure they see the most important content right away and encourage them to stay longer and engage more with the website. That’s what GetSiteControl is for.','http://','4817');
INSERT INTO "companies" VALUES('jivox','Jivox','','http://www.jivox.com/about.php','Not found','http://www.jivox.com/privacypolicy.php','http://www.jivox.com/','"Jivox -- the leader in data driven advertising and marketing
Jivox is the leader in data driven advertising and marketing – including programmatic creative advertising that includes in app video, native, mobile and display ads – for multiscreen ad campaigns. Global brands and media agencies rely on Jivox’s data driven dynamic ad platform to create, serve and manage personalized advertising campaigns, sometimes described as programmatic creative advertising.
Data is what makes programmatic creative campaigns work, enabling advertisers to adjust branding and product messaging, images, pricing, and other ad content on-the-fly based on relevance to the user and market conditions, creating a personalized, custom experience for the consumer.
As a result, Jivox’s flagship product, Jivox IQ is the preferred dynamic ad platform and is used today by several hundred brands, media companies and creative agencies to create and serve their most demanding multi-screen ad campaigns. Our marquee customer list includes A&E Networks, Charles Schwab, College Humor, Crispin Porter & Bogusky, Federated Media, FedEx, Digitas, Havas, Hearst, Jack Daniels, Johnson & Johnson, Marriott, Merkley + Partners, Razorfish, Red Bull, Universal McCann, and Wieden+Kennedy.
In addition to being first to deliver a true data driven dynamic ad development and serving platform, Jivox also pioneered the use of self-service creative and production tools to enable personalized ads at scale without the complexities and error prone process of manual code development."
','http://cdn.betteradvertising.com/logos/jivox.png','1872');
INSERT INTO "companies" VALUES('1000mercis','1000mercis','None','http://www.1000mercis.com/about-us/company-overview.html','http://www.1000mercis.com/#!/contact','http://mmtro.com/privacy/fr/','http://www.1000mercis.com/','"1000mercis Group, a pioneer in interactive advertising and marketing, provides innovative solutions for companies willing to optimise their customer acquisition and retention through interactive media (Internet, mobile phones and tablets)."','http://cdn.betteradvertising.com/logos/1000mercis.png','2262');
INSERT INTO "companies" VALUES('digicert','Digicert','"SSL Certificates from DigiCert provide the strongest 2048-Bit and SHA-2 encryption available in a variety of options designed to meet your needs."','https://www.digicert.com/about-digicert.htm','Not found','https://www.digicert.com/digicert-privacy-policy.htm','https://www.digicert.com/','"SSL Certificates from DigiCert provide the strongest 2048-Bit and SHA-2 encryption available in a variety of options designed to meet your needs."','http://cdn.betteradvertising.com/logos/digicert.png','1526');
INSERT INTO "companies" VALUES('friendfinder_networks','FriendFinder Networks','FriendFinder Networks is an Internet-based social networking company. Their sites'' services include social networking, online personals, live and recorded video, online chat rooms, instant messaging, photo and video sharing, blogs, message boards, email and premium content websites. FriendFinder Networks licenses the Penthouse brand to consumer product companies and entertainment venues, and publishes branded men''s lifestyle magazines.','http://www.ffn.com/about','Not found','http://www.ffn.com/privacypolicy','http://www.ffn.com/','"FriendFinder Networks Inc. is a leading Internet-based social networking and technology company operating several of the most heavily-trafficked websites in the world...Our sites’ services include social networking, online personals, live and recorded video, online chat rooms, instant messaging, photo and video sharing, blogs, message boards, email and premium content websites."',' http://ffn.com/wp-content/uploads/2013/12/ffn_logo_2014_site.jpg','904');
INSERT INTO "companies" VALUES('gemius_sa','Gemius SA','Gemius is a Poland based international marketing company. They provide a wide range of internet marketing tools  to brand name clients throughout Eastern Europe. Gemius supplies data on Internet users'' behavior (gemiusTraffic), internet audience profiles (gemiusProfile) or online advertising campaign effectiveness (gemiusEffect). GemiusAudience provides measurement of online audiences for media planners, buyers and sellers.','https://www.gemius.com/about-us.html','https://www.gemius.com/contact.html',' https://www.gemius.com/privacy-policy-for-gemius-website.html',' https://www.gemius.com/homepage.html',' Gemius is best known as a company specialising in gathering, processing and analysing data on the behaviour of internet users. Over the last 15 years, the company has been providing knowledge concerning online audience: unique socio-demographic profiles, ways they use the internet. With many years of experience in the research filed, we naturally evolved into a consulting company. Presently, we advise businesses on how to enhance their online operations.

','https://www.gemius.com/files/www/img/logo.png','381');
INSERT INTO "companies" VALUES('adclear','AdClear','','  http://www.adclear.de/en/about-adclear/','http://www.adclear.de/en/about-adclear/contact.html','http://www.adclear.de/en/dataprivacy/','http://www.adclear.de/en/home.html','"AdClear offers a cutting-edge platform for the complete tracking of the Customer Journey and provides easy-to-use reports, which make previously hidden associations and interactions in online campaigns apparent and ready for analysis. Whether for Advertisers, Agencies or Publishers, AdClear is the optimal platform to obtain the best possible results from your online campaigns."


','http://cdn.betteradvertising.com/logos/adclear.png','1787');
INSERT INTO "companies" VALUES('the_adex','The ADEX','None','http://www.theadex.com/company/','http://www.theadex.com/contact/','http://www.theadex.com/#privacy','http://www.theadex.com/','"The ADEX is the global specialist for Data Management Solutions.
Our mission
is to help Advertisers, Publishers and Agencies to learn more about their Audiences and to enable all market participants get a data-driven access to Programmatic Media with Next Generation Data Management Solutions.
Products & Solutions
are associated and compatible to each other and are following a strong focus on information based and powerful technologies. Efficiency and results of digital advertising campaigns will be maximized by having an added value, no matter if the campaign is characterized by Performance, Branding or Social Media intentions."
','http://cdn.betteradvertising.com/logos/adex.png','3458');
INSERT INTO "companies" VALUES('flag_counter','Flag Counter','"Add our free counter to any webpage and collect flags from all over the world. Every time someone from a new country visits your site, a flag will be added to your counter...Clicking on your Flag Counter will reveal amazing information and charts!"','Not found','http://flagcounter.com/contact.html','http://flagcounter.com/privacy.html','http://flagcounter.com/','"Add our free counter to any webpage and collect flags from all over the world. Every time someone from a new country visits your site, a flag will be added to your counter...Clicking on your Flag Counter will reveal amazing information and charts!"','http://cdn.betteradvertising.com/logos/flagcounter.png','1680');
INSERT INTO "companies" VALUES('monster_worldwide','Monster Worldwide','Monster.com is a career and recruitment resource. The Monster Career Ad Network sources job postings automatically from Monster or MonsterTRAK, develops the postings into a creative ad that is then targeted toward appropriate candidates via strategic placements throughout the web. Monster.com is the flagship brand of Monster Worldwide, Inc.','http://www.monster.com/about/','https://monster.secure.force.com/ekb/EKBContactUs?brand=seeker','http://inside.monster.com/ad-policy/inside2.aspx','http://www.monster.com/','"Monster Worldwide, Inc. is the parent company of Monster.com, the premier global online employment solution for people seeking jobs and the employers who need great people." ','http://cdn.betteradvertising.com/logos/monster.png','723');
INSERT INTO "companies" VALUES('netbiscuits','Netbiscuits','None','http://www.netbiscuits.com/company/about-netbiscuits/','Not found','http://www.netbiscuits.com/full-privacy-policy/','http://www.netbiscuits.net/','"Netbiscuits is a global leader in mobile analytics and device detection solutions, helping companies achieve increased reach and performance, while improving conversion and customer engagement. Our cloud software records over one billion unique page impressions a month, serving global brands such as eBay, Coca Cola, MTV, BMW and T-Online. Catalogued and quality-assured through manual testing since the year 2000, we have the world’s most accurate and complete device library – the Netbiscuits Vault℠. The Vault contains detailed device feature capabilities, and includes over 7,300 device, 157 operating system and 343 web browser profiles. The Netbiscuits technology features unique server-side and client-side detection. By giving companies access to the contextual information of web visitors such as location and connection speed, we enable the creation of exceptional mobile experiences for every connected device."','http://cdn.betteradvertising.com/logos/netbiscuits.png','3606');
INSERT INTO "companies" VALUES('pulsepoint_ad_exchange','Pulsepoint Ad Exchange','CONTEXTWEB is an advertising exchange that allows advertisers to bid on audience segments for targeting ads across affiliated publishers.','http://www.pulsepoint.com/home-about.html','http://www.pulsepoint.com/contact.html','http://www.pulsepoint.com/privacy-policy.html','http://www.pulsepoint.com/','"PulsePoint is the global digital technology company poised at the intersection of audience and content, unlocking true value to advertisers and publishers by breaking down media silos to deliver holistic solutions.

Forged from a successful partnership between CONTEXTWEB and Datran Media, PulsePoint’s unique capabilities include granular audience measurement, advanced multi-channel ad serving and page-level contextualization, along with the ability to create and distribute crowd-sourced content."','http://s3.amazonaws.com/garysguide/b281ec5290f94c978a7c043485d96324original.png','293');
INSERT INTO "companies" VALUES('appdynamics','AppDynamics','None','https://www.appdynamics.com/why-appdynamics/','http://www.appdynamics.com/company/contact-us','http://www.appdynamics.com/privacy-policy','http://www.appdynamics.com','"AppDynamics is the easy-to-use application performance management solution that simplifies the management of complex, business-critical apps."','http://cdn.betteradvertising.com/logos/appdynamics.png','2793');
INSERT INTO "companies" VALUES('chartbeat','ChartBeat','Chartbeat provides real-time analytics to web sites and blogs. The interface tracks visitors, load times, and referring sites on a minute-by-minute basis. This allows real-time engagement with users giving publishers an opportunity to respond to social media events as they happen. ChartBeat also supports mobile technology through APIs. Chartbeat is a betaworks Company.','http://chartbeat.com/about/','Not found','http://chartbeat.com/privacy/','http://chartbeat.com','"A sustainable web demands we measure and monetize attention.
Since the web''s creation, the standard unit of success has been the click. Yet the goal of content creation has always been to get the right information to the right people and have them consume it, understand it, learn from it.
This massive disconnect of goals and metrics has led to a web that rewards empty traffic, clickbait headlines, and billions of unseen ad impressions.
Chartbeat is changing that. We quantify the value between the clicks.
We partner with editorial teams to identify their highest quality content -- the pieces that pique and keep reader attention. We partner with advertising teams to plan campaigns around this high-quality content so these ads are seen more often and for longer.
This shift to valuing and transacting on the time people are paying attention means publishers creating quality content get paid more for it, brands get the time in front of an attentive audience they''re paying for, and readers get the best user experience possible."
','http://cdn.betteradvertising.com/logos/chartbeat1.png','313');
INSERT INTO "companies" VALUES('improve_digital','Improve Digital','Improve Digital is an online advertising yield management company. They enable premium publishers to maximize unsold and premium inventory using their optimization and self-learning technology.','http://www.improvedigital.com/en/about','Not found','http://www.improvedigital.com/en/platform-privacy-policy','http://www.improvedigital.com/','"The company provides real time advertising technology to owners of premium digital media  that want to build their own Private Ad Ecosystem. Improve Digital enables them to build, grow, manage, control, and optimise their own environment driving revenues from direct campaigns, RTB, ad networks, exchanges, trading desks and any other 3rd party media buyer."','http://cdn.betteradvertising.com/logos/improvedigital1.png','523');
INSERT INTO "companies" VALUES('geotrust','GeoTrust','None','https://www.geotrust.com/about/','https://www.geotrust.com/about/contact/support-form/','https://www.geotrust.com/about/privacy-policy.html','https://www.geotrust.com/','"GeoTrust® is the world''s second largest digital certificate provider... ...trust GeoTrust to secure online transactions and conduct business over the Internet. Our range of digital certificate and trust products enable organizations of all sizes to maximize the security of their digital transactions cost-effectively."','http://cdn.betteradvertising.com/logos/geotrust.png','3381');
INSERT INTO "companies" VALUES('trusted_shops','Trusted Shops','None','http://business.trustedshops.co.uk/about-us/','Not found','http://business.trustedshops.co.uk/imprint/','http://business.trustedshops.co.uk/','`The Trusted Shops trustmark, a combination of a comprehensive audit by legal experts, solution-oriented customer service and financial protection, designates trustworthy shops. While consumers can sit back and wait for their delivery, online retailers can enjoy the satisfaction of fewer abandoned purchases and more customers. With the Trusted Shops customer reviews, it has been possible since 2008 to award stars for delivery, the condition of the goods and customer service. Customers can also leave a comment to report on the experience they’ve had when shopping. In this way, consumers provide each other with guidance and give online retailers the opportunity to continuously improve. A consistently good rating is the best advertisement for your shop','http://cdn2.hubspot.net/hub/603347/hubfs/trustedshops-images/e-trustedshops_black.svg?t=1488987867374&width=180&name=e-trustedshops_black.svg','4752');
INSERT INTO "companies" VALUES('ekomi','eKomi','None','http://www.ekomi.co.uk/uk/about-ekomi','Not found','http://www.ekomi.co.uk/uk/privacy','http://www.ekomi.co.uk','"Using social commerce technology, eKomi collects customer feedback, product reviews, comments and recommendations."','http://cdn.betteradvertising.com/logos/ekomi2.png','2702');
INSERT INTO "companies" VALUES('gigya','Gigya','Gigya is a social optimization platform for online businesses, providing social sharing and registration solutions. This enables online businesses to increase traffic, registrations and engagement. Gigya''s Share plugin gives websites a plug-and-play way for users to share content and activity on Facebook, Twitter, Yahoo, LinkedIn, Windows Live Messenger and MySpace. Gigya''s platform aggregates and optimizes social APIs including Facebook Connect.','http://www.gigya.com/about-us/','http://www.gigya.com/about-us/contact-us/','http://www.gigya.com/privacy-policy/','http://www.gigya.com/','Gigya helps companies turn unknown site visitors into known, loyal and engaged customers. More than 700 of the world’s leading enterprises, including 50% of the comScore top 100 US web properties, rely on Gigya to build identity-driven relationships with their customers while powering scalable, secure customer identity management.','http://cdn.betteradvertising.com/logos/gigya1.png','517');
INSERT INTO "companies" VALUES('liveinternet','LiveInternet','This company was created for the purpose of adding its tracking script to the Ghostery detection library, but there is not enough information available for us to compile a complete profile for it. Reasons for this may include: no website or a landing page only, no privacy policy or clear company description, or inadequate translation for foreign companies.','Not found','Not found','https://liveintent.com/privacy-policy/','http://www.liveinternet.ru/','"The largest blogging service in Russia, began its work in July 2002. Service provides a wide range of personal settings, and allows the user to maintain an electronic version of the online diary, to share their experiences, thoughts and opinions with other users, upload photos, favorite music, videos, discuss and comment on entries of other users, exchange private messages, create communities of interest and much more."','http://cdn.betteradvertising.com/logos/liveinternet.png','224');
INSERT INTO "companies" VALUES('snowplow','Snowplow','None','http://snowplowanalytics.com/about/','Not found','https://snowplowanalytics.com/privacy-policy/','http://snowplowanalytics.com/','','http://cdn.betteradvertising.com/logos/snowplow.PNG','4577');
INSERT INTO "companies" VALUES('webtrends','Webtrends','WebTrends operates as a Web analytics and customer intelligence company. They offer search engine marketing, visitor intelligence, and analytics solutions. They measure online activities to enable companies to understand their customers, and drive engagement & brand awareness.  Webtrends Visitor Data Mart is a tool that combines a person''s online behavior with offline customer data, such as CRM or demographics to build insight into a person over time. WebTrends is a business unit of NetIQ.','Not found','https://www.webtrends.com/about-us/contact-us/','https://www.webtrends.com/terms-policies/privacy-notice/','https://www.webtrends.com/','"The technological building blocks of the Webtrends Infinity™ platform have been carefully constructed to harness the power of big data to create the most impactful, integrated analytics and optimization solutions. With an end-to-end streaming data pipeline utilizing technologies such as Hadoop, Spark and Kafka, you can ensure your customer data is set up for success in the new era of the Internet of Things."','Not found','181');
INSERT INTO "companies" VALUES('pinterest','Pinterest','"Pinterest lets you organize and share all the beautiful things you find on the web. People use pinboards to plan their weddings, decorate their homes, and organize their favorite recipes."','http://pinterest.com/about/','Not found','http://pinterest.com/about/privacy/','http://pinterest.com/','"Pinterest is the world’s catalog of ideas. Find and save recipes, parenting hacks, style inspiration and other ideas to try."','http://cdn.betteradvertising.com/logos/pinterest.png','1306');
INSERT INTO "companies" VALUES('wiredminds','WiredMinds','WiredMinds is a German web analytics company. Their focus is on analyzing the user behavior of web-based applications and processes, as well as websites. WiredMinds also offers its tracking-technology to be licensed and integrated with other products and solutions.','https://www.wiredminds.de/wiredminds-gmbh/','https://www.wiredminds.de/kontakt/','https://wiredminds.de/datenschutz/','https://www.wiredminds.de/home/','"WiredMinds AG is the manufacturer and Web-based solutions for online lead generation tracking software. In the European market, products are available for analysis-privacy-compliant Web site, the detection of web presence and business visitors to the tracking of mobile devices."','http://cdn.betteradvertising.com/logos/WiredMinds.png','779');
INSERT INTO "companies" VALUES('audiencescience','AudienceScience','AudienceScience is a online advertising network that operates a behavioral targeting platform. They collect, measure, and segment people''s interests and intent based on web behavior. This data is aggregated and sold to advertisers for targeted ad delivery. AudienceScience was formerly known as Revenue Science.','http://www.audiencescience.com/about','http://www.audiencescience.com/contact','http://www.audiencescience.com/privacy/','http://www.audiencescience.com','"AudienceScience is a digital marketing technology company enabling universal access to audiences through the AudienceScience Gateway. The AudienceScience Gateway is a proprietary audience delivery platform that unleashes the power of data making it simple to create, understand, and engage relevant audiences. By leveraging industry leading technology, superior service, and unique data assets AudienceScience drives digital marketing success for advertisers, agencies, publishers and technology partners."','http://www.audiencescience.com/wp-content/themes/audiencescience-responsive/images/main-logo.png','19');
INSERT INTO "companies" VALUES('certona__resonance_','Certona (Resonance)','Certona''s behavioral targeting and personalization platform Resonance enables online retailers to personalize their customers'' experience by delivering individualized product recommendations in real-time. Resonance provides real-time consumer recommendations, promotional offers, targeted advertising, enhanced search and personalized digital entertainment recommendations.
','http://www.certona.com/company','Not found','http://www.certona.com/privacy/','http://www.certona.com/','"Certona is the market leading personalization and revenue optimization provider for online and multi-channel retailers. Our vision is to intelligently and automatically personalize the entire visitor experience for each individual across all touch points including their web site experience, email, mobile, in-store, call center and social networks."  Certona operates Resonance platform technology. ','http://cdn.betteradvertising.com/logos/certona1.png','351');
INSERT INTO "companies" VALUES('symantec__norton_secured_seal_','Symantec','None','https://www.symantec.com/about/','https://www.symantec.com/contact-us','https://www.symantec.com/privacy/','https://www.symantec.com/page.jsp?id=ssl-resources&tabID=3#','"We are dedicated to investing in the online security ecosystem, and will continue to lead the field with the most recognized trust mark on the internet– look for the Norton Secured Seal!
Consumer tests by Symantec show that the Norton Secured Seal retains the high level of recognition and trust valued by eCommerce and other privacy-minded web owners. An independent test run in January 2013 also showed that the Norton Secured Seal offers consumers the greatest feeling of trust on the internet!
Symantec has invested in making the online ecosystem safer by also offering:
Daily malware scanning and vulnerability testing
ECC and DSA algorithm agility
Improved SSL Tools for certificate checking
Seal-in-search
Express and auto-renewals
Enterprise offering - Certificate Intelligence Center"
','http://cdn.betteradvertising.com/logos/symantec1.png','2447');
INSERT INTO "companies" VALUES('salecycle','SaleCycle','','  http://www.salecycle.com/about-salecycle/','http://www.salecycle.com/Contact.aspx','http://www.salecycle.com/cookie-policy/','http://www.salecycle.com/','"SaleCycle focuses on returning potential customers to your website in order to complete their transaction. By maximising your ability to re-engage with lost customers, SaleCycle enables you to successfully recover what could have been lost sales."','http://cdn.betteradvertising.com/logos/salecycle.png','1963');
INSERT INTO "companies" VALUES('flattr','Flattr','"Flattr is the worlds first social micro-payment system...Flattr was founded to help people share money, not just content."','http://flattr.com/about','https://flattr.com/contact','http://flattr.com/privacy','http://flattr.com/','"Flattr is the worlds first social micro-payment system...Flattr was founded to help people share money, not just content."','http://cdn.betteradvertising.com/logos/flattr.png','1367');
INSERT INTO "companies" VALUES('livefyre','Livefyre','None','http://www.livefyre.com/about/','http://www.livefyre.com/contact/','http://www.livefyre.com/privacy/','http://www.livefyre.com/','"At Livefyre we''re passionate about building community and changing the way people interact with your content. Our LiveComments, LiveBlog, and LiveChat apps ignite real-time conversations on your site."','http://cdn.betteradvertising.com/logos/livefyre.png','2414');
INSERT INTO "companies" VALUES('reddit','reddit','"reddit is a source for what''s new and popular on the web. Users like you provide all of the content and decide, through voting, what''s good and what''s junk."','https://about.reddit.com/','https://www.reddit.com/contact/','http://www.reddit.com/help/privacypolicy','http://reddit.com','"reddit is a source for what''s new and popular on the web. Users like you provide all of the content and decide, through voting, what''s good and what''s junk."','http://cdn.betteradvertising.com/logos/reddit1.png','1734');
INSERT INTO "companies" VALUES('fidelity_media','Fidelity Media','None','http://fidelity-media.com/about-us/','Not found','http://fidelity-media.com/about/privacy-policy/','http://fidelity-media.com/','"Fidelity Media is an advertising network which provides optimal solutions to digital media publishers, marketers, brands, agencies, and networks."','http://cdn.betteradvertising.com/logos/fidelitymedia.png','3115');
INSERT INTO "companies" VALUES('clicktale','ClickTale','ClickTale is a web usability tool that provides website analytics. The tool collects information and reports on individual visitor behavior inside a web page. The tool aggregates various visitor sessions; creates movies of browsing sessions for Website owners; and offers heatmaps to view data, search capabilities, automatic tagging, and recording of HTTP pages, such as checkout and login pages.','http://www.clicktale.com/about-clicktale','https://www.clicktale.com/company/contact-us/','https://www.clicktale.com/company/privacy-policy/','http://www.clicktale.com/','"ClickTale is the industry leader in Customer Experience Analytics (CEA), providing businesses with revolutionary insights into their customers’ online behavior. Over 70,000 businesses rely on ClickTale to optimize website performance, improve usability and dramatically increase conversion rates." ',' https://image4.owler.com/logo/clicktale_owler_20160224_180612_original.jpg','41');
INSERT INTO "companies" VALUES('kontext','Kontext','None','https://www.kontextr.com/wie-funktionierts/','http://www.kontextr.com/kontakt/','http://www.kontextr.com/datenschutzerklaerung/','https://www.kontextr.com/','','http://','4743');
INSERT INTO "companies" VALUES('usemax','Usemax','None','http://www.usemax.de/index.php?l=ueber_uns','http://www.usemax.de/index.php?l=kontakt','http://www.usemax.de/index.php?l=privacy','http://www.usemax.de','"Usemax advertisement allows site operators to monetize your Werbflächen effective and sustainable manner and to open up new revenue streams. We offer attractive promotions at the site operator that are settled on display and performance-based."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/usemax.png','2408');
INSERT INTO "companies" VALUES('plista','Plista','plista GmbH is a German advertising network. They offer various advertising formats within the text/image, video and display/IAB layouts, as well as a powerful white label self-booking platform.','https://www.plista.com/about-plista','Not found','https://www.plista.com/privacy','http://www.plista.com/','"plista GmbH is one of the most successful advertising networks in the German-speaking world and offers innovative advertising formats within the text/image, video and display/IAB layouts." ','http://cdn.betteradvertising.com/logos/plista.png','1074');
INSERT INTO "companies" VALUES('m-pathy','m-pathy','None','http://www.m-pathy.com/cms/ueber_uns','http://www.m-pathy.com/cms/kontakt','http://www.m-pathy.com/cms/datenschutz','http://www.m-pathy.com/','"Because with m-pathy we capture the actual behavior of visitors to a new depth and make business-critical online processes transparent. With our analytical results, we show in real user sessions, the hurdles in the operation. From quantified interaction data arise objective conclusions for the optimization of your website."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/m-pathy.png','3363');
INSERT INTO "companies" VALUES('spoteffect','Spoteffect','None','http://www.spoteffects.com/company/','http://www.spoteffects.com/home/#footer','http://www.spoteffects.com/footer/imprint/#c920','http://www.spoteffects.com/home/','The webeffects GmbH is located in the heart of Munich. It develops and markets the software as a service solution spoteffects. The solution allows media planners to optimize theirTV campaigns for online shops and websites based on immediately generated visits and conversions per ad. This replaces the current method of TV planners to just use reached audience when planning TV campaigns. By merging TV airing data with web tracking data through a sophisticated algorithm, spoteffects bridges the media gap between TV and web.','http://www.spoteffects.com/fileadmin/spoteffects/media/images/graphics/Logo.png','4718');
INSERT INTO "companies" VALUES('histats','Histats','Histats is an online analytics provider that allows its customers to place counters and trackers on their websites, and reports usage statistics in real-time.','Not found','http://www.histats.com/?act=4','http://www.histats.com/?act=5','http://www.histats.com','"Real time data flow."','http://cdn.betteradvertising.com/logos/histats.png','238');
INSERT INTO "companies" VALUES('apester','Apester','None','http://apester.com/about','Not found','http://apester.com/privacy','http://apester.com/','','http://','4900');
INSERT INTO "companies" VALUES('nativo','Nativo','None','http://www.nativo.net/#about','http://www.nativo.net/#contact-us','http://www.nativo.net/#privacy-policy','http://www.nativo.net/','"The Nativo platform enables publishers to easily activate, deploy and manage native ad placements across their media properties."','http://cdn.betteradvertising.com/logos/nativo_logo.png','2568');
INSERT INTO "companies" VALUES('adwebster','adwebster','None','http://adwebster.com/Pages/about/about.aspx','Not found','Not found','http://adwebster.com','"adwebster is a technology company that specializes in the operation and maintenance of digital advertising networks."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/adwebster.png','3301');
INSERT INTO "companies" VALUES('mediamath','MediaMath','MediaMath provides technology, strategy, services and insights to trade effectively across the leading display advertising exchanges on behalf of major advertisers. Its TerminalOne technology platform combines proprietary supply relationships, programmatic buying algorithms, unique data access, workflow tools and transparent reporting to facilitate digital media trading.','http://www.mediamath.com/about/','http://www.mediamath.com/contact/','http://www.mediamath.com/privacy-policy/','http://www.mediamath.com/','"Our technology and services enable marketers to reach the audiences they want at the scale they need to achieve the outcomes they desire. Since 2007, when we created the first software for real-time media buying, MediaMath''s global infrastructure, vast partner network and quantitative approach have delivered transformative results – truly strength in numbers.  Today, marketers are adopting our vision. They are engaging in one-to-one conversations with customers and prospects across display, social, mobile and video. And they''re focused on real business outcomes rather than user clicks.  MediaMath is partnering with the most forward-thinking brands and agencies to accelerate these changes. We build on the leading edge of technology and innovate at scale. We combine an open platform – purpose-built for enterprise marketers and powered by machine learning – with scaled, privileged inventory, exclusive data and industry-leading training and support."','http://cdn.betteradvertising.com/logos/mediamath.png','290');
INSERT INTO "companies" VALUES('lifestreet_media','LifeStreet Media','Founded in 2005, LifeStreet Media has become the largest social media ad network, serving billions of impressions each month into 8,000+ applications and sites to a global audience of over 100 million. The company’s proprietary technology, customer focus, and commitment to compliance with advertising guidelines have allowed it to quickly achieve market leadership. Fusing optimization technology with human insight, LifeStreet Media relentlessly creates and optimizes thousands of ads and landing pages on behalf of its advertisers. This approach maximizes revenues, eliminates guesswork, and saves time and resources for advertisers, developers and publishers alike.','Not found','http://lifestreetmedia.com/contact/','http://www.lifestreet.com/privacy/','http://lifestreetmedia.com/','"LifeStreet Media is the largest social media ad network for Facebook applications, and one of the world’s biggest distributors of Facebook applications."','http://cdn.betteradvertising.com/logos/lifestreetmedia1.png','1310');
INSERT INTO "companies" VALUES('smartsuppp','Smartsuppp','None','https://www.smartsupp.com/features','https://www.smartsupp.com/contact','https://www.smartsupp.com/privacy','https://www.smartsupp.com/','"Chat with visitors in real-time
Instantly answer your visitors questions. You will receive a notification every time a visitor starts a chat conversation with you.
Record the screens of your visitors
Watch video recordings of any visitor on your website. You see his screen, mouse movement and clicks. Great for understanding the behavior of your customers.
Supported platforms
Smartsupp can be used on any website. Take a look at our tutorials for integrating with the most well known platforms.
Answer chats from your smartphone
Chat with visitors from anywhere using your mobile devices. How to set it up?"
','http://','4250');
INSERT INTO "companies" VALUES('infectious_media','Infectious Media','Infectious Media provides online media buying services to advertisers and agencies. Infectious Media uses a proprietary technology platform called Impression Desk that ensure that advertisements are shown to the most relevant users on the most relevant websites.  ',' http://www.infectiousmedia.com/about-us/',' http://www.infectiousmedia.com/contact-us/','http://infectiousmedia.com/privacy-policy/','http://www.infectiousmedia.com/','"We are specialists in intelligent online display. We deliver a fully managed service which combines advanced analytics with proprietary targeting and optimisation tools to power efficient real-time display advertising."','http://cdn.betteradvertising.com/logos/infectiousmedia1.png','650');
INSERT INTO "companies" VALUES('vibrant_media','Vibrant Media','Vibrant Media is a contextual advertising network hosting the IntelliTXT platform on Web sites. The IntelliTXT platform underlines keywords on a site and serves an advertisement associated with those words when users hover of them. Advertisers pay to have their ads associated with particular words.','http://www.vibrantmedia.com/about-us/','http://www.vibrantmedia.com/contact-us/','http://www.vibrantmedia.com/privacy-policy/','http://www.vibrantmedia.com','"In 2000, two entrepreneurs had a vision to change advertising on the web. They saw an opportunity to enhance the user experience by connecting consumers directly to relevant branded content. This original native advertising concept became the game-changing cornerstone on which Vibrant was built. After nearly 15 years, a network of 6,600 sites, dozens of brand partners, billions of views, and eight premium product solutions, Vibrant is truly transforming content connections."','http://cdn.betteradvertising.com/logos/vibrant.png','179');
INSERT INTO "companies" VALUES('mythings_','MyThings ','MyThings is a performance based advertising network focused on retargeting solutions. They analyze on-site browsing behavior then present individualized, dynamic advertising banners to visitors wherever they surf the web. For example, if a visitor leaves the site without purchasing from a Web page featuring sweaters, the advertising messages presented to that visitor when they are browsing a different website, may include messages about sweater promotions.','http://www.mythings.com/default.htm#section2','http://www.mythings.com/default.htm#section6','http://www.mythings.com/?page_id=8338','http://www.mythings.com/','myThings is the global leader in customized programmatic ad solutions. Running personalized retargeting campaigns on desktop, mobile and Facebook, the company personalizes over 5 billion impressions a month for the largest e-commerce brands in 30 markets including Adidas, Walmart, ToysRUs, Very.co.uk, Littlewoods, Zalando, Orange, Best Buy, and Microsoft.','http://www.mythings.com/wp-content/themes/mythings/images/logo.png','617');
INSERT INTO "companies" VALUES('maruedr','MaruEdr','None','https://www.maruedr.com/privacy/','Not found','http://public.edigitalresearch.com/privacy','https://www.maruedr.com','Changing the rules of market research using technology and advisory services.

For too long, too many have spent too much time sifting through data. Maru/edr’s technology gets to the bottom of customer feedback and big data fast so more time can be spent improving businesses.

By combining technology and advisory insight, we offer a flexible Voice of the Customer toolset to listen to customers, interpret their needs and delight by turning feedback into clear business action.

It means we can adapt to your needs and business model, empowering you to make critical business decisions in the moments that matter – from marketing and customer service to product range and usability…In fact, any part of the customer experience.','https://www.maruedr.com/wp-content/uploads/2016/02/maru-edr-final-small.png','4605');
INSERT INTO "companies" VALUES('zendesk','Zendesk','Zendesk is a web-based help desk solution. Their Software-as-a-Service (SaaS) package is designed with a support ticket system and a self-service customer support platform to help manage customer conversations.',' https://www.zendesk.com/about/',' https://www.zendesk.com/support/contact/','http://www.zendesk.com/company/privacy','http://www.zendesk.com/','"Zendesk is a leading provider of hosted help desk software that is reinventing how companies engage with their customers."','http://cdn.betteradvertising.com/logos/zendesk1.png','190');
INSERT INTO "companies" VALUES('perfect_audience','Perfect Audience','None','https://www.perfectaudience.com/about','https://www.perfectaudience.com/contact','https://www.perfectaudience.com/privacy/','https://www.perfectaudience.com/','"We''re making Facebook retargeting and web retargeting fast, effective, and affordable so companies can grow with ease."','http://cdn.betteradvertising.com/logos/perfectaudience.png','2394');
INSERT INTO "companies" VALUES('wistia','Wistia','Wistia is a provider of online video hosting technology for businesses. Their tools make it easy to embed videos on publisher websites and in email campaigns, manage and share internal videos, and track the engagement of viewers.','https://wistia.com/about/yearbook',' https://wistia.com/support/contact','http://wistia.com/privacy','http://wistia.com/','"(Wistia) provides the best online video management experience possible. Our goal is to enable every business on the planet to get more value from their videos."','http://cdn.betteradvertising.com/logos/wistia1.png','1307');
INSERT INTO "companies" VALUES('adtiger','AdTiger','AdTiger is an German marketing agency. AdTiger.de is a project of arejo Ltd.','http://www.adtiger.de/ueber-uns7/ueber-uns06/',' http://www.adtiger.de/contact/','http://www.adtiger.de/diverse-seiten/datenschutz9/','http://www.adtiger.de','"AdTiger is an established independent online marketer. Our extensive premium portfolio includes over 1,000 sites with monthly around 750 million page impressions. Thus AdTiger is one of the largest marketers. We offer our customers in addition to exclusive sites on a range of issues and channels cost RON bookings for high range. Den we market websites we offer not only fair condition models especially a safe and predictable workload."','http://cdn.betteradvertising.com/logos/adtiger.png','341');
INSERT INTO "companies" VALUES('heap','Heap','None','https://heapanalytics.com/about','Not found','https://heapanalytics.com/privacy','https://heapanalytics.com/','"Heap automatically captures every user action in your app and lets you measure it all. Clicks, taps, swipes, form submissions, page views, and more."','http://cdn.betteradvertising.com/logos/heap-logo.png','2695');
INSERT INTO "companies" VALUES('gravatar','Gravatar','None','http://en.gravatar.com/support/what-is-gravatar/','Not found','http://automattic.com/privacy/','http://en.gravatar.com/','"Your Gravatar is an image that follows you from site to site appearing beside your name when you do things like comment or post on a blog."','http://cdn.betteradvertising.com/logos/gravatar.png','2867');
INSERT INTO "companies" VALUES('mail.ru_group','Mail.Ru Group','"Mail.Ru is the foremost Russian Internet portal, serving the entertainment and communication needs of the global Russian-speaking community with a comprehensive array of more than 40 services including the largest Russian free e-mail service, instant messenger Mail.Ru Agent, national social network My Mir@Mail.Ru, and search engine Poisk@Mail.Ru."','','Not found','Not found','http://mail.ru/','"Mail.Ru is the foremost Russian Internet portal, serving the entertainment and communication needs of the global Russian-speaking community with a comprehensive array of more than 40 services including the largest Russian free e-mail service, instant messenger Mail.Ru Agent, national social network My Mir@Mail.Ru, and search engine Poisk@Mail.Ru."','http://cdn.betteradvertising.com/logos/mailru.png','1316');
INSERT INTO "companies" VALUES('magnetic','Magnetic','Magnetic provide tools for advertisers and publishers to leverage search data to target and retarget ad campaigns to the most relevant audience online.','http://www.magnetic.com/about/','http://www.magnetic.com/contact-us/','http://www.magnetic.com/about/privacy/','http://www.magnetic.com/','"Magnetic is a technology company with a marketing platform for enterprises, brands and agencies. Our prospecting, remarketing and merchandising solutions help marketers find, keep and bring back customers across channels and devices. These solutions are powered by our unique data including purchase intent and behavioral insights."','http://cdn.betteradvertising.com/logos/magnetic.png','532');
INSERT INTO "companies" VALUES('sekindo','SekiNdo','None','Not found','  http://www.sekindo.com/#contact','http://www.sekindo.com/help/privacy.php','http://www.sekindo.com/','"SekiNdo''s ad and affiliate network was established with the understanding that online advertisers, publishers, affiliates and smartphone application owners lack simple solutions for transparent and efficient advertising which achieves maximal profit. SekiNdo provides advanced technological solutions for both affiliate and ad networks markets, which form the base of the SekiNdo network."','http://cdn.betteradvertising.com/logos/sekindo1.png','2061');
INSERT INTO "companies" VALUES('teads','Teads','None','https://teads.tv/about-teads/','https://teads.tv/teads-contact/','https://teads.tv/privacy-policy/','http://teads.tv/','"A complete video SSP solution for publishers and ad networks. Create premium video inventory with our innovative video ad formats, manage your campaigns and/or monetize your video inventory through our private ad exchanges."','http://cdn.betteradvertising.com/logos/teads.png','2521');
INSERT INTO "companies" VALUES('mcafee','McAfee','McAfee is a security technology company that delivers services to protect consumers and businesses from malware and online threats. They also provide security management features that deliver real-time analytics, improve Internet security, and help businesses achieve operational efficiencies.','http://www.mcafee.com/us/about-us.aspx','https://secure.mcafee.com/apps/support/customer-service/request-form.aspx?region=us','http://www.mcafee.com/common/privacy/english/docs/mcafee-privacypolicy.pdf','http://www.mcafee.com/us/','"McAfee delivers proactive and proven solutions and services that help secure systems, networks, and mobile devices around the world, allowing users to safely connect to the Internet, browse and shop the Web more securely."','http://cdn.betteradvertising.com/logos/mcafee.png','1141');
INSERT INTO "companies" VALUES('netmining','Netmining','Netmining is a provider of display targeting solutions, including custom audience targeting, remarketing and video, that harness real-time customer intelligence to improve display performance. With an audience profiling engine that understands each individual''s interests and buying propensity, Netmining enables companies to deliver highly relevant and personalized online advertising across the entire customer lifecycle.','','http://netmining.com/lets-talk/','http://www.ignitionone.com/privacy-policy/','http://www.netmining.com/','"Netmining is a provider of display targeting solutions, including custom audience targeting, remarketing and video, that harness real-time customer intelligence to improve display performance. With an audience profiling engine that understands each individual’s interests and buying propensity, Netmining enables companies to deliver highly relevant and personalized online advertising across the entire customer lifecycle."','http://cdn.betteradvertising.com/logos/netmining.png','298');
INSERT INTO "companies" VALUES('indeed','Indeed','None','https://www.indeed.com/intl/en/ourcompany.html','Not found','https://www.indeed.com/legal#privacy','https://www.indeed.com/','"Since 2004, Indeed has given job seekers free access to millions of jobs from thousands of company websites and job boards. As the leading pay-for-performance recruitment advertising network, Indeed drives millions of targeted applicants to jobs in every field and is the most cost-effective source of candidates for thousands of companies."','http://cdn.betteradvertising.com/logos/indeed.png','2271');
INSERT INTO "companies" VALUES('adelphic','Adelphic','None','www.adelphic.com/about-us/','Not found','http://www.adelphic.com/privacy-policy/','http://www.adelphic.com/','Adelphic is a mobile and cross-device demand side platform. We provide an enterprise-ready solution for agencies, brands and other large media buyers who aim to have meaningful engagements with consumers on the move.

Our platform is fully RTB-enabled and delivers massive global reach through access to all leading inventory providers. Adelphic’s patented technology overcomes the limitations of user identification in mobile and across networked devices, yielding rich, nuanced portraits of real consumers. That gives marketers the power to deliver precise communications resulting in meaningful interaction, dialog and transactions.
','http://cdn.betteradvertising.com/logos/adelphic4.png','3878');
INSERT INTO "companies" VALUES('first_impression','First Impression','None','http://www.firstimpression.io/about.php','http://www.firstimpression.io/contact.php','https://admin.firstimpression.io/privacy-policy.php','http://www.firstimpression.io','We understand the challenges publishers and ad networks face when trying to tailor ad placements for every page and user. We founded FirstImpression in 2013 with the goal of creating a platform that offers an easy, flexible, and super-quick solution to create and manage any type of ad placement in seconds - a technology that would make online advertising easier, better for the user, and more profitable. Each of our team members brings something unique and valuable that is enabling us to accomplish this goal.','http://','3802');
INSERT INTO "companies" VALUES('cox_enterpries','Cox Enterprises','Cox Digital Solutions provides online advertising solutions that connect advertisers with engaged users, and publishers with quality brands. They offer a collection of premium inventory for national reach and local engagement. Cox Digital Solutions offers solutions for advertisers, agencies, and publishers. Cox Digital Solutions is a division of Cox Media Group.','http://www.gamut.media/who-we-are/about-us/','http://gamut.media/contact/','http://www.gamut.media/privacy-policy/','http://www.gamut.media/','Gamut serves publishers and agencies, programmatically and direct — by aligning planning, research, inventory, and execution into a single Smart Service™ offering. At Gamut, we identify areas of our client’s business ripe for automation, and insert the best programmatic solution to complement and inform their entire strategy. And when a direct plan is most effective, our account planning and operations teams use their experience and relationships to execute with optimal effectiveness. It is our goal to streamline the transaction process and make the buying and selling of digital media easier and more effective.','http://cdn.betteradvertising.com/logos/Gamut.png','6');
INSERT INTO "companies" VALUES('tagman','TagMan','TagMan is an independent, universal container tag management system.  It addresses the problems associated with site tagging and tracking of online marketing campaigns by providing universal, or server side, tag solutions. By using this single universal tag, online marketers can save time and money in the way they track campaigns and see how all online channels are working together.','http://www.tagman.com/about/','http://www.tagman.com/contact/','http://www.ensighten.com/privacy-policy/','http://www.tagman.com/','"TagMan is the global leader in Tag Management, with the industry''s most mature and proven platform for enterprise e-commerce. Since launching the first, independent Tag Management platform in 2007, TagMan has been helping over 100 customers solve tagging, site performance and attribution-related challenges."','http://cdn.betteradvertising.com/logos/tagman2.png','556');
INSERT INTO "companies" VALUES('econda','Econda','Econda solutions provides a suite of web analytics tools for use on e-commerce sites.','http://www.econda.de/econda/unternehmen/',' http://www.econda.de/econda/unternehmen/kontakt/','     http://www.econda.de/econda/unternehmen/datenschutz/','http://www.econda.de/','"High-end tracking technology coupled with intuitive operability and truly simple activation, a broad range of functions respectively customized to remarkably different business models, and a wealth of innovative features and plug-ins."','http://cdn.betteradvertising.com/logos/econda.png','603');
INSERT INTO "companies" VALUES('trbo','trbo','None','http://www.trbo.com/en/category/company/about-us/','http://www.trbo.com/en/category/contact/','http://www.trbo.com/privacy/?lang=en','http://www.trbo.com/','"trbo is an independent technology company with offices in Germany and the US. We use scientific data [analysis] to increase the user engagement in online shops – in real-time and onsite. We help online shops to boost their bottom line through increased sales, conversions and average order value."

Translated by trbo GmbH','http://cdn.betteradvertising.com/logos/trbo.png','3379');
INSERT INTO "companies" VALUES('baynote','Baynote','Baynote is a software company offering web search recommendation Software as a Service (SaaS) products. They use "Wisdom of Invisible Crowds" technology to serve a website''s audience with products and content relevant to their preferences. Baynote aggregates data on users'' behavior to guide like-minded visitors to the pages of the site that are most appropriate.','http://www.baynote.com/about-us/','http://www.baynote.com/contact-us/','http://www.baynote.com/baynote-services-privacy-policy/','http://www.baynote.com/','"Using Baynote’s patented approach, retailers are able to understand buyer intent “in the moment” across the shopping experience to deliver compelling offers, content and product recommendations that increase engagement, conversion and average order value. Baynote quickly integrates with existing websites, onsite search, chat or email systems to increase ROI without deep IT involvement or expensive system upgrades. Based in San Jose, Calif., with offices in the U.K. and Germany, Baynote’s personalization solutions are trusted by more than 300 of the world’s most well-known brands."','http://cdn.betteradvertising.com/logos/baynote1.png','24');
INSERT INTO "companies" VALUES('google','Google','Google operates an Internet search engine, offering targeted search results from billions of web pages. Results are based on a proprietary algorithm called PageRank, and advertisers deliver relevant ads targeted to search queries or Web content. The Google Network is a network of third-party customers that use Google''s ad programs to deliver relevant ads to their own sites. Google subsidiaries include YouTube and DoubleClick.','http://www.google.com/intl/en/about.html','http://www.google.com/support/websearch/bin/request.py?form_type=user&stage=fm&user_type=user&contact_type=privacy','http://www.google.com/intl/en/policies/privacy/','http://www.google.com','Google (www.google.com) operates the Google Display Network a collection of millions of websites and mobile applications that are powered by display advertising, including many Google services like YouTube.  Google also operates the DoubleClick digital advertising platform:  the ad technology foundation to create, transact, and manage digital advertising for the worlds buyers, creators, and sellers.  The DoubleClick platform includes the DoubleClick Advertising Exchange and Double Click Bid  Manager.
To learn more about how we collect and use information for online advertising, please visit http://www.google.com/intl/en/privacy.html','http://cdn.betteradvertising.com/logos/google1.png','82');
INSERT INTO "companies" VALUES('unister','Unister','"Unister Media GmbH is specialized in the marketing of online portals...Within this wide-reaching portfolio, you can book through us display advertising, newsletters and mailings integrations, performance-oriented formats as well as special implementations and integrations."',' http://www.unister.de/company/about-us/',' http://www.unister.de/#contact',' http://www.unister.de/#datenschutz','http://www.unister.de/','"Unister Media GmbH is specialized in the marketing of online portals...Within this wide-reaching portfolio, you can book through us display advertising, newsletters and mailings integrations, performance-oriented formats as well as special implementations and integrations."

Translated by Google Translate','http://cdn.betteradvertising.com/logos/unister1.png','1540');
INSERT INTO "companies" VALUES('ve_interactive','Ve Interactive','None','https://www.veinteractive.com/us/about-us/','Not found','http://www.veinteractive.com/us/about-us/legal-policies/privacy-policy/','http://www.veinteractive.com','"We optimize online merchants’ transactional capabilities and broaden their sites’ functionality through our flagship suite of award-winning software products and services, providing them with the formula for total online efficiency."','http://cdn.betteradvertising.com/logos/Ve-Interactive-company-logo.png','2587');
INSERT INTO "companies" VALUES('piano__previously_tinypass_','Piano (Previously Tinypass)','None','http://piano.io/about/','Not found','http://www.tinypass.com/privacy/','http://piano.io/','"Tinypass is a powerful e-commerce platform that helps sites charge for access to content."

Piano.io

"Our mission is to help media companies build great brands, dedicated audiences, and sustainable revenues."','http://piano.io/wp-content/themes/tinypass/img/piano-logo-blue.png','2935');
INSERT INTO "companies" VALUES('adult_webmaster_empire','Adult Webmaster Empire','','Not found','http://www.awempire.com/contact/index.php?pn=7','http://www.awempire.com/privacy-policy','http://www.awempire.com/?referral_rs=awempire','"Adult Webmaster Empire (AWE), the web''s premiere live webcam affiliate program."','http://cdn.betteradvertising.com/logos/adultwebmasterempire.png','1556');
INSERT INTO "companies" VALUES('cpmstar','CPMStar','CPMStar is an online content marketing company. It provides technology for  multiplayer games and tools for developers to create games. It enables advertisers to reach audience interested in games, music, film, sports, and community related activities; and offers online gaming content for publishers. CPMStar is owned by The Game Show Network.',' http://www.cpmstar.com/aboutUs.html','Not found','http://www.cpmstar.com/privacyPolicy.html','http://www.cpmstar.com','CPMStar is the Oldest and Largest Ad Network in the Games and Youth Oriented Entertainment space. Since 2001, CPMStar has been connecting brands and game publishers with unique content providers and the largest audience of game players globally. CPMStar is committed to bringing innovation to interactive entertainment by helping the most exciting new content on the web succeed through intelligent design, marketing, and technology. Based in Santa Monica, with office''s spread throughout the United States and Europe we are here to assist you in meeting your goals. Please feel free to reach out with any questions through our','http://cdn.betteradvertising.com/logos/cpmstar2.png','647');
INSERT INTO "companies" VALUES('psyma','Psyma','None','http://www.psyma.com/company/vision-and-promise/','Not found','http://www.psyma.com/data-protection/','http://www.psyma.com/','We are an international market research company conducting research in over 40 countries with passion and enthusiasm. We deliver tailor-made solutions for all your research needs. People and their motives in terms of market relevant behavior across cultural borders, are our focal point. Personal service, commitment, flexibility, sustainability and expertise are more important to us than just standard solutions.
Take our word for it.','http://','2950');
INSERT INTO "companies" VALUES('adobe','Adobe','Omniture provides on-demand optimization services through a suite of services that includes: SiteCatalyst, Test&Target and Genesis.  SiteCatalyst allows publishers to create audience segments. Test & Target provides advertisers with a campaign testing and optimization platform prior to deployment. Genesis provides Omniture clients with integration into third party ad servers. Omniture is an Adobe company.','http://www.adobe.com/about-adobe.html?promoid=KLXND','http://www.adobe.com/misc/privacy_inquiry.html?sendto=11','http://www.adobe.com/gr_en/privacy/marketing-cloud.html','http://www.adobe.com/marketing-cloud/web-analytics.html','Adobe Analytics is the industry-leading solution for applying real-time analytics and detailed segmentation across all of your marketing channels. Use it to discover high-value audiences and power customer intelligence for your business.','http://cdn.betteradvertising.com/logos/adobesystems.png','128');
INSERT INTO "companies" VALUES('jetlore','Jetlore','None','http://www.jetlore.com/about','http://www.jetlore.com/contact-us/','http://www.jetlore.com/privacy','http://www.jetlore.com/','','http://','4815');
INSERT INTO "companies" VALUES('maxpoint_interactive','MaxPoint Interactive','MaxPoint is an online advertising technology company that offers neighborhood level targeting to compel in-store purchase for national and local brands. The company identifies potential customers through customized consumer profiles and Digital Zip, their neighborhood-level targeting technology. This enables ad targeting to a specific location within a retailer''s trade area and campaigns to match demand for a specific product.',' http://maxpoint.com/us/digital-advertising-company','Not found','http://www.maxpointinteractive.com/privacy-policy/','http://maxpoint.com/us','"MaxPoint’s Digital Zip technology delivers the most effective and scalable neighborhood-level digital campaigns. We pinpoint qualified customers interested in purchasing your product with more precision than using traditional zip codes, ultimately offering accurate neighborhood-level targeting with national reach and local results."','http://cdn.betteradvertising.com/logos/maxpoint.png','613');
INSERT INTO "companies" VALUES('optimonk','OptiMonk','None','https://www.optimonk.com/about-us','Not found','https://www.optimonk.com/privacy_policy','https://www.optimonk.com/','"OptiMonk was started in 2014 out of necessity. We simply couldn''t find a reliable exit-intent tool for our clients. Our founder is ecommerce conversion specialist Csaba Zajdo, who has led OptiMonk to become one of the fastest growing web technology companies in Hungary.
We’re a group of passionate digital marketers dedicated to the success of our clients. We’ve created more than 3,000 ecommerce sites, including several which are now market leaders."','http://cdn.betteradvertising.com/logos/optimonk.png','4201');
INSERT INTO "companies" VALUES('hubspot','HubSpot','HubSpot offers B2B inbound marketing software. Their technology provides search engine optimization, business blogging, competitor analysis, closed-loop marketing analytics, Website editing (including keyword optimization), lead tracking and intelligence.','https://www.hubspot.com/our-story','Not found','https://legal.hubspot.com/privacy-policy','https://www.hubspot.com/','"HubSpot is an inbound marketing software company that helps businesses transform their marketing from outbound (cold calls, email spam, trade shows, tv ads, etc) lead generation to inbound lead generation."','http://cdn.betteradvertising.com/logos/hubspot2.png','86');
INSERT INTO "companies" VALUES('clicktripz','ClickTripz','None','Not found','Not found','https://www.clicktripz.com/privacy_policy.php','https://www.clicktripz.com','"ClickTripz, LLC is a full service, completely customizable “compare to / check rates” solution for travel publishers. We pride ourselves on having the most efficient and flexible solution..."','http://cdn.betteradvertising.com/logos/clicktripz.png','3110');
INSERT INTO "companies" VALUES('the_trade_desk','The Trade Desk','The Trade Desk is a buying platform for digital media. Its flagship product, The DESK, enables marketers to buy display media similarly to the way SEMs buy search. The platform provides stand alone tracking and reporting, which empowers marketers with a holistic view of the purchase funnel. The Trade Desk also enables data rights management, protecting data for marketers so they can monetize and reuse data safely without risk.','https://www.thetradedesk.com/about','https://www.thetradedesk.com/general/privacy-policy','http://www.thetradedesk.com/privacy-policy/ ','https://www.thetradedesk.com/','"The Trade Desk powers the most sophisticated buyers in advertising technology. Founded by the pioneers of real-time bidding, The Trade Desk has become the fastest growing demand-side platform in the industry by offering agencies, aggregators, and their advertisers best-in-class technology to manage display, social, mobile, and video advertising campaigns.

The Trade Desk empowers buyers at the campaign level with the most expressive bid capabilities in market, full-funnel attribution, and detailed reporting that illustrates the consumer journey from initial impression to conversion. By maintaining a pure buy-side focus, The Trade Desk delivers on branding and performance for clients worldwide."','http://cdn.betteradvertising.com/logos/thetradedesk1.png','560');
INSERT INTO "companies" VALUES('wingify','Wingify','Visual Website Optimizer is the flagship product of UK and India-based website optimization firm Wingify. Visual Website Optimizer allows for testing of multiple versions of a website as well as reporting of usage statistics and user-response data back to the website developer.','https://vwo.com/about-us/','https://vwo.com/contact-us/','https://vwo.com/privacy-policy/','https://vwo.com/','"A/B Testing Software for Marketers. Use VWO to tweak, optimize & personalize your website with minimal IT help."','http://cdn.betteradvertising.com/logos/vmo.png','276');
INSERT INTO "companies" VALUES('ero_advertising','Ero Advertising','Ero Advertising is an Amsterdam based adult pay-per-click network. They assist their clients in campaign optimization & increasing conversions for their sites.
','http://www.ero-advertising.com/en/about-us.html','http://www.ero-advertising.com/contact','Not found','http://www.ero-advertising.com/','"EroAdvertising specializes in driving growth for the world''s leading adult brands through expertise and innovation across our global ad network. Although we are a global ad network, we offer one platform, with local expertise and support." ','http://cdn.betteradvertising.com/logos/eroadvertising.png','747');
INSERT INTO "companies" VALUES('eyeview','Eyeview','Eyeview develops technology solutions that enable advertisers and agencies to create and target personalized video ads. We have both a passion for online video advertising and a vision for what it can be in the digital age. We aspire to bring the most comprehensive, advanced video advertising technology solution to the market.

Our technology enhances brand quality video ads by adding dynamic compositions that are updated and targeted in real-time. With Eyeview’s technology, advertisers provide a more personal, relevant, local and brand effective video experience','http://www.eyeviewdigital.com/about/?ev=1','http://www.eyeviewdigital.com/contact/','http://www.eyeviewdigital.com/privacy-policy/','http://www.eyeviewdigital.com/','"Eyeview is a video advertising technology company and the market leader in providing brands with ROI on their video advertising spend.
Eyeview’s VideoIQ® platform infuses consumer, brand and retail data into a results-driven decisioning engine to programmatically deliver 1-to-1 personalized video. VideoIQ provides best-in-class access to highly viewable and guaranteed fraud-free inventory across television, desktop, tablet and mobile.
Eyeview''s platform can be provided as a managed service by Eyeview’s team of analysts, video producers, and campaign experts or through a self-service interface."','http://cdn.betteradvertising.com/logos/eyeview.png','1288');
INSERT INTO "companies" VALUES('fullstory','fullstory','None','Not found','Not found','https://www.fullstory.com/legal/privacy/','http://fullstory.com','Understand your customers like never before with FullStory
Make users happier by going beyond analytics to actionable insights.','http://cdn.betteradvertising.com/logos/fullsstory.png','4100');
INSERT INTO "companies" VALUES('appnexus','AppNexus','AppNexus operates an online advertising exchange. Their core technology platform enables ad networks and agencies real-time media buying capabilities and a gateway to multiple inventory aggregators.  Their platform is supported by cloud computing technology.','http://www.appnexus.com/about-appnexus','https://www.appnexus.com/en/company/privacy-form','https://www.appnexus.com/en/company/platform-privacy-policy','https://www.appnexus.com/en','AppNexus is a technology company whose cloud-based software platform powers and optimizes the programmatic sale and purchase of digital advertising.  Because our platform is open, customers are able to build and differentiate their technology on top of ours, making AppNexus the infrastructure through which a substantial portion of the world’s internet advertising flows.
As an independent, pure-technology provider, we are fully aligned with our customers’ interests.  Our core mission is to help our customers deliver the right ads at the right time to the right audience. ','http://cdn.betteradvertising.com/logos/AppNexus.png','17');
INSERT INTO "companies" VALUES('aloodo','Aloodo','None','Not found','Not found','http://www.aloodo.org/privacy/','http://www.aloodo.org','ONE SOLUTION FOR AD BLOCKING AND AD FRAUD

Trying to fight ad blocking alone creates incentives for fraud.
Add-on fraud fixes can provoke increased ad blocking.
Leave the fraud-prone, forgettable race to the bottom behind—with a tracking protection solution.','http://','3808');
INSERT INTO "companies" VALUES('traffichaus','TrafficHaus','','https://www.traffichaus.com/index.php#clients','https://www.traffichaus.com/index.php#contact','https://www.traffichaus.com/privacy-policy.php','https://www.traffichaus.com','"Advertisers target your audience...Publishers generate more revenue."','http://cdn.betteradvertising.com/logos/traffichaus1.png','1852');
INSERT INTO "companies" VALUES('freshdesk','Freshdesk','','https://freshdesk.com/company/about','Not found','https://freshdesk.com/privacy','https://freshdesk.com/','"Freshdesk is a web based customer support platform...with email to ticket conversion, self-service portal, knowledge base, multi product support, SLAs and a host of other impressive features."','http://cdn.betteradvertising.com/logos/freshdesk2.png','1866');
INSERT INTO "companies" VALUES('drawbridge','Drawbridge','Adsymptotic provides mobile advertising technology and cross-device data from desktop to mobile. The company''s proprietary technology drives ad serving decisions using cross-device audience behavioral signals, improving the likelihood of finding the right people, on the right device.
','https://drawbridge.com/about-us','https://drawbridge.com/contact-us ','http://drawbridge.com/privacy',' https://drawbridge.com/','"Today, active consumers interact on both desktop and mobile devices. Drawbridge''s platform allows advertisers to reach the right audience at the right time — on the right device."','http://cdn.betteradvertising.com/logos/drawbridge1.png','1175');
INSERT INTO "companies" VALUES('adskeeper','Adskeeper','None','Not found','http://adskeeper.co.uk/','Not found','http://adskeeper.co.uk/','"Adskeeper provides innovative solutions to increase revenue for Internet publishers... Our intelligent digital ad platform works on the real-time bidding principle, where the impact of your adverts depends on the bid you set per click."','http://cdn.betteradvertising.com/logos/adskeeper.png','2650');
INSERT INTO "companies" VALUES('apple','Apple','Apple is an American multinational corporation that designs and markets consumer electronics, computer software, and personal computers. iAd is their mobile ad network.','http://www.apple.com/about/','http://www.apple.com/contact','http://www.apple.com/privacy/privacy-policy/','http://www.apple.com/','Apple designs Macs along with Mac OS X, iLife, iWork, and professional software.','http://cdn.betteradvertising.com/logos/apple.png','390');
INSERT INTO "companies" VALUES('sharethis','ShareThis','ShareThis provides content syndication services to publishers, allowing users to share content across the web through their widget.','http://www.sharethis.com/about.html','http://www.sharethis.com/contact.html','http://www.sharethis.com/pri.html','http://sharethis.com/','"A pioneer in the industry, ShareThis believes the desire to share is rooted deep within human beings, reflecting passions, wants and lifestyles that are constantly fluctuating throughout the day, week and month. By identifying these human sentiments, ShareThis gains a better understanding of people, thus empowering a more personal and relevant internet experience. Due to the dynamic nature of humans, ShareThis recognizes the value of real time for publishers, advertisers or any data-driven business and has built a social data platform designed to process actual first-party data in actual real time.
The ShareThis consumer engagement and sharing tools are used by three million publishers to drive engagement, traffic and personalization, capturing the widest and deepest sentiments of people across the internet. These sentiments flow into the ShareThis platform as terabytes of data that are processed daily to better understand people, making social data actionable for any business that requires a holistic view of people or customers. This understanding powers the ShareThis Real-Time Marketing (RTM) Engine, which targets constantly changing audience interests based on first-party sharing data and caters to their most relevant and recent affinities. RTM is the solution of choice for some of the world''s largest brands to activate audiences across all screens and digital ad formats."
','http://cdn.betteradvertising.com/logos/Sharethis.png','149');
INSERT INTO "companies" VALUES('zencoder','Zencoder','None','Not found','https://zencoder.com/en/sales','https://zencoder.com/en/privacy','https://zencoder.com/en/','Zencoder is a cloud-based video and audio encoding product suite from Brightcove (NASDAQ: BCOV), a leading global provider of cloud content services. The Zencoder service provides customers with high quality, reliable encoding of live and on-demand video and access to unlimited video encoding power without having to pay for, manage and scale expensive hardware and software. ','http://www.apmetrix.com/wp-content/uploads/2015/06/Brightcove-Zencoder-Web-Logo-150.jpg','4475');
INSERT INTO "companies" VALUES('simpli.fi','Simpli.fi','Simpli.fi is a search focused demand-side platform that help search marketers take advantage of display RTB (real-time bidding). Their clients can target banners ads based on key words users have searched. Their data management technology allows for unique storage and targeting of individuals search terms for each user. Their specialized focus is search marketing.','http://www.simpli.fi/about-us','Not found','https://www.simpli.fi/site-privacy-policy2/','http://www.simpli.fi/','"Simpli.fi is the global demand side platform (DSP) at the intersection of search and display. Its keyword-based platform brings the efficiency of search together with the reach and brand impact of display, allowing marketers to act on individual intent data." ','http://cdn.betteradvertising.com/logos/simplifi1.png','550');
INSERT INTO "companies" VALUES('admans','Admans','None','http://admans.de/de.html','Not found','http://www.admans.de/datenschutz/','http://admans.de/de.html','Die AdManS GmbH wurde 2014 gegründet und hat ihren Hauptsitz in München.

Kundenservice ist bei uns nicht einfach eine Floskel. Die Qualität unseres Service & die damit verbundene Zufriedenheit sehen wir durch unsere langfristigen Geschäftsbeziehungen bestätigt.

Kontaktieren Sie uns jederzeit für eine unverbindliche Beratung oder ein Angebot.

Auch wenn Sie eine neue berufliche Herausforderung im Online Marketing suchen freuen wir uns auf Ihre Nachricht.','http://cdn.betteradvertising.com/logos/logo_admans.png','4347');
INSERT INTO "companies" VALUES('microsoft','Microsoft',NULL,NULL,NULL,'https://privacy.microsoft.com/en-us/privacystatement/',NULL,NULL,'http://cdn.betteradvertising.com/logos/microsoftadvertising.png',NULL);
INSERT INTO "companies" VALUES('comscore','ComScore',NULL,'https://www.comscore.com/About-comScore',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "companies" VALUES('neustar','Neustar ','','https://www.neustar.biz/about-us','Not found','https://www.neustar.biz/privacy/privacy_policy','http://www.neustar.biz/marketing-solutions#.U-kEJZSwJTM','"Much More than Just a Digital Data Management Platform
PlatformOne works across offline and digital channels to provide you with access to the most current and validated information about your customer and high-value prospects.
Powered by the Right Approach to Identity
At the heart of PlatformOne is Neustar’s Authoritative Identity responsible for collecting, corroborating, and validating consumer and business identity for marketing purposes, delivering:
Scale—Our methodology uses a combination of robust techniques to link verified offline data, including wireless data, to an identity foundation based on 220 million adults and 120 million households.
Depth—Our customer identities are further augmented and linked with more than 15,000 offline and online predictive attributes from third-party data sources across various industries.
Accuracy—Most importantly, we continuously corroborate our identity data with billions of anonymized daily transactions. This ensures that our identity data keeps up with consumer trends and provides the freshest audience information.
Privacy—We accomplish all of this with the utmost attention to identity privacy; at the core of our methodology is privacy-by-design.
A Holistic Approach to 21st Century Marketing
Fuel your strategic marketing planning with accurate customer, geographic, and market data
Discover the most up-to-date information about your customers and high-value prospects
Activate your high-performing audiences into your ecosystem of media partners
Integrate your marketing programs to optimize their mix and maximize your marketing effectiveness"
','http://cdn.betteradvertising.com/logos/neustar.png','307');
INSERT INTO "companies" VALUES('oracle','Oracle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "companies" VALUES('rtl_group','RTL Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "companies" VALUES('axel_springer','Axel Springer Group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "companies" VALUES('telenor','Telenor Group',NULL,NULL,NULL,NULL,'https://www.telenor.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('acxiom','Acxiom',NULL,NULL,NULL,NULL,'https://www.acxiom.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('gruner_jahr_ag','Gruner + Jahr AG',NULL,NULL,NULL,NULL,'https://www.guj.de/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('united_internet','United Internet AG',NULL,NULL,NULL,NULL,'https://www.united-internet.de/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('kbm_group','KBM Group',NULL,NULL,NULL,NULL,'https://www.kbmg.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('emarsys','Emarsys',NULL,NULL,NULL,NULL,'https://www.emarsys.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('iac_apps','IAC (InterActiveCorp)',NULL,'',NULL,NULL,'http://iac.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('optimise_it','Optimise-it',NULL,NULL,NULL,NULL,'http://www.optimise-it.de/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('dentsu_aegis_network','Dentsu Aegis Network',NULL,NULL,NULL,NULL,'http://www.dentsuaegisnetwork.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('lightInthebox','LightInTheBox.com',NULL,NULL,NULL,NULL,'http://www.lightinthebox.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('ve','Ve Global',NULL,NULL,NULL,NULL,'https://www.ve.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('js_foundation','JS Foundation',NULL,NULL,NULL,NULL,'https://js.foundation/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('activision_blizzard','Activision Blizzard',NULL,NULL,NULL,NULL,'https://www.activision.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('distil_networks','distil networks',NULL,NULL,NULL,NULL,'https://www.distilnetworks.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('rhythmone','RhythmOne',NULL,NULL,NULL,NULL,'https://www.rhythmone.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('ip_de','IP Deutschland',NULL,NULL,NULL,NULL,'http://www.ip.de/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('actu_cci','ACTU/CCI',NULL,NULL,NULL,NULL,'http://actu-cci.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('big_wall_vision','Big Wall Vision',NULL,NULL,NULL,NULL,'http://www.bigwallvision.fr/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('system1','System1',NULL,NULL,NULL,NULL,'http://system1.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('synatix','Synatix',NULL,NULL,NULL,NULL,'https://www.synatix.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('parship','Parship',NULL,NULL,NULL,NULL,'https://www.parship.de/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('comcast','Comcast',NULL,NULL,NULL,NULL,'http://corporate.comcast.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('samsung','Samsung',NULL,NULL,NULL,NULL,'http://www.samsung.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('alibaba','Alibaba',NULL,NULL,NULL,NULL,'http://www.alibaba.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('millward_brown','Millward Brown',NULL,NULL,NULL,NULL,'https://www.millwardbrowndigital.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('daconsortium','D.A.Consortium',NULL,NULL,NULL,NULL,'http://www.dac.co.jp/english/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('xcaliber','XCaliber',NULL,NULL,NULL,NULL,'https://www.xcaliber.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('ttnet','Türk Telekom',NULL,NULL,NULL,NULL,'http://www.ttnet.com.tr/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('zoho_corp','Zoho Corporation',NULL,NULL,NULL,NULL,'https://www.zohocorp.com/index.html',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('fifth_story','Fifth Story',NULL,NULL,NULL,NULL,'https://fifthstory.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('advertise.com','Advertise.com',NULL,NULL,NULL,NULL,'http://www.advertise.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('sien','SIEN',NULL,NULL,NULL,NULL,'http://www.sien.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('akamai','Akamai Technologies',NULL,NULL,NULL,NULL,'https://www.akamai.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('harris_ia','Harris Insights & Analytics',NULL,NULL,NULL,NULL,'http://www.theharrispoll.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('apn_news_media','APN News and Media Ltd',NULL,NULL,NULL,NULL,'http://www.apn.com.au/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('engine_group','Engine',NULL,NULL,NULL,NULL,'http://www.enginegroup.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('highco','HighCo',NULL,NULL,NULL,NULL,'https://www.highco.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('united_inc','United Inc.',NULL,NULL,NULL,NULL,'http://united.jp/en/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('ironsource','ironSource',NULL,NULL,NULL,NULL,'www.ironsrc.com',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('prosieben_sat1','ProSiebenSat.1 Media',NULL,NULL,NULL,NULL,'http://www.prosiebensat1.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('verizon','Verizon',NULL,NULL,NULL,NULL,'https://www.verizon.com/',NULL,NULL,NULL);
INSERT INTO "companies" VALUES('spearhead','Spearhead Integrated Marketing Communication',NULL,NULL,NULL,NULL,'http://www.spearhead.com.cn/',NULL,NULL,NULL);
CREATE TABLE tracker_domains(
    tracker TEXT NOT NULL,
    domain TEXT UNIQUE NOT NULL,
    FOREIGN KEY(tracker) REFERENCES trackers(id)
);
INSERT INTO "tracker_domains" VALUES('google_analytics','google-analytics.com');
INSERT INTO "tracker_domains" VALUES('doubleclick','2mdn.net');
INSERT INTO "tracker_domains" VALUES('doubleclick','invitemedia.com');
INSERT INTO "tracker_domains" VALUES('doubleclick','doubleclick.net');
INSERT INTO "tracker_domains" VALUES('google_photos','ggpht.com');
INSERT INTO "tracker_domains" VALUES('google','google.nl');
INSERT INTO "tracker_domains" VALUES('google','google.it');
INSERT INTO "tracker_domains" VALUES('google','google.be');
INSERT INTO "tracker_domains" VALUES('google','google.co.uk');
INSERT INTO "tracker_domains" VALUES('google','google.es');
INSERT INTO "tracker_domains" VALUES('google','google.de');
INSERT INTO "tracker_domains" VALUES('google','google.pl');
INSERT INTO "tracker_domains" VALUES('google','google.ch');
INSERT INTO "tracker_domains" VALUES('google','google.gr');
INSERT INTO "tracker_domains" VALUES('google','google.at');
INSERT INTO "tracker_domains" VALUES('google_appspot','appspot.com');
INSERT INTO "tracker_domains" VALUES('google','google.com.br');
INSERT INTO "tracker_domains" VALUES('google','google.com');
INSERT INTO "tracker_domains" VALUES('google','google.co.th');
INSERT INTO "tracker_domains" VALUES('google','google.co.ma');
INSERT INTO "tracker_domains" VALUES('google','google.fr');
INSERT INTO "tracker_domains" VALUES('google','google.dz');
INSERT INTO "tracker_domains" VALUES('google','google.ca');
INSERT INTO "tracker_domains" VALUES('googleapis.com','googleapis.com');
INSERT INTO "tracker_domains" VALUES('google_users','gstatic.com');
INSERT INTO "tracker_domains" VALUES('google_tag_manager','googletagmanager.com');
INSERT INTO "tracker_domains" VALUES('google_tag_manager','googletagservices.com');
INSERT INTO "tracker_domains" VALUES('facebook','facebook.net');
INSERT INTO "tracker_domains" VALUES('facebook','atlassbx.com');
INSERT INTO "tracker_domains" VALUES('facebook','facebook.com');
INSERT INTO "tracker_domains" VALUES('facebook','fbcdn.net');
INSERT INTO "tracker_domains" VALUES('infonline','ivwbox.de');
INSERT INTO "tracker_domains" VALUES('infonline','ioam.de');
INSERT INTO "tracker_domains" VALUES('google_adservices','adsensecustomsearchads.com');
INSERT INTO "tracker_domains" VALUES('google_adservices','googleadservices.com');
INSERT INTO "tracker_domains" VALUES('google_syndication','googlesyndication.com');
INSERT INTO "tracker_domains" VALUES('amazon_cloudfront','cloudfront.net');
INSERT INTO "tracker_domains" VALUES('amazon_web_services','amazonaws.com');
INSERT INTO "tracker_domains" VALUES('criteo','criteo.com');
INSERT INTO "tracker_domains" VALUES('criteo','criteo.net');
INSERT INTO "tracker_domains" VALUES('appnexus','adnxs.com');
INSERT INTO "tracker_domains" VALUES('appnexus','adnxs.net');
INSERT INTO "tracker_domains" VALUES('adition','adition.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.jp');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.de');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.ca');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.co.uk');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.fr');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.ca');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.es');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.co.jp');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.de');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon-adsystem.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.co.uk');
INSERT INTO "tracker_domains" VALUES('amazon_associates','assoc-amazon.fr');
INSERT INTO "tracker_domains" VALUES('amazon_associates','amazon.it');
INSERT INTO "tracker_domains" VALUES('ebay','ebayclassifiedsgroup.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebayrtm.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebaydesc.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebayimg.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebaystatic.com');
INSERT INTO "tracker_domains" VALUES('adform','adformdsp.net');
INSERT INTO "tracker_domains" VALUES('adform','adform.net');
INSERT INTO "tracker_domains" VALUES('scorecard_research_beacon','scoreresearch.com');
INSERT INTO "tracker_domains" VALUES('scorecard_research_beacon','scrsrch.com');
INSERT INTO "tracker_domains" VALUES('scorecard_research_beacon','securestudies.com');
INSERT INTO "tracker_domains" VALUES('scorecard_research_beacon','scorecardresearch.com');
INSERT INTO "tracker_domains" VALUES('scorecard_research_beacon','comscore.com');
INSERT INTO "tracker_domains" VALUES('optimizely','optimizely.com');
INSERT INTO "tracker_domains" VALUES('twitter','twitter.com');
INSERT INTO "tracker_domains" VALUES('kaspersky-labs.com','kaspersky-labs.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','media-amazon.com');
INSERT INTO "tracker_domains" VALUES('amazon_associates','ssl-images-amazon.com');
INSERT INTO "tracker_domains" VALUES('bing_ads','bing.com');
INSERT INTO "tracker_domains" VALUES('msn','ads.msn.com');
INSERT INTO "tracker_domains" VALUES('msn','ads1.msn.com');
INSERT INTO "tracker_domains" VALUES('msn','bat.r.msn.com');
INSERT INTO "tracker_domains" VALUES('msn','adsyndication.msn.com');
INSERT INTO "tracker_domains" VALUES('msn','flex.msn.com');
INSERT INTO "tracker_domains" VALUES('openx','servedbyopenx.com');
INSERT INTO "tracker_domains" VALUES('openx','odnxs.net');
INSERT INTO "tracker_domains" VALUES('openx','openx.org');
INSERT INTO "tracker_domains" VALUES('openx','openx.net');
INSERT INTO "tracker_domains" VALUES('openx','openxenterprise.com');
INSERT INTO "tracker_domains" VALUES('youtube','ytimg.com');
INSERT INTO "tracker_domains" VALUES('youtube','youtube-nocookie.com');
INSERT INTO "tracker_domains" VALUES('youtube','youtube.com');
INSERT INTO "tracker_domains" VALUES('youtube','googlevideo.com');
INSERT INTO "tracker_domains" VALUES('the_adex','theadex.com');
INSERT INTO "tracker_domains" VALUES('yieldlab','yieldlab.net');
INSERT INTO "tracker_domains" VALUES('rubicon','dpclk.com');
INSERT INTO "tracker_domains" VALUES('rubicon','mobsmith.com');
INSERT INTO "tracker_domains" VALUES('rubicon','nearbyad.com');
INSERT INTO "tracker_domains" VALUES('rubicon','rubiconproject.com');
INSERT INTO "tracker_domains" VALUES('nugg.ad','nuggad.net');
INSERT INTO "tracker_domains" VALUES('tradedesk','adsrvr.org');
INSERT INTO "tracker_domains" VALUES('tealium','llnwd.net');
INSERT INTO "tracker_domains" VALUES('tealium','tealiumiq.com');
INSERT INTO "tracker_domains" VALUES('tealium','tealium.com');
INSERT INTO "tracker_domains" VALUES('tealium','tiqcdn.com');
INSERT INTO "tracker_domains" VALUES('adobe_audience_manager','everestjs.net');
INSERT INTO "tracker_domains" VALUES('adobe_audience_manager','demdex.net');
INSERT INTO "tracker_domains" VALUES('adobe_audience_manager','everesttech.net');
INSERT INTO "tracker_domains" VALUES('pubmatic','pubmatic.com');
INSERT INTO "tracker_domains" VALUES('index_exchange_','casalemedia.com');
INSERT INTO "tracker_domains" VALUES('new_relic','d1ros97qkrwjf5.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('new_relic','nr-data.net');
INSERT INTO "tracker_domains" VALUES('new_relic','newrelic.com');
INSERT INTO "tracker_domains" VALUES('addthis','addthiscdn.com');
INSERT INTO "tracker_domains" VALUES('addthis','addthis.com');
INSERT INTO "tracker_domains" VALUES('addthis','addthisedge.com');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','akamai.net');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','akamaihd.net');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','edgesuite.net');
INSERT INTO "tracker_domains" VALUES('mediamath','mathads.com');
INSERT INTO "tracker_domains" VALUES('mediamath','mathtag.com');
INSERT INTO "tracker_domains" VALUES('xplosion','xplosion.de');
INSERT INTO "tracker_domains" VALUES('meetrics','meetrics.net');
INSERT INTO "tracker_domains" VALUES('meetrics','de.com');
INSERT INTO "tracker_domains" VALUES('meetrics','mxcdn.net');
INSERT INTO "tracker_domains" VALUES('media_innovation_group','mookie1.com');
INSERT INTO "tracker_domains" VALUES('bluekai','bkrtx.com');
INSERT INTO "tracker_domains" VALUES('bluekai','bluekai.com');
INSERT INTO "tracker_domains" VALUES('exactag','exactag.com');
INSERT INTO "tracker_domains" VALUES('google_users','googleusercontent.com');
INSERT INTO "tracker_domains" VALUES('adomik','adomik.com');
INSERT INTO "tracker_domains" VALUES('bidswitch','bidswitch.net');
INSERT INTO "tracker_domains" VALUES('adobe_dynamic_tag_management','adobedtm.com');
INSERT INTO "tracker_domains" VALUES('united_internet_media_gmbh','uimserv.net');
INSERT INTO "tracker_domains" VALUES('united_internet_media_gmbh','ui-portal.de');
INSERT INTO "tracker_domains" VALUES('united_internet_media_gmbh','tifbs.net');
INSERT INTO "tracker_domains" VALUES('emetriq','emetriq.de');
INSERT INTO "tracker_domains" VALUES('adtech','adtech.de');
INSERT INTO "tracker_domains" VALUES('adtech','adtechus.com');
INSERT INTO "tracker_domains" VALUES('outbrain','outbrain.com');
INSERT INTO "tracker_domains" VALUES('hotjar','hotjar.com');
INSERT INTO "tracker_domains" VALUES('atlas','adbureau.net');
INSERT INTO "tracker_domains" VALUES('atlas','atdmt.com');
INSERT INTO "tracker_domains" VALUES('at_internet','xiti.com');
INSERT INTO "tracker_domains" VALUES('at_internet','ati-host.net');
INSERT INTO "tracker_domains" VALUES('aggregate_knowledge','agkn.com');
INSERT INTO "tracker_domains" VALUES('yahoo','tumblr.com');
INSERT INTO "tracker_domains" VALUES('yahoo','yahoo.com');
INSERT INTO "tracker_domains" VALUES('trusted_shops','trustedshops.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebay.com');
INSERT INTO "tracker_domains" VALUES('taboola','taboola.com');
INSERT INTO "tracker_domains" VALUES('taboola','taboolasyndication.com');
INSERT INTO "tracker_domains" VALUES('smart_adserver','sascdn.com');
INSERT INTO "tracker_domains" VALUES('smart_adserver','smartadserver.com');
INSERT INTO "tracker_domains" VALUES('smart_adserver','yoc-adserver.com');
INSERT INTO "tracker_domains" VALUES('smart_adserver','styria-digital.com');
INSERT INTO "tracker_domains" VALUES('quantcast','quantcast.com');
INSERT INTO "tracker_domains" VALUES('quantcast','quantserve.com');
INSERT INTO "tracker_domains" VALUES('adality_gmbh','adrtx.net');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','imageg.net');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','freedom.com');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','du8783wkf05yr.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','hitbox.com');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','reedbusiness.net');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','omtrdc.net');
INSERT INTO "tracker_domains" VALUES('omniture__adobe_analytics_','2o7.net');
INSERT INTO "tracker_domains" VALUES('yandex','yandex.ru');
INSERT INTO "tracker_domains" VALUES('yandex','yandex.net');
INSERT INTO "tracker_domains" VALUES('contact_impact','df-srv.de');
INSERT INTO "tracker_domains" VALUES('mbr_targeting','m6r.eu');
INSERT INTO "tracker_domains" VALUES('krux_digital','krxd.net');
INSERT INTO "tracker_domains" VALUES('pinterest','pinimg.com');
INSERT INTO "tracker_domains" VALUES('pinterest','pinterest.com');
INSERT INTO "tracker_domains" VALUES('pinterest','d3io1k5o0zdpqr.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('adscale','adscale.de');
INSERT INTO "tracker_domains" VALUES('ebay','ebay.de');
INSERT INTO "tracker_domains" VALUES('moat','moatpixel.com');
INSERT INTO "tracker_domains" VALUES('moat','moatads.com');
INSERT INTO "tracker_domains" VALUES('sizmek','serving-sys.com');
INSERT INTO "tracker_domains" VALUES('ligatus','ligatus.com');
INSERT INTO "tracker_domains" VALUES('ligatus','ligatus.de');
INSERT INTO "tracker_domains" VALUES('ligatus','ligadx.com');
INSERT INTO "tracker_domains" VALUES('webtrekk','webtrekk.net');
INSERT INTO "tracker_domains" VALUES('webtrekk','wt-safetag.com');
INSERT INTO "tracker_domains" VALUES('webtrekk','webtrekk-asia.net');
INSERT INTO "tracker_domains" VALUES('chartbeat','chartbeat.net');
INSERT INTO "tracker_domains" VALUES('chartbeat','chartbeat.com');
INSERT INTO "tracker_domains" VALUES('turn_inc.','turn.com');
INSERT INTO "tracker_domains" VALUES('paypal','paypal.com');
INSERT INTO "tracker_domains" VALUES('tapad','tapad.com');
INSERT INTO "tracker_domains" VALUES('contact_impact','adrolays.de');
INSERT INTO "tracker_domains" VALUES('exoclick','exoclick.com');
INSERT INTO "tracker_domains" VALUES('liveramp','rlcdn.com');
INSERT INTO "tracker_domains" VALUES('liveramp','rapleaf.com');
INSERT INTO "tracker_domains" VALUES('advertising.com','advertising.com');
INSERT INTO "tracker_domains" VALUES('advertising.com','aol.com');
INSERT INTO "tracker_domains" VALUES('advertising.com','pictela.net');
INSERT INTO "tracker_domains" VALUES('advertising.com','adsdk.com');
INSERT INTO "tracker_domains" VALUES('advertising.com','atwola.com');
INSERT INTO "tracker_domains" VALUES('xhamster','xhcdn.com');
INSERT INTO "tracker_domains" VALUES('plista','plista.com');
INSERT INTO "tracker_domains" VALUES('twitter','twimg.com');
INSERT INTO "tracker_domains" VALUES('netratings_sitecensus','imrworldwide.com');
INSERT INTO "tracker_domains" VALUES('netratings_sitecensus','glanceguide.com');
INSERT INTO "tracker_domains" VALUES('netratings_sitecensus','vizu.com');
INSERT INTO "tracker_domains" VALUES('visual_website_optimizer','visualwebsiteoptimizer.com');
INSERT INTO "tracker_domains" VALUES('visual_website_optimizer','wingify.com');
INSERT INTO "tracker_domains" VALUES('visual_website_optimizer','d5phz18u4wuww.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('vg_wort','vgwort.de');
INSERT INTO "tracker_domains" VALUES('buysellads','maxymiser.net');
INSERT INTO "tracker_domains" VALUES('buysellads','buysellads.com');
INSERT INTO "tracker_domains" VALUES('traffic_stars','trafficstars.com');
INSERT INTO "tracker_domains" VALUES('traffic_stars','tsyndicate.com');
INSERT INTO "tracker_domains" VALUES('brightroll','btrll.com');
INSERT INTO "tracker_domains" VALUES('rocket_fuel','rfihub.net');
INSERT INTO "tracker_domains" VALUES('rocket_fuel','rfihub.com');
INSERT INTO "tracker_domains" VALUES('gravatar','gravatar.com');
INSERT INTO "tracker_domains" VALUES('zanox','zanox-affiliate.de');
INSERT INTO "tracker_domains" VALUES('zanox','zanox.com');
INSERT INTO "tracker_domains" VALUES('roq.ad','rqtrk.eu');
INSERT INTO "tracker_domains" VALUES('pornhub','phncdn.com');
INSERT INTO "tracker_domains" VALUES('drawbridge','adsymptotic.com');
INSERT INTO "tracker_domains" VALUES('wikimedia.org','wikimedia.org');
INSERT INTO "tracker_domains" VALUES('crazy_egg','dnn506yrbagrg.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('crazy_egg','crazyegg.com');
INSERT INTO "tracker_domains" VALUES('crazy_egg','cetrk.com');
INSERT INTO "tracker_domains" VALUES('conversant','fastclick.net');
INSERT INTO "tracker_domains" VALUES('conversant','mplxtms.com');
INSERT INTO "tracker_domains" VALUES('conversant','mediaplex.com');
INSERT INTO "tracker_domains" VALUES('integral_ad_science','adsafeprotected.com');
INSERT INTO "tracker_domains" VALUES('econda','econda-monitor.de');
INSERT INTO "tracker_domains" VALUES('twiago','twiago.com');
INSERT INTO "tracker_domains" VALUES('trafficjunky','trafficjunky.net');
INSERT INTO "tracker_domains" VALUES('dotomi','dtmpub.com');
INSERT INTO "tracker_domains" VALUES('dotomi','dtmc.com');
INSERT INTO "tracker_domains" VALUES('dotomi','dotomi.com');
INSERT INTO "tracker_domains" VALUES('jw_player','jwpcdn.com');
INSERT INTO "tracker_domains" VALUES('jw_player','jwpsrv.com');
INSERT INTO "tracker_domains" VALUES('jw_player','d21rhj7n383afu.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('paypal','paypalobjects.com');
INSERT INTO "tracker_domains" VALUES('affilinet','banner-rotation.com');
INSERT INTO "tracker_domains" VALUES('affilinet','webmasterplan.com');
INSERT INTO "tracker_domains" VALUES('etracker','etracker.com');
INSERT INTO "tracker_domains" VALUES('etracker','sedotracker.com');
INSERT INTO "tracker_domains" VALUES('etracker','etracker.de');
INSERT INTO "tracker_domains" VALUES('lotame','crwdcntrl.net');
INSERT INTO "tracker_domains" VALUES('juggcash','contentabc.com');
INSERT INTO "tracker_domains" VALUES('juggcash','mofos.com');
INSERT INTO "tracker_domains" VALUES('liquidm_technology_gmbh','lqm.io');
INSERT INTO "tracker_domains" VALUES('liquidm_technology_gmbh','lqmcdn.com');
INSERT INTO "tracker_domains" VALUES('eyeota','eyeota.net');
INSERT INTO "tracker_domains" VALUES('webtrekk','wt-eu02.net');
INSERT INTO "tracker_domains" VALUES('webtrekk','wbtrk.net');
INSERT INTO "tracker_domains" VALUES('webtrekk','webtrekk.com');
INSERT INTO "tracker_domains" VALUES('polar','fastly.net');
INSERT INTO "tracker_domains" VALUES('yahoo','interclick.com');
INSERT INTO "tracker_domains" VALUES('yahoo','yimg.com');
INSERT INTO "tracker_domains" VALUES('yahoo_japan','yjtag.jp');
INSERT INTO "tracker_domains" VALUES('indeed','indeed.com');
INSERT INTO "tracker_domains" VALUES('exoclick','exosrv.com');
INSERT INTO "tracker_domains" VALUES('linkedin','linkedin.com');
INSERT INTO "tracker_domains" VALUES('sevenone_media','71i.de');
INSERT INTO "tracker_domains" VALUES('browser_update','browser-update.org');
INSERT INTO "tracker_domains" VALUES('intelliad','intelliad.de');
INSERT INTO "tracker_domains" VALUES('intelliad','intelliad.com');
INSERT INTO "tracker_domains" VALUES('wordpress_stats','wp.com');
INSERT INTO "tracker_domains" VALUES('wordpress_stats','wordpress.com');
INSERT INTO "tracker_domains" VALUES('spotxchange','spotxcdn.com');
INSERT INTO "tracker_domains" VALUES('spotxchange','spotxchange.com');
INSERT INTO "tracker_domains" VALUES('spotxchange','spotx.tv');
INSERT INTO "tracker_domains" VALUES('dataxu','w55c.net');
INSERT INTO "tracker_domains" VALUES('liveinternet','yadro.ru');
INSERT INTO "tracker_domains" VALUES('visual_revenue','visualrevenue.com');
INSERT INTO "tracker_domains" VALUES('stroer_digital_media','stroeerdigitalmedia.de');
INSERT INTO "tracker_domains" VALUES('owa','oewabox.at');
INSERT INTO "tracker_domains" VALUES('live_intent','liadm.com');
INSERT INTO "tracker_domains" VALUES('flashtalking','flashtalking.com');
INSERT INTO "tracker_domains" VALUES('alexa_metrics','d31qbv1cthcecs.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('alexa_metrics','d5nxst8fruw4z.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('jw_player','jwpltx.com');
INSERT INTO "tracker_domains" VALUES('heatmap','heatmap.it');
INSERT INTO "tracker_domains" VALUES('mouseflow','mouseflow.com');
INSERT INTO "tracker_domains" VALUES('quantcount','quantcount.com');
INSERT INTO "tracker_domains" VALUES('digital_analytix','nedstat.com');
INSERT INTO "tracker_domains" VALUES('digital_analytix','sitestat.com');
INSERT INTO "tracker_domains" VALUES('loggly','loggly.com');
INSERT INTO "tracker_domains" VALUES('improve_digital','360yield.com');
INSERT INTO "tracker_domains" VALUES('doublepimp','redcourtside.com');
INSERT INTO "tracker_domains" VALUES('doublepimp','doublepimp.com');
INSERT INTO "tracker_domains" VALUES('doublepimp','doublepimpssl.com');
INSERT INTO "tracker_domains" VALUES('doublepimp','zerezas.com');
INSERT INTO "tracker_domains" VALUES('doublepimp','xeontopa.com');
INSERT INTO "tracker_domains" VALUES('pulsepoint','contextweb.com');
INSERT INTO "tracker_domains" VALUES('1plusx','opecloud.com');
INSERT INTO "tracker_domains" VALUES('v12_group','v12group.com');
INSERT INTO "tracker_domains" VALUES('audience_science','wunderloop.net');
INSERT INTO "tracker_domains" VALUES('audience_science','revsci.net');
INSERT INTO "tracker_domains" VALUES('audience_science','targetingmarketplace.com');
INSERT INTO "tracker_domains" VALUES('webtrends','webtrends.com');
INSERT INTO "tracker_domains" VALUES('webtrends','webtrendslive.com');
INSERT INTO "tracker_domains" VALUES('google_trusted_stores','googlecommerce.com');
INSERT INTO "tracker_domains" VALUES('m._p._newmedia','mpnrs.com');
INSERT INTO "tracker_domains" VALUES('parsely','d1z2jf7jlzjs58.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('parsely','parsely.com');
INSERT INTO "tracker_domains" VALUES('highwinds','hwcdn.net');
INSERT INTO "tracker_domains" VALUES('typekit_by_adobe','typekit.com');
INSERT INTO "tracker_domains" VALUES('typekit_by_adobe','typekit.net');
INSERT INTO "tracker_domains" VALUES('linkpulse','lp4.io');
INSERT INTO "tracker_domains" VALUES('the_reach_group','redintelligence.net');
INSERT INTO "tracker_domains" VALUES('teads','teads.tv');
INSERT INTO "tracker_domains" VALUES('cedexis_radar','cedexis.net');
INSERT INTO "tracker_domains" VALUES('cedexis_radar','cedexis-radar.net');
INSERT INTO "tracker_domains" VALUES('cedexis_radar','cedexis.com');
INSERT INTO "tracker_domains" VALUES('neory_','ad-srv.net');
INSERT INTO "tracker_domains" VALUES('ensighten','ensighten.com');
INSERT INTO "tracker_domains" VALUES('kameleoon','kameleoon.com');
INSERT INTO "tracker_domains" VALUES('linkedin','bizographics.com');
INSERT INTO "tracker_domains" VALUES('linkedin','bizo.com');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','akamaized.net');
INSERT INTO "tracker_domains" VALUES('stickyads','stickyadstv.com');
INSERT INTO "tracker_domains" VALUES('disqus','disqus.com');
INSERT INTO "tracker_domains" VALUES('monotype_gmbh','fonts.net');
INSERT INTO "tracker_domains" VALUES('facebook','fbsbx.com');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.fi');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.it');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.gr');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.de');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.pl');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.bg');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.ar');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.ru');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.dk');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.cz');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.tr');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.ch');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.net');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.br');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.be');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.at');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.fr');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.nl');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.co.uk');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.no');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.se');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.ro');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.es');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.hu');
INSERT INTO "tracker_domains" VALUES('ad4mat','ad4mat.mx');
INSERT INTO "tracker_domains" VALUES('sourcepoint','summerhamster.com');
INSERT INTO "tracker_domains" VALUES('weborama','weborama.com');
INSERT INTO "tracker_domains" VALUES('weborama','weborama.fr');
INSERT INTO "tracker_domains" VALUES('weborama','adrcdn.com');
INSERT INTO "tracker_domains" VALUES('weborama','adrcntr.com');
INSERT INTO "tracker_domains" VALUES('soasta_mpulse','mpstat.us');
INSERT INTO "tracker_domains" VALUES('soasta_mpulse','go-mpulse.net');
INSERT INTO "tracker_domains" VALUES('ab_tasty','abtasty.com');
INSERT INTO "tracker_domains" VALUES('ab_tasty','d1447tq2m68ekg.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('twitter','ads-twitter.com');
INSERT INTO "tracker_domains" VALUES('usabilla','usabilla.com');
INSERT INTO "tracker_domains" VALUES('otto.de','otto.de');
INSERT INTO "tracker_domains" VALUES('pingdom','pingdom.net');
INSERT INTO "tracker_domains" VALUES('ve_interactive','veinteractive.com');
INSERT INTO "tracker_domains" VALUES('burda','bf-ad.net');
INSERT INTO "tracker_domains" VALUES('rhythmone_beacon','1rx.io');
INSERT INTO "tracker_domains" VALUES('smartclip','smartclip.net');
INSERT INTO "tracker_domains" VALUES('appdynamics','de8of677fyt0b.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('appdynamics','appdynamics.com');
INSERT INTO "tracker_domains" VALUES('appdynamics','eum-appdynamics.com');
INSERT INTO "tracker_domains" VALUES('connexity','cxt.ms');
INSERT INTO "tracker_domains" VALUES('connexity','connexity.net');
INSERT INTO "tracker_domains" VALUES('maxcdn','netdna-ssl.com');
INSERT INTO "tracker_domains" VALUES('advolution','advolution.de');
INSERT INTO "tracker_domains" VALUES('wywy.com','wywy.com');
INSERT INTO "tracker_domains" VALUES('m-pathy','m-pathy.com');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','akstat.io');
INSERT INTO "tracker_domains" VALUES('xhamster','xhamsterlive.com');
INSERT INTO "tracker_domains" VALUES('stripchat.com','stripchat.com');
INSERT INTO "tracker_domains" VALUES('exelate','exelator.com');
INSERT INTO "tracker_domains" VALUES('adobe_audience_manager','adobe.com');
INSERT INTO "tracker_domains" VALUES('ligatus','veeseo.com');
INSERT INTO "tracker_domains" VALUES('semasio','semasio.net');
INSERT INTO "tracker_domains" VALUES('mixpanel','mixpanel.com');
INSERT INTO "tracker_domains" VALUES('mixpanel','mxpnl.net');
INSERT INTO "tracker_domains" VALUES('mixpanel','mxpnl.com');
INSERT INTO "tracker_domains" VALUES('stripchat.com','stripcdn.com');
INSERT INTO "tracker_domains" VALUES('t-mobile','t-online.de');
INSERT INTO "tracker_domains" VALUES('scene7.com','scene7.com');
INSERT INTO "tracker_domains" VALUES('ekomi','ekomi.de');
INSERT INTO "tracker_domains" VALUES('sovrn','lijit.com');
INSERT INTO "tracker_domains" VALUES('sovrn','d3pkae9owd2lcf.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('cpx.to','cpx.to');
INSERT INTO "tracker_domains" VALUES('sharethis','sharethis.com');
INSERT INTO "tracker_domains" VALUES('spoteffect','spoteffects.net');
INSERT INTO "tracker_domains" VALUES('sitescout','sitescout.com');
INSERT INTO "tracker_domains" VALUES('kupona','d31bfnnwekbny6.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('dynamic_1001_gmbh','media01.eu');
INSERT INTO "tracker_domains" VALUES('conative.de','conative.de');
INSERT INTO "tracker_domains" VALUES('zopim','zopim.com');
INSERT INTO "tracker_domains" VALUES('tag_commander','tagcommander.com');
INSERT INTO "tracker_domains" VALUES('tag_commander','commander1.com');
INSERT INTO "tracker_domains" VALUES('microsoft','live.com');
INSERT INTO "tracker_domains" VALUES('mail.ru_group','odnoklassniki.ru');
INSERT INTO "tracker_domains" VALUES('mail.ru_group','mail.ru');
INSERT INTO "tracker_domains" VALUES('mail.ru_group','ok.ru');
INSERT INTO "tracker_domains" VALUES('schneevonmorgen.com','svonm.com');
INSERT INTO "tracker_domains" VALUES('ligatus','content-recommendation.net');
INSERT INTO "tracker_domains" VALUES('eroadvertising','ero-advertising.com');
INSERT INTO "tracker_domains" VALUES('sociomantic','sociomantic.com');
INSERT INTO "tracker_domains" VALUES('tvsquared.com','tvsquared.com');
INSERT INTO "tracker_domains" VALUES('zononi.com','zononi.com');
INSERT INTO "tracker_domains" VALUES('userlike.com','userlike.com');
INSERT INTO "tracker_domains" VALUES('vkontakte_widgets','userapi.com');
INSERT INTO "tracker_domains" VALUES('vkontakte_widgets','vkontakte.ru');
INSERT INTO "tracker_domains" VALUES('vkontakte_widgets','vk.com');
INSERT INTO "tracker_domains" VALUES('cdn13.com','cdn13.com');
INSERT INTO "tracker_domains" VALUES('ad_spirit','adspirit.de');
INSERT INTO "tracker_domains" VALUES('ad_spirit','adspirit.net');
INSERT INTO "tracker_domains" VALUES('aol_cdn','aolcdn.com');
INSERT INTO "tracker_domains" VALUES('buzzadexchange.com','buzzadexchange.com');
INSERT INTO "tracker_domains" VALUES('gemius','gemius.pl');
INSERT INTO "tracker_domains" VALUES('trustpilot','trustpilot.com');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','edgekey.net');
INSERT INTO "tracker_domains" VALUES('microsoft','msecnd.net');
INSERT INTO "tracker_domains" VALUES('t-mobile','telekom.de');
INSERT INTO "tracker_domains" VALUES('net-metrix','wemfbox.ch');
INSERT INTO "tracker_domains" VALUES('bunchbox','bunchbox.co');
INSERT INTO "tracker_domains" VALUES('neustar_adadvisor','adadvisor.net');
INSERT INTO "tracker_domains" VALUES('datalogix','nexac.com');
INSERT INTO "tracker_domains" VALUES('refined_labs','refinedads.com');
INSERT INTO "tracker_domains" VALUES('evidon','betrad.com');
INSERT INTO "tracker_domains" VALUES('nexeps.com','nexeps.com');
INSERT INTO "tracker_domains" VALUES('routenplaner-karten.com','routenplaner-karten.com');
INSERT INTO "tracker_domains" VALUES('youporn','ypncdn.com');
INSERT INTO "tracker_domains" VALUES('vibrant_ads','intellitxt.com');
INSERT INTO "tracker_domains" VALUES('linkedin','licdn.com');
INSERT INTO "tracker_domains" VALUES('highwebmedia.com','highwebmedia.com');
INSERT INTO "tracker_domains" VALUES('triplelift','triplelift.com');
INSERT INTO "tracker_domains" VALUES('triplelift','d3iwjrnl4m67rd.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('triplelift','3lift.com');
INSERT INTO "tracker_domains" VALUES('estat','cybermonitor.com');
INSERT INTO "tracker_domains" VALUES('estat','estat.com');
INSERT INTO "tracker_domains" VALUES('bazaarvoice','bazaarvoice.com');
INSERT INTO "tracker_domains" VALUES('blau.de','blau.de');
INSERT INTO "tracker_domains" VALUES('statcounter','statcounter.com');
INSERT INTO "tracker_domains" VALUES('popads','popadscdn.net');
INSERT INTO "tracker_domains" VALUES('popads','popads.net');
INSERT INTO "tracker_domains" VALUES('liveperson','lpsnmedia.net');
INSERT INTO "tracker_domains" VALUES('liveperson','liveperson.net');
INSERT INTO "tracker_domains" VALUES('adap.tv','adap.tv');
INSERT INTO "tracker_domains" VALUES('24_7','247-inc.net');
INSERT INTO "tracker_domains" VALUES('adgoal','smartredirect.de');
INSERT INTO "tracker_domains" VALUES('tns','tns-gallup.dk');
INSERT INTO "tracker_domains" VALUES('tns','spring-tns.net');
INSERT INTO "tracker_domains" VALUES('tns','statistik-gallup.net');
INSERT INTO "tracker_domains" VALUES('tns','tns-counter.ru');
INSERT INTO "tracker_domains" VALUES('tns','sesamestats.com');
INSERT INTO "tracker_domains" VALUES('tns','tns-cs.net');
INSERT INTO "tracker_domains" VALUES('tns','research-int.se');
INSERT INTO "tracker_domains" VALUES('brightcove','brightcove.com');
INSERT INTO "tracker_domains" VALUES('trbo','trbo.com');
INSERT INTO "tracker_domains" VALUES('onesignal','onesignal.com');
INSERT INTO "tracker_domains" VALUES('zendesk','zendesk.com');
INSERT INTO "tracker_domains" VALUES('kiosked','kiosked.com');
INSERT INTO "tracker_domains" VALUES('alephd.com','alephd.com');
INSERT INTO "tracker_domains" VALUES('24_7','d1af033869koo7.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('epoq','epoq.de');
INSERT INTO "tracker_domains" VALUES('madeleine.de','madeleine.de');
INSERT INTO "tracker_domains" VALUES('myfonts_counter','myfonts.net');
INSERT INTO "tracker_domains" VALUES('nt.vc','nt.vc');
INSERT INTO "tracker_domains" VALUES('radiumone','gwallet.com');
INSERT INTO "tracker_domains" VALUES('tripadvisor','tamgrt.com');
INSERT INTO "tracker_domains" VALUES('o2online.de','o2online.de');
INSERT INTO "tracker_domains" VALUES('zencoder','zencdn.net');
INSERT INTO "tracker_domains" VALUES('webtrekk','mateti.net');
INSERT INTO "tracker_domains" VALUES('tripadvisor','tripadvisor.com');
INSERT INTO "tracker_domains" VALUES('tripadvisor','tripadvisor.co.uk');
INSERT INTO "tracker_domains" VALUES('tripadvisor','tacdn.com');
INSERT INTO "tracker_domains" VALUES('tripadvisor','tripadvisor.de');
INSERT INTO "tracker_domains" VALUES('imgur','imgur.com');
INSERT INTO "tracker_domains" VALUES('hurra_tracker','hurra.com');
INSERT INTO "tracker_domains" VALUES('etahub.com','etahub.com');
INSERT INTO "tracker_domains" VALUES('infectious_media','impressiondesk.com');
INSERT INTO "tracker_domains" VALUES('infectious_media','impdesk.com');
INSERT INTO "tracker_domains" VALUES('adroll','adroll.com');
INSERT INTO "tracker_domains" VALUES('traffichaus','traffichaus.com');
INSERT INTO "tracker_domains" VALUES('videology','tidaltv.com');
INSERT INTO "tracker_domains" VALUES('the_weather_company','wfxtriggers.com');
INSERT INTO "tracker_domains" VALUES('adup-tech.com','adup-tech.com');
INSERT INTO "tracker_domains" VALUES('gigya','gigya.com');
INSERT INTO "tracker_domains" VALUES('signal','btstatic.com');
INSERT INTO "tracker_domains" VALUES('signal','thebrighttag.com');
INSERT INTO "tracker_domains" VALUES('161media','ads.creative-serving.com');
INSERT INTO "tracker_domains" VALUES('rackcdn.com','rackcdn.com');
INSERT INTO "tracker_domains" VALUES('cedexis_radar','cedexis-test.com');
INSERT INTO "tracker_domains" VALUES('kxcdn.com','kxcdn.com');
INSERT INTO "tracker_domains" VALUES('ixi_digital','ixiaa.com');
INSERT INTO "tracker_domains" VALUES('iadvize','iadvize.com');
INSERT INTO "tracker_domains" VALUES('igodigital','igodigital.com');
INSERT INTO "tracker_domains" VALUES('zanox','zanox.ws');
INSERT INTO "tracker_domains" VALUES('sharethrough','shareth.ru');
INSERT INTO "tracker_domains" VALUES('sharethrough','sharethrough.com');
INSERT INTO "tracker_domains" VALUES('vimeo','vimeocdn.com');
INSERT INTO "tracker_domains" VALUES('metrigo','metrigo.com');
INSERT INTO "tracker_domains" VALUES('i-behavior','ib-ibi.com');
INSERT INTO "tracker_domains" VALUES('perfect_market','perfectmarket.com');
INSERT INTO "tracker_domains" VALUES('microsoft','windows.net');
INSERT INTO "tracker_domains" VALUES('marketgid','dt07.net');
INSERT INTO "tracker_domains" VALUES('marketgid','dt00.net');
INSERT INTO "tracker_domains" VALUES('marketgid','mgid.com');
INSERT INTO "tracker_domains" VALUES('wordpress_stats','w.org');
INSERT INTO "tracker_domains" VALUES('next_performance','nxtck.com');
INSERT INTO "tracker_domains" VALUES('media_impact','mediaimpact.de');
INSERT INTO "tracker_domains" VALUES('soundcloud','soundcloud.com');
INSERT INTO "tracker_domains" VALUES('adc_media','adc-srv.net');
INSERT INTO "tracker_domains" VALUES('akanoo','akanoo.com');
INSERT INTO "tracker_domains" VALUES('findologic.com','findologic.com');
INSERT INTO "tracker_domains" VALUES('are_you_a_human','areyouahuman.com');
INSERT INTO "tracker_domains" VALUES('userreport','userreport.com');
INSERT INTO "tracker_domains" VALUES('adara_analytics','yieldoptimizer.com');
INSERT INTO "tracker_domains" VALUES('kontextr','ktxtr.com');
INSERT INTO "tracker_domains" VALUES('soundcloud','sndcdn.com');
INSERT INTO "tracker_domains" VALUES('content_spread','contentspread.net');
INSERT INTO "tracker_domains" VALUES('visual_iq','myvisualiq.net');
INSERT INTO "tracker_domains" VALUES('ciuvo.com','ciuvo.com');
INSERT INTO "tracker_domains" VALUES('demandbase','company-target.com');
INSERT INTO "tracker_domains" VALUES('adtriba.com','adtriba.com');
INSERT INTO "tracker_domains" VALUES('yahoo','yahooapis.com');
INSERT INTO "tracker_domains" VALUES('tradedoubler','tradedoubler.com');
INSERT INTO "tracker_domains" VALUES('innogames.de','innogamescdn.com');
INSERT INTO "tracker_domains" VALUES('propeller_ads','onclickads.net');
INSERT INTO "tracker_domains" VALUES('propeller_ads','onclkds.com');
INSERT INTO "tracker_domains" VALUES('propeller_ads','propellerpops.com');
INSERT INTO "tracker_domains" VALUES('propeller_ads','oclaserver.com');
INSERT INTO "tracker_domains" VALUES('propeller_ads','propellerads.com');
INSERT INTO "tracker_domains" VALUES('fraudlogix','yabidos.com');
INSERT INTO "tracker_domains" VALUES('twenga','c4tw.net');
INSERT INTO "tracker_domains" VALUES('exoticads.com','exoticads.com');
INSERT INTO "tracker_domains" VALUES('xfreeservice.com','xfreeservice.com');
INSERT INTO "tracker_domains" VALUES('sheego.de','sheego.de');
INSERT INTO "tracker_domains" VALUES('marin_search_marketer','marinsm.com');
INSERT INTO "tracker_domains" VALUES('openload','oloadcdn.net');
INSERT INTO "tracker_domains" VALUES('rtb_house','creativecdn.com');
INSERT INTO "tracker_domains" VALUES('jimdo.com','jimcdn.com');
INSERT INTO "tracker_domains" VALUES('wetter_com','wettercomassets.com');
INSERT INTO "tracker_domains" VALUES('polyfill.io','polyfill.io');
INSERT INTO "tracker_domains" VALUES('grandslammedia','tuberewards.com');
INSERT INTO "tracker_domains" VALUES('grandslammedia','trw12.com');
INSERT INTO "tracker_domains" VALUES('rocket_fuel','ru4.com');
INSERT INTO "tracker_domains" VALUES('rocket_fuel','xplusone.com');
INSERT INTO "tracker_domains" VALUES('delta_projects','de17a.com');
INSERT INTO "tracker_domains" VALUES('delta_projects','adaction.se');
INSERT INTO "tracker_domains" VALUES('clicktale','cdngc.net');
INSERT INTO "tracker_domains" VALUES('clicktale','clicktale.net');
INSERT INTO "tracker_domains" VALUES('clicktale','pantherssl.com');
INSERT INTO "tracker_domains" VALUES('onthe.io','onthe.io');
INSERT INTO "tracker_domains" VALUES('whos.amung.us','amung.us');
INSERT INTO "tracker_domains" VALUES('atg_group','oadts.com');
INSERT INTO "tracker_domains" VALUES('relevant4.com','relevant4.com');
INSERT INTO "tracker_domains" VALUES('ibm_customer_experience','cmcore.com');
INSERT INTO "tracker_domains" VALUES('ibm_customer_experience','coremetrics.com');
INSERT INTO "tracker_domains" VALUES('skimlinks','redirectingat.com');
INSERT INTO "tracker_domains" VALUES('skimlinks','skimresources.com');
INSERT INTO "tracker_domains" VALUES('skimlinks','skimlinks.com');
INSERT INTO "tracker_domains" VALUES('conviva','conviva.com');
INSERT INTO "tracker_domains" VALUES('oms','omsnative.de');
INSERT INTO "tracker_domains" VALUES('webtrekk','wcfbc.net');
INSERT INTO "tracker_domains" VALUES('brightcove_player','brightcove.net');
INSERT INTO "tracker_domains" VALUES('klarna.com','klarna.com');
INSERT INTO "tracker_domains" VALUES('vimeo','vimeo.com');
INSERT INTO "tracker_domains" VALUES('usemax','usemaxserver.de');
INSERT INTO "tracker_domains" VALUES('sift_science','dtlilztwypawv.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('sift_science','siftscience.com');
INSERT INTO "tracker_domains" VALUES('congstar.de','congstar.de');
INSERT INTO "tracker_domains" VALUES('dtscout.com','dtscout.com');
INSERT INTO "tracker_domains" VALUES('smaato','smaato.net');
INSERT INTO "tracker_domains" VALUES('spotscenered.info','spotscenered.info');
INSERT INTO "tracker_domains" VALUES('adriver','adriver.ru');
INSERT INTO "tracker_domains" VALUES('cqq5id8n.com','cqq5id8n.com');
INSERT INTO "tracker_domains" VALUES('bidtheatre','bidtheatre.com');
INSERT INTO "tracker_domains" VALUES('just_premium','justpremium.nl');
INSERT INTO "tracker_domains" VALUES('just_premium','justpremium.com');
INSERT INTO "tracker_domains" VALUES('mein-bmi.com','mein-bmi.com');
INSERT INTO "tracker_domains" VALUES('internet_billboard','ibillboard.com');
INSERT INTO "tracker_domains" VALUES('internet_billboard','goadservices.com');
INSERT INTO "tracker_domains" VALUES('admeta','admaym.com');
INSERT INTO "tracker_domains" VALUES('admeta','atemda.com');
INSERT INTO "tracker_domains" VALUES('histats','histats.com');
INSERT INTO "tracker_domains" VALUES('kupona','kpcustomer.de');
INSERT INTO "tracker_domains" VALUES('truste_notice','choices.truste.com');
INSERT INTO "tracker_domains" VALUES('truste_notice','choices-or.truste.com');
INSERT INTO "tracker_domains" VALUES('geniee','gssprt.jp');
INSERT INTO "tracker_domains" VALUES('vtracy.de','vtracy.de');
INSERT INTO "tracker_domains" VALUES('whatbroadcast','whatsbroadcast.com');
INSERT INTO "tracker_domains" VALUES('flowplayer','flowplayer.org');
INSERT INTO "tracker_domains" VALUES('rambler','rambler.ru');
INSERT INTO "tracker_domains" VALUES('lockerz_share','addtoany.com');
INSERT INTO "tracker_domains" VALUES('tynt','tynt.com');
INSERT INTO "tracker_domains" VALUES('smartstream.tv','smartstream.tv');
INSERT INTO "tracker_domains" VALUES('realperson.de','realperson.de');
INSERT INTO "tracker_domains" VALUES('glotgrx.com','glotgrx.com');
INSERT INTO "tracker_domains" VALUES('threatmetrix','online-metrix.net');
INSERT INTO "tracker_domains" VALUES('yandex','yastatic.net');
INSERT INTO "tracker_domains" VALUES('cxo.name','cxo.name');
INSERT INTO "tracker_domains" VALUES('glomex.com','glomex.com');
INSERT INTO "tracker_domains" VALUES('cxense','cxense.com');
INSERT INTO "tracker_domains" VALUES('greentube.com','gt-cdn.net');
INSERT INTO "tracker_domains" VALUES('amplitude','d24n15hnbwhuhn.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('amplitude','amplitude.com');
INSERT INTO "tracker_domains" VALUES('falk_technologies','angsrvr.com');
INSERT INTO "tracker_domains" VALUES('pagefair','pagefair.com');
INSERT INTO "tracker_domains" VALUES('pagefair','blockmetrics.com');
INSERT INTO "tracker_domains" VALUES('pagefair','pagefair.net');
INSERT INTO "tracker_domains" VALUES('emsmobile.de','emsmobile.de');
INSERT INTO "tracker_domains" VALUES('fastlylb.net','fastlylb.net');
INSERT INTO "tracker_domains" VALUES('alibaba.com','alicdn.com');
INSERT INTO "tracker_domains" VALUES('vorwerk.de','vorwerk.de');
INSERT INTO "tracker_domains" VALUES('digidip','digidip.net');
INSERT INTO "tracker_domains" VALUES('salesforce_live_agent','salesforceliveagent.com');
INSERT INTO "tracker_domains" VALUES('salesforce_live_agent','liveagentforsalesforce.com');
INSERT INTO "tracker_domains" VALUES('mycliplister.com','mycliplister.com');
INSERT INTO "tracker_domains" VALUES('peerius','peerius.com');
INSERT INTO "tracker_domains" VALUES('kupona','q-sis.de');
INSERT INTO "tracker_domains" VALUES('steepto.com','steepto.com');
INSERT INTO "tracker_domains" VALUES('adglue','adsafety.net');
INSERT INTO "tracker_domains" VALUES('monetate','monetate.net');
INSERT INTO "tracker_domains" VALUES('bing_maps','virtualearth.net');
INSERT INTO "tracker_domains" VALUES('mov.ad_','movad.net');
INSERT INTO "tracker_domains" VALUES('mov.ad_','movad.de');
INSERT INTO "tracker_domains" VALUES('simpli.fi','simpli.fi');
INSERT INTO "tracker_domains" VALUES('office365.com','office365.com');
INSERT INTO "tracker_domains" VALUES('digital_window','dwin1.com');
INSERT INTO "tracker_domains" VALUES('touchcommerce','inq.com');
INSERT INTO "tracker_domains" VALUES('jimdo.com','jimdo.com');
INSERT INTO "tracker_domains" VALUES('srvtrck.com','srvtrck.com');
INSERT INTO "tracker_domains" VALUES('tribal_fusion','tribalfusion.com');
INSERT INTO "tracker_domains" VALUES('tribal_fusion','exponential.com');
INSERT INTO "tracker_domains" VALUES('snap_engage','snapengage.com');
INSERT INTO "tracker_domains" VALUES('gfk','sensic.net');
INSERT INTO "tracker_domains" VALUES('qualtrics','qualtrics.com');
INSERT INTO "tracker_domains" VALUES('juicyads','juicyads.com');
INSERT INTO "tracker_domains" VALUES('cquotient.com','cquotient.com');
INSERT INTO "tracker_domains" VALUES('ancora','ancoraplatform.com');
INSERT INTO "tracker_domains" VALUES('adclear','adclear.net');
INSERT INTO "tracker_domains" VALUES('crimtan','ctnsnet.com');
INSERT INTO "tracker_domains" VALUES('crimtan','ctpsnet.com');
INSERT INTO "tracker_domains" VALUES('crimtan','ctasnet.com');
INSERT INTO "tracker_domains" VALUES('dynadmic','dyntrk.com');
INSERT INTO "tracker_domains" VALUES('viglink','viglink.com');
INSERT INTO "tracker_domains" VALUES('dawandastatic.com','dawandastatic.com');
INSERT INTO "tracker_domains" VALUES('tubecup.org','tubecup.org');
INSERT INTO "tracker_domains" VALUES('media.net','media.net');
INSERT INTO "tracker_domains" VALUES('rtmark.net','rtmark.net');
INSERT INTO "tracker_domains" VALUES('trackjs','dl1d2m8ri9v3j.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('trackjs','d2zah9y47r7bi2.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('trackjs','trackjs.com');
INSERT INTO "tracker_domains" VALUES('elastic_ad','elasticad.net');
INSERT INTO "tracker_domains" VALUES('intercom','intercomcdn.com');
INSERT INTO "tracker_domains" VALUES('intercom','intercom.io');
INSERT INTO "tracker_domains" VALUES('adyoulike','adyoulike.com');
INSERT INTO "tracker_domains" VALUES('adyoulike','omnitagjs.com');
INSERT INTO "tracker_domains" VALUES('monotype_imaging','fonts.com');
INSERT INTO "tracker_domains" VALUES('web_wipe_anlaytics','wipe.de');
INSERT INTO "tracker_domains" VALUES('adnium.com','adnium.com');
INSERT INTO "tracker_domains" VALUES('markmonitor','caanalytics.com');
INSERT INTO "tracker_domains" VALUES('markmonitor','mmstat.com');
INSERT INTO "tracker_domains" VALUES('markmonitor','9c9media.com');
INSERT INTO "tracker_domains" VALUES('azureedge.net','azureedge.net');
INSERT INTO "tracker_domains" VALUES('bd4travel.com','bd4travel.com');
INSERT INTO "tracker_domains" VALUES('iovation','iovation.com');
INSERT INTO "tracker_domains" VALUES('iovation','iesnare.com');
INSERT INTO "tracker_domains" VALUES('adtr02.com','adtr02.com');
INSERT INTO "tracker_domains" VALUES('scribblelive','scribblelive.com');
INSERT INTO "tracker_domains" VALUES('unruly_media','unrulymedia.com');
INSERT INTO "tracker_domains" VALUES('beeswax','bidr.io');
INSERT INTO "tracker_domains" VALUES('contentsquare.net','contentsquare.net');
INSERT INTO "tracker_domains" VALUES('geotrust','geotrust.com');
INSERT INTO "tracker_domains" VALUES('zemanta','zemanta.com');
INSERT INTO "tracker_domains" VALUES('trafficfabrik.com','trafficfabrik.com');
INSERT INTO "tracker_domains" VALUES('rncdn3.com','rncdn3.com');
INSERT INTO "tracker_domains" VALUES('index_exchange_','indexww.com');
INSERT INTO "tracker_domains" VALUES('skype','skype.com');
INSERT INTO "tracker_domains" VALUES('skype','skypeassets.com');
INSERT INTO "tracker_domains" VALUES('fit_analytics','fitanalytics.com');
INSERT INTO "tracker_domains" VALUES('dimml','dimml.io');
INSERT INTO "tracker_domains" VALUES('redtube.com','rdtcdn.com');
INSERT INTO "tracker_domains" VALUES('sonobi','sonobi.com');
INSERT INTO "tracker_domains" VALUES('belboon_gmbh','belboon.de');
INSERT INTO "tracker_domains" VALUES('web.de','web.de');
INSERT INTO "tracker_domains" VALUES('iasds01.com','iasds01.com');
INSERT INTO "tracker_domains" VALUES('autoscout24.net','autoscout24.net');
INSERT INTO "tracker_domains" VALUES('flickr_badge','flickr.com');
INSERT INTO "tracker_domains" VALUES('globalsign','globalsign.com');
INSERT INTO "tracker_domains" VALUES('adloox','adlooxtracking.com');
INSERT INTO "tracker_domains" VALUES('groupm_server','gmads.net');
INSERT INTO "tracker_domains" VALUES('groupm_server','grmtech.net');
INSERT INTO "tracker_domains" VALUES('acxiom','acxiomapac.com');
INSERT INTO "tracker_domains" VALUES('bongacams.com','bongacams.com');
INSERT INTO "tracker_domains" VALUES('symantec','norton.com');
INSERT INTO "tracker_domains" VALUES('symantec','verisign.com');
INSERT INTO "tracker_domains" VALUES('vergic.com','vergic.com');
INSERT INTO "tracker_domains" VALUES('esprit.de','esprit.de');
INSERT INTO "tracker_domains" VALUES('mncdn.com','mncdn.com');
INSERT INTO "tracker_domains" VALUES('marshadow.io','marshadow.io');
INSERT INTO "tracker_domains" VALUES('bangdom.com','bangdom.com');
INSERT INTO "tracker_domains" VALUES('teufel.de','teufel.de');
INSERT INTO "tracker_domains" VALUES('taboola','basebanner.com');
INSERT INTO "tracker_domains" VALUES('webgains','webgains.com');
INSERT INTO "tracker_domains" VALUES('truste_consent','consent.truste.com');
INSERT INTO "tracker_domains" VALUES('inspsearchapi.com','inspsearchapi.com');
INSERT INTO "tracker_domains" VALUES('tagman','levexis.com');
INSERT INTO "tracker_domains" VALUES('livechat','livechatinc.net');
INSERT INTO "tracker_domains" VALUES('livechat','livechatinc.com');
INSERT INTO "tracker_domains" VALUES('reddit','reddit.com');
INSERT INTO "tracker_domains" VALUES('oclasrv.com','oclasrv.com');
INSERT INTO "tracker_domains" VALUES('flxone','flxpxl.com');
INSERT INTO "tracker_domains" VALUES('flxone','flx1.com');
INSERT INTO "tracker_domains" VALUES('ebay','ebay-us.com');
INSERT INTO "tracker_domains" VALUES('shopgate.com','shopgate.com');
INSERT INTO "tracker_domains" VALUES('bidtellect','bttrack.com');
INSERT INTO "tracker_domains" VALUES('mapandroute.de','mapandroute.de');
INSERT INTO "tracker_domains" VALUES('vidible','vidible.tv');
INSERT INTO "tracker_domains" VALUES('tradelab','tradelab.fr');
INSERT INTO "tracker_domains" VALUES('twyn','twyn.com');
INSERT INTO "tracker_domains" VALUES('catchpoint','3gl.net');
INSERT INTO "tracker_domains" VALUES('nosto.com','nosto.com');
INSERT INTO "tracker_domains" VALUES('similardeals.net','similardeals.net');
INSERT INTO "tracker_domains" VALUES('adult_webmaster_empire','awempire.com');
INSERT INTO "tracker_domains" VALUES('adult_webmaster_empire','livejasmin.com');
INSERT INTO "tracker_domains" VALUES('usemax','usemax.de');
INSERT INTO "tracker_domains" VALUES('autoscout24.com','autoscout24.com');
INSERT INTO "tracker_domains" VALUES('nexage','nexage.com');
INSERT INTO "tracker_domains" VALUES('airbnb','muscache.com');
INSERT INTO "tracker_domains" VALUES('doubleverify','doubleverify.com');
INSERT INTO "tracker_domains" VALUES('octapi.net','octapi.net');
INSERT INTO "tracker_domains" VALUES('eloqua','en25.com');
INSERT INTO "tracker_domains" VALUES('eloqua','eloqua.com');
INSERT INTO "tracker_domains" VALUES('adelphic','ipredictive.com');
INSERT INTO "tracker_domains" VALUES('mycdn.me','mycdn.me');
INSERT INTO "tracker_domains" VALUES('adworx.at','adworx.at');
INSERT INTO "tracker_domains" VALUES('adspyglass','o333o.com');
INSERT INTO "tracker_domains" VALUES('sexypartners.net','sexypartners.net');
INSERT INTO "tracker_domains" VALUES('adify','afy11.net');
INSERT INTO "tracker_domains" VALUES('1und1','website-start.de');
INSERT INTO "tracker_domains" VALUES('bing_ads','bing.net');
INSERT INTO "tracker_domains" VALUES('chatango','chatango.com');
INSERT INTO "tracker_domains" VALUES('xhamster','xhamster.com');
INSERT INTO "tracker_domains" VALUES('springserve','springserve.com');
INSERT INTO "tracker_domains" VALUES('united_digital_group','nonstoppartner.net');
INSERT INTO "tracker_domains" VALUES('adverserve','adverserve.net');
INSERT INTO "tracker_domains" VALUES('segment','segment.com');
INSERT INTO "tracker_domains" VALUES('segment','segment.io');
INSERT INTO "tracker_domains" VALUES('segment','d47xnnr8b1rki.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('segment','d2dq2ahtl5zl1z.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('sekindo','sekindo.com');
INSERT INTO "tracker_domains" VALUES('perimeterx.net','perimeterx.net');
INSERT INTO "tracker_domains" VALUES('klarmobil.de','klarmobil.de');
INSERT INTO "tracker_domains" VALUES('adnet.de','adnet.biz');
INSERT INTO "tracker_domains" VALUES('adnet.de','adnet.de');
INSERT INTO "tracker_domains" VALUES('cursecdn.com','cursecdn.com');
INSERT INTO "tracker_domains" VALUES('mindspark','staticimgfarm.com');
INSERT INTO "tracker_domains" VALUES('po.st','po.st');
INSERT INTO "tracker_domains" VALUES('switch_concepts','switchadhub.com');
INSERT INTO "tracker_domains" VALUES('switch_concepts','switchads.com');
INSERT INTO "tracker_domains" VALUES('switch_concepts','myswitchads.com');
INSERT INTO "tracker_domains" VALUES('switch_concepts','switchafrica.com');
INSERT INTO "tracker_domains" VALUES('ask.com','ask.com');
INSERT INTO "tracker_domains" VALUES('dynamic_yield','dynamicyield.com');
INSERT INTO "tracker_domains" VALUES('1822direkt.de','1822direkt.de');
INSERT INTO "tracker_domains" VALUES('hola_player','h-cdn.com');
INSERT INTO "tracker_domains" VALUES('localhost','localhost');
INSERT INTO "tracker_domains" VALUES('zog.link','zog.link');
INSERT INTO "tracker_domains" VALUES('tremor_video','videohub.tv');
INSERT INTO "tracker_domains" VALUES('richrelevance','ics0.com');
INSERT INTO "tracker_domains" VALUES('richrelevance','richrelevance.com');
INSERT INTO "tracker_domains" VALUES('tubemogul','tubemogul.com');
INSERT INTO "tracker_domains" VALUES('bugsnag','d2wy8f7a9ursnm.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('aloodo','github.io');
INSERT INTO "tracker_domains" VALUES('codeonclick.com','codeonclick.com');
INSERT INTO "tracker_domains" VALUES('imgix.net','imgix.net');
INSERT INTO "tracker_domains" VALUES('eanalyzer.de','eanalyzer.de');
INSERT INTO "tracker_domains" VALUES('gravityrd-services.com','gravityrd-services.com');
INSERT INTO "tracker_domains" VALUES('msn','col.stc.s-msn.com');
INSERT INTO "tracker_domains" VALUES('msn','s-msn.com');
INSERT INTO "tracker_domains" VALUES('greatviews.de','greatviews.de');
INSERT INTO "tracker_domains" VALUES('idcdn.de','idcdn.de');
INSERT INTO "tracker_domains" VALUES('lkqd','lkqd.net');
INSERT INTO "tracker_domains" VALUES('woopic.com','woopic.com');
INSERT INTO "tracker_domains" VALUES('eyeview','eyeviewads.com');
INSERT INTO "tracker_domains" VALUES('stripe.com','stripe.com');
INSERT INTO "tracker_domains" VALUES('coll1onf.com','coll1onf.com');
INSERT INTO "tracker_domains" VALUES('salecycle','d16fk4ms6rqz1v.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('salecycle','salecycle.com');
INSERT INTO "tracker_domains" VALUES('id-news.net','id-news.net');
INSERT INTO "tracker_domains" VALUES('doofinder.com','doofinder.com');
INSERT INTO "tracker_domains" VALUES('exdynsrv.com','exdynsrv.com');
INSERT INTO "tracker_domains" VALUES('gft2.de','gft2.de');
INSERT INTO "tracker_domains" VALUES('ixquick.com','ixquick.com');
INSERT INTO "tracker_domains" VALUES('loadbee.com','loadbee.com');
INSERT INTO "tracker_domains" VALUES('findizer.fr','findizer.fr');
INSERT INTO "tracker_domains" VALUES('wix.com','wix.com');
INSERT INTO "tracker_domains" VALUES('7tv.de','7tv.de');
INSERT INTO "tracker_domains" VALUES('opta.net','opta.net');
INSERT INTO "tracker_domains" VALUES('zedo','zedo.com');
INSERT INTO "tracker_domains" VALUES('alibaba.com','alibaba.com');
INSERT INTO "tracker_domains" VALUES('crossengage','crossengage.io');
INSERT INTO "tracker_domains" VALUES('solads.media','solads.media');
INSERT INTO "tracker_domains" VALUES('reddit','redditmedia.com');
INSERT INTO "tracker_domains" VALUES('office.com','office.com');
INSERT INTO "tracker_domains" VALUES('adotmob.com','adotmob.com');
INSERT INTO "tracker_domains" VALUES('liveadexchanger.com','liveadexchanger.com');
INSERT INTO "tracker_domains" VALUES('brandwire.tv','brandwire.tv');
INSERT INTO "tracker_domains" VALUES('dditscdn.com','dditscdn.com');
INSERT INTO "tracker_domains" VALUES('mail.ru_group','imgsmail.ru');
INSERT INTO "tracker_domains" VALUES('gumgum','gumgum.com');
INSERT INTO "tracker_domains" VALUES('bombora','ml314.com');
INSERT INTO "tracker_domains" VALUES('king.com','king.com');
INSERT INTO "tracker_domains" VALUES('admeira.ch','admeira.ch');
INSERT INTO "tracker_domains" VALUES('propeller_ads','onclasrv.com');
INSERT INTO "tracker_domains" VALUES('adventori','adventori.com');
INSERT INTO "tracker_domains" VALUES('kairion.de','kctag.net');
INSERT INTO "tracker_domains" VALUES('stayfriends.de','stayfriends.de');
INSERT INTO "tracker_domains" VALUES('apester','apester.com');
INSERT INTO "tracker_domains" VALUES('bulkhentai.com','bulkhentai.com');
INSERT INTO "tracker_domains" VALUES('metapeople','metalyzer.com');
INSERT INTO "tracker_domains" VALUES('smartlook','smartlook.com');
INSERT INTO "tracker_domains" VALUES('smartlook','getsmartlook.com');
INSERT INTO "tracker_domains" VALUES('getintent','adhigh.net');
INSERT INTO "tracker_domains" VALUES('sumome','sumome.com');
INSERT INTO "tracker_domains" VALUES('kairion.de','kairion.de');
INSERT INTO "tracker_domains" VALUES('trsv3.com','trsv3.com');
INSERT INTO "tracker_domains" VALUES('powerlinks','powerlinks.com');
INSERT INTO "tracker_domains" VALUES('lifestreet_media','lfstmedia.com');
INSERT INTO "tracker_domains" VALUES('sparkasse.de','sparkasse.de');
INSERT INTO "tracker_domains" VALUES('netmining','netmng.com');
INSERT INTO "tracker_domains" VALUES('netmining','netmining.com');
INSERT INTO "tracker_domains" VALUES('videoplaza','videoplaza.tv');
INSERT INTO "tracker_domains" VALUES('inspectlet','inspectlet.com');
INSERT INTO "tracker_domains" VALUES('yume','yume.com');
INSERT INTO "tracker_domains" VALUES('flickr_badge','staticflickr.com');
INSERT INTO "tracker_domains" VALUES('nanigans','nanigans.com');
INSERT INTO "tracker_domains" VALUES('certona','certona.net');
INSERT INTO "tracker_domains" VALUES('certona','res-x.com');
INSERT INTO "tracker_domains" VALUES('affimax','affimax.de');
INSERT INTO "tracker_domains" VALUES('hubspot','hs-analytics.net');
INSERT INTO "tracker_domains" VALUES('hubspot','hubspot.com');
INSERT INTO "tracker_domains" VALUES('quisma','quisma.com');
INSERT INTO "tracker_domains" VALUES('quisma','qservz.com');
INSERT INTO "tracker_domains" VALUES('pusher.com','pusher.com');
INSERT INTO "tracker_domains" VALUES('blogsmithmedia.com','blogsmithmedia.com');
INSERT INTO "tracker_domains" VALUES('sojern','sojern.com');
INSERT INTO "tracker_domains" VALUES('sublime_skinz','ayads.co');
INSERT INTO "tracker_domains" VALUES('keen_io','keen.io');
INSERT INTO "tracker_domains" VALUES('keen_io','dc8na2hxrj29i.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('digiteka','ultimedia.com');
INSERT INTO "tracker_domains" VALUES('ard.de','ard.de');
INSERT INTO "tracker_domains" VALUES('decenthat.com','decenthat.com');
INSERT INTO "tracker_domains" VALUES('netflix','netflix.com');
INSERT INTO "tracker_domains" VALUES('tp-cdn.com','tp-cdn.com');
INSERT INTO "tracker_domains" VALUES('adtelligence.de','adtelligence.de');
INSERT INTO "tracker_domains" VALUES('tawk','tawk.to');
INSERT INTO "tracker_domains" VALUES('firebaseio.com','firebaseio.com');
INSERT INTO "tracker_domains" VALUES('shopauskunft.de','shopauskunft.de');
INSERT INTO "tracker_domains" VALUES('dcmn.com','dcmn.com');
INSERT INTO "tracker_domains" VALUES('mythings','mythings.com');
INSERT INTO "tracker_domains" VALUES('asambeauty.com','asambeauty.com');
INSERT INTO "tracker_domains" VALUES('dailymotion','dailymotion.com');
INSERT INTO "tracker_domains" VALUES('cam-content.com','cam-content.com');
INSERT INTO "tracker_domains" VALUES('ttvnw.net','ttvnw.net');
INSERT INTO "tracker_domains" VALUES('dmwd','ctret.de');
INSERT INTO "tracker_domains" VALUES('wikia_cdn','nocookie.net');
INSERT INTO "tracker_domains" VALUES('voicefive','voicefive.com');
INSERT INTO "tracker_domains" VALUES('run','rundsp.com');
INSERT INTO "tracker_domains" VALUES('run','runadtag.com');
INSERT INTO "tracker_domains" VALUES('orange','orange.fr');
INSERT INTO "tracker_domains" VALUES('orange','orangeads.fr');
INSERT INTO "tracker_domains" VALUES('media-imdb.com','media-imdb.com');
INSERT INTO "tracker_domains" VALUES('marketo','mktoresp.com');
INSERT INTO "tracker_domains" VALUES('marketo','marketo.com');
INSERT INTO "tracker_domains" VALUES('marketo','marketo.net');
INSERT INTO "tracker_domains" VALUES('shopify_stats','shopify.com');
INSERT INTO "tracker_domains" VALUES('dc_stormiq','dc-storm.com');
INSERT INTO "tracker_domains" VALUES('dc_stormiq','stormcontainertag.com');
INSERT INTO "tracker_domains" VALUES('dc_stormiq','h4k5.com');
INSERT INTO "tracker_domains" VALUES('dc_stormiq','stormiq.com');
INSERT INTO "tracker_domains" VALUES('maxpoint_interactive','mxptint.net');
INSERT INTO "tracker_domains" VALUES('adxpansion','adxpansion.com');
INSERT INTO "tracker_domains" VALUES('onaudience','onaudience.com');
INSERT INTO "tracker_domains" VALUES('branch_metrics','app.link');
INSERT INTO "tracker_domains" VALUES('uservoice','uservoice.com');
INSERT INTO "tracker_domains" VALUES('owneriq','owneriq.net');
INSERT INTO "tracker_domains" VALUES('convertro','d1ivexoxmp59q7.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('convertro','convertro.com');
INSERT INTO "tracker_domains" VALUES('connextra','connextra.com');
INSERT INTO "tracker_domains" VALUES('yandex_adexchange','yandexadexchange.net');
INSERT INTO "tracker_domains" VALUES('digicert_trust_seal','digicert.com');
INSERT INTO "tracker_domains" VALUES('urban-media.com','urban-media.com');
INSERT INTO "tracker_domains" VALUES('marketgrid','marketgid.com');
INSERT INTO "tracker_domains" VALUES('adtiger','adtiger.de');
INSERT INTO "tracker_domains" VALUES('pulpix.com','pulpix.com');
INSERT INTO "tracker_domains" VALUES('branch_metrics','branch.io');
INSERT INTO "tracker_domains" VALUES('smartclick.net','smartclick.net');
INSERT INTO "tracker_domains" VALUES('xing','xing-share.com');
INSERT INTO "tracker_domains" VALUES('travel_audience','travelaudience.com');
INSERT INTO "tracker_domains" VALUES('streamrail.com','streamrail.com');
INSERT INTO "tracker_domains" VALUES('t8cdn.com','t8cdn.com');
INSERT INTO "tracker_domains" VALUES('sueddeutsche.com','sueddeutsche.com');
INSERT INTO "tracker_domains" VALUES('apple','apple.com');
INSERT INTO "tracker_domains" VALUES('magnetic','domdex.com');
INSERT INTO "tracker_domains" VALUES('magnetic','d3ezl4ajpp2zy8.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('magnetic','domdex.net');
INSERT INTO "tracker_domains" VALUES('schneevonmorgen.com','schneevonmorgen.com');
INSERT INTO "tracker_domains" VALUES('fullstory','fullstory.com');
INSERT INTO "tracker_domains" VALUES('vicomi.com','vicomi.com');
INSERT INTO "tracker_domains" VALUES('alipay.com','alipay.com');
INSERT INTO "tracker_domains" VALUES('deichmann.com','deichmann.com');
INSERT INTO "tracker_domains" VALUES('upravel.com','upravel.com');
INSERT INTO "tracker_domains" VALUES('hqentertainmentnetwork.com','hqentertainmentnetwork.com');
INSERT INTO "tracker_domains" VALUES('here__formerly_navteq_media_solutions_','here.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','anrdoezrs.net');
INSERT INTO "tracker_domains" VALUES('commission_junction','apmebf.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','ftjcfx.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','qksz.net');
INSERT INTO "tracker_domains" VALUES('commission_junction','awltovhc.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','emjcd.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','tkqlhce.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','lduhtrp.net');
INSERT INTO "tracker_domains" VALUES('commission_junction','yceml.net');
INSERT INTO "tracker_domains" VALUES('commission_junction','tqlkg.com');
INSERT INTO "tracker_domains" VALUES('commission_junction','afcyhf.com');
INSERT INTO "tracker_domains" VALUES('othersearch.info','othersearch.info');
INSERT INTO "tracker_domains" VALUES('avocet','avocet.io');
INSERT INTO "tracker_domains" VALUES('toplist.cz','toplist.cz');
INSERT INTO "tracker_domains" VALUES('microsoft','microsofttranslator.com');
INSERT INTO "tracker_domains" VALUES('optimicdn.com','optimicdn.com');
INSERT INTO "tracker_domains" VALUES('bounce_exchange','bounceexchange.com');
INSERT INTO "tracker_domains" VALUES('adrom','txt.eu');
INSERT INTO "tracker_domains" VALUES('rtblab','rvty.net');
INSERT INTO "tracker_domains" VALUES('google_users','1e100cdn.net');
INSERT INTO "tracker_domains" VALUES('haendlerbund.de','haendlerbund.de');
INSERT INTO "tracker_domains" VALUES('symantec','symantec.com');
INSERT INTO "tracker_domains" VALUES('symantec','thawte.com');
INSERT INTO "tracker_domains" VALUES('cdn-net.com','cdn-net.com');
INSERT INTO "tracker_domains" VALUES('omarsys.com','omarsys.com');
INSERT INTO "tracker_domains" VALUES('adfox','adwolf.ru');
INSERT INTO "tracker_domains" VALUES('adfox','adfox.ru');
INSERT INTO "tracker_domains" VALUES('iperceptions','iperceptions.com');
INSERT INTO "tracker_domains" VALUES('pusherapp.com','pusherapp.com');
INSERT INTO "tracker_domains" VALUES('streamrail.com','streamrail.net');
INSERT INTO "tracker_domains" VALUES('chaturbate.com','chaturbate.com');
INSERT INTO "tracker_domains" VALUES('sixt-neuwagen.de','sixt-neuwagen.de');
INSERT INTO "tracker_domains" VALUES('sparda.de','sparda.de');
INSERT INTO "tracker_domains" VALUES('yieldify','yieldify.com');
INSERT INTO "tracker_domains" VALUES('cdnetworks.net','cdnetworks.net');
INSERT INTO "tracker_domains" VALUES('komoona','komoona.com');
INSERT INTO "tracker_domains" VALUES('freewheel','fwmrm.net');
INSERT INTO "tracker_domains" VALUES('sortable','deployads.com');
INSERT INTO "tracker_domains" VALUES('sessioncam','sessioncam.com');
INSERT INTO "tracker_domains" VALUES('sessioncam','d2oh4tlt9mrke9.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('rambler','top100.ru');
INSERT INTO "tracker_domains" VALUES('sailthru_horizon','sail-horizon.com');
INSERT INTO "tracker_domains" VALUES('sailthru_horizon','sailthru.com');
INSERT INTO "tracker_domains" VALUES('datacaciques.com','datacaciques.com');
INSERT INTO "tracker_domains" VALUES('mediarithmics.com','mediarithmics.com');
INSERT INTO "tracker_domains" VALUES('clicktripz','clicktripz.com');
INSERT INTO "tracker_domains" VALUES('apicit.net','apicit.net');
INSERT INTO "tracker_domains" VALUES('microsoft','microsoftonline.com');
INSERT INTO "tracker_domains" VALUES('glomex.com','glomex.cloud');
INSERT INTO "tracker_domains" VALUES('voluum','voluumtrk3.com');
INSERT INTO "tracker_domains" VALUES('ampproject.org','ampproject.org');
INSERT INTO "tracker_domains" VALUES('deviantart.net','deviantart.net');
INSERT INTO "tracker_domains" VALUES('txxx.com','txxx.com');
INSERT INTO "tracker_domains" VALUES('uppr.de','uppr.de');
INSERT INTO "tracker_domains" VALUES('2app.lk','2app.lk');
INSERT INTO "tracker_domains" VALUES('get_site_control','getsitecontrol.com');
INSERT INTO "tracker_domains" VALUES('clicky','getclicky.com');
INSERT INTO "tracker_domains" VALUES('clicky','staticstuff.net');
INSERT INTO "tracker_domains" VALUES('msedge.net','msedge.net');
INSERT INTO "tracker_domains" VALUES('wikia_beacon','wikia-beacon.com');
INSERT INTO "tracker_domains" VALUES('aldi-international.com','aldi-international.com');
INSERT INTO "tracker_domains" VALUES('bigpoint','bigpoint.net');
INSERT INTO "tracker_domains" VALUES('bigpoint','bigpoint.com');
INSERT INTO "tracker_domains" VALUES('bigpoint','bpsecure.com');
INSERT INTO "tracker_domains" VALUES('rythmxchange','rhythmxchange.com');
INSERT INTO "tracker_domains" VALUES('stuff.com','stuff.com');
INSERT INTO "tracker_domains" VALUES('lenua.de','lenua.de');
INSERT INTO "tracker_domains" VALUES('lentainform.com','lentainform.com');
INSERT INTO "tracker_domains" VALUES('avail','avail.net');
INSERT INTO "tracker_domains" VALUES('ladies.de','ladies.de');
INSERT INTO "tracker_domains" VALUES('mps-gba.de','mps-gba.de');
INSERT INTO "tracker_domains" VALUES('twitch.tv','twitch.tv');
INSERT INTO "tracker_domains" VALUES('site24x7','site24x7rum.com');
INSERT INTO "tracker_domains" VALUES('olark','olark.com');
INSERT INTO "tracker_domains" VALUES('sirdata','sddan.com');
INSERT INTO "tracker_domains" VALUES('wdr.de','wdr.de');
INSERT INTO "tracker_domains" VALUES('sexiba.com','sexiba.com');
INSERT INTO "tracker_domains" VALUES('elba.at','elba.at');
INSERT INTO "tracker_domains" VALUES('tumblr_buttons','platform.tumblr.com');
INSERT INTO "tracker_domains" VALUES('fandommetrics.com','fandommetrics.com');
INSERT INTO "tracker_domains" VALUES('hotelreservation.com','hotelreservation.com');
INSERT INTO "tracker_domains" VALUES('netseer','netseer.com');
INSERT INTO "tracker_domains" VALUES('github','githubusercontent.com');
INSERT INTO "tracker_domains" VALUES('vivalu','vi-tag.net');
INSERT INTO "tracker_domains" VALUES('errorception','d15qhc0lu1ghnk.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('errorception','errorception.com');
INSERT INTO "tracker_domains" VALUES('iias.eu','iias.eu');
INSERT INTO "tracker_domains" VALUES('impact_radius','evyy.net');
INSERT INTO "tracker_domains" VALUES('impact_radius','impactradius.com');
INSERT INTO "tracker_domains" VALUES('impact_radius','r7ls.net');
INSERT INTO "tracker_domains" VALUES('impact_radius','ojrq.net');
INSERT INTO "tracker_domains" VALUES('impact_radius','7eer.net');
INSERT INTO "tracker_domains" VALUES('impact_radius','d3cxv97fi8q177.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('answers_cloud_service','answerscloud.com');
INSERT INTO "tracker_domains" VALUES('aniview.com','aniview.com');
INSERT INTO "tracker_domains" VALUES('onclickmax.com','onclickmax.com');
INSERT INTO "tracker_domains" VALUES('decibel_insight','decibelinsight.net');
INSERT INTO "tracker_domains" VALUES('adobe_tagmanager','adobetag.com');
INSERT INTO "tracker_domains" VALUES('overheat.it','overheat.it');
INSERT INTO "tracker_domains" VALUES('snowplow','playwire.com');
INSERT INTO "tracker_domains" VALUES('snowplow','dc8xl0ndzn2cb.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('snowplow','d346whrrklhco7.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('snowplow','d78fikflryjgj.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('psyma','psyma.com');
INSERT INTO "tracker_domains" VALUES('bauer_media','bauernative.com');
INSERT INTO "tracker_domains" VALUES('homeaway','homeaway.com');
INSERT INTO "tracker_domains" VALUES('perfect_audience','perfectaudience.com');
INSERT INTO "tracker_domains" VALUES('perfect_audience','prfct.co');
INSERT INTO "tracker_domains" VALUES('itineraire.info','itineraire.info');
INSERT INTO "tracker_domains" VALUES('revcontent','revcontent.com');
INSERT INTO "tracker_domains" VALUES('algolia.net','algolia.net');
INSERT INTO "tracker_domains" VALUES('zergnet','zergnet.com');
INSERT INTO "tracker_domains" VALUES('adskeeper','adskeeper.co.uk');
INSERT INTO "tracker_domains" VALUES('jivox','jivox.com');
INSERT INTO "tracker_domains" VALUES('basilic.io','basilic.io');
INSERT INTO "tracker_domains" VALUES('crosssell.info','crosssell.info');
INSERT INTO "tracker_domains" VALUES('hi-media_performance','adlink.net');
INSERT INTO "tracker_domains" VALUES('hi-media_performance','comclick.com');
INSERT INTO "tracker_domains" VALUES('hi-media_performance','hi-mediaserver.com');
INSERT INTO "tracker_domains" VALUES('hi-media_performance','himediads.com');
INSERT INTO "tracker_domains" VALUES('hi-media_performance','himediadx.com');
INSERT INTO "tracker_domains" VALUES('perform_group','performgroup.com');
INSERT INTO "tracker_domains" VALUES('kenshoo','xg4ken.com');
INSERT INTO "tracker_domains" VALUES('stepstone.com','stepstone.com');
INSERT INTO "tracker_domains" VALUES('clever_push','cleverpush.com');
INSERT INTO "tracker_domains" VALUES('urldelivery.com','urldelivery.com');
INSERT INTO "tracker_domains" VALUES('sim-technik.de','sim-technik.de');
INSERT INTO "tracker_domains" VALUES('recreativ','recreativ.ru');
INSERT INTO "tracker_domains" VALUES('polldaddy','polldaddy.com');
INSERT INTO "tracker_domains" VALUES('s3xified.com','s3xified.com');
INSERT INTO "tracker_domains" VALUES('pornhub','pornhub.com');
INSERT INTO "tracker_domains" VALUES('traveltainment.de','traveltainment.de');
INSERT INTO "tracker_domains" VALUES('microsoft','cloudapp.net');
INSERT INTO "tracker_domains" VALUES('msn','msn.com');
INSERT INTO "tracker_domains" VALUES('microsoft','azurewebsites.net');
INSERT INTO "tracker_domains" VALUES('intent_media','intentmedia.net');
INSERT INTO "tracker_domains" VALUES('rtl_group','rtl.de');
INSERT INTO "tracker_domains" VALUES('skadtec.com','skadtec.com');
INSERT INTO "tracker_domains" VALUES('nativo','ntv.io');
INSERT INTO "tracker_domains" VALUES('nativo','postrelease.com');
INSERT INTO "tracker_domains" VALUES('kaltura','kaltura.com');
INSERT INTO "tracker_domains" VALUES('effiliation','effiliation.com');
INSERT INTO "tracker_domains" VALUES('intimate_merger','im-apps.net');
INSERT INTO "tracker_domains" VALUES('barclaycard.de','barclaycard.de');
INSERT INTO "tracker_domains" VALUES('innogames.de','innogames.de');
INSERT INTO "tracker_domains" VALUES('districtm.io','districtm.io');
INSERT INTO "tracker_domains" VALUES('yandex.api','yandex.st');
INSERT INTO "tracker_domains" VALUES('xceler8.io','xceler8.io');
INSERT INTO "tracker_domains" VALUES('snacktv','snacktv.de');
INSERT INTO "tracker_domains" VALUES('trafficforce','trafficforce.com');
INSERT INTO "tracker_domains" VALUES('lucky_orange','luckyorange.net');
INSERT INTO "tracker_domains" VALUES('lacmp.net','lacmp.net');
INSERT INTO "tracker_domains" VALUES('rollbar','d37gvrvc0wt4s1.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('baur.de','baur.de');
INSERT INTO "tracker_domains" VALUES('vepxl1.net','vepxl1.net');
INSERT INTO "tracker_domains" VALUES('adwebster','adwebster.com');
INSERT INTO "tracker_domains" VALUES('clickonometrics','clickonometrics.pl');
INSERT INTO "tracker_domains" VALUES('realytics.io','realytics.io');
INSERT INTO "tracker_domains" VALUES('nativeads.com','nativeads.com');
INSERT INTO "tracker_domains" VALUES('proxistore.com','proxistore.com');
INSERT INTO "tracker_domains" VALUES('greentube.com','greentube.com');
INSERT INTO "tracker_domains" VALUES('heroku','herokuapp.com');
INSERT INTO "tracker_domains" VALUES('adzerk','adzerk.net');
INSERT INTO "tracker_domains" VALUES('lengow','lengow.com');
INSERT INTO "tracker_domains" VALUES('adworxs.net','adworxs.net');
INSERT INTO "tracker_domains" VALUES('jscache.com','jscache.com');
INSERT INTO "tracker_domains" VALUES('clickintext','clickintext.net');
INSERT INTO "tracker_domains" VALUES('tamedia.ch','tamedia.ch');
INSERT INTO "tracker_domains" VALUES('visible_measures','visiblemeasures.com');
INSERT INTO "tracker_domains" VALUES('visible_measures','viewablemedia.net');
INSERT INTO "tracker_domains" VALUES('gamedistribution.com','gamedistribution.com');
INSERT INTO "tracker_domains" VALUES('flattr_button','flattr.com');
INSERT INTO "tracker_domains" VALUES('sstatic.net','sstatic.net');
INSERT INTO "tracker_domains" VALUES('trustwave.com','trustwave.com');
INSERT INTO "tracker_domains" VALUES('siteimprove','siteimprove.com');
INSERT INTO "tracker_domains" VALUES('adtrue','adtrue.com');
INSERT INTO "tracker_domains" VALUES('1000mercis','mmtro.com');
INSERT INTO "tracker_domains" VALUES('ipg_mediabrands','mbww.com');
INSERT INTO "tracker_domains" VALUES('tradetracker','tradetracker.net');
INSERT INTO "tracker_domains" VALUES('adnologies','heias.com');
INSERT INTO "tracker_domains" VALUES('24-ads.com','24-ads.com');
INSERT INTO "tracker_domains" VALUES('pushnative.com','pushnative.com');
INSERT INTO "tracker_domains" VALUES('flag_counter','flagcounter.com');
INSERT INTO "tracker_domains" VALUES('dstillery','media6degrees.com');
INSERT INTO "tracker_domains" VALUES('office.net','office.net');
INSERT INTO "tracker_domains" VALUES('tinypass','tinypass.com');
INSERT INTO "tracker_domains" VALUES('mobtrks.com','mobtrks.com');
INSERT INTO "tracker_domains" VALUES('yoochoose.net','yoochoose.net');
INSERT INTO "tracker_domains" VALUES('cpmstar','cpmstar.com');
INSERT INTO "tracker_domains" VALUES('blink_new_media','bnmla.com');
INSERT INTO "tracker_domains" VALUES('acquia.com','acquia.com');
INSERT INTO "tracker_domains" VALUES('gravity_insights','grvcdn.com');
INSERT INTO "tracker_domains" VALUES('gravity_insights','gravity.com');
INSERT INTO "tracker_domains" VALUES('microsoft','s-microsoft.com');
INSERT INTO "tracker_domains" VALUES('padstm.com','padstm.com');
INSERT INTO "tracker_domains" VALUES('baynote_observer','baynote.net');
INSERT INTO "tracker_domains" VALUES('demandbase','demandbase.com');
INSERT INTO "tracker_domains" VALUES('stackpathdns.com','stackpathdns.com');
INSERT INTO "tracker_domains" VALUES('booking.com','booking.com');
INSERT INTO "tracker_domains" VALUES('optimatic','optimatic.com');
INSERT INTO "tracker_domains" VALUES('realytics','dcniko1cv0rz.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('vi','digitaltarget.ru');
INSERT INTO "tracker_domains" VALUES('livefyre','fyre.co');
INSERT INTO "tracker_domains" VALUES('livefyre','livefyre.com');
INSERT INTO "tracker_domains" VALUES('digiteka.net','digiteka.net');
INSERT INTO "tracker_domains" VALUES('research_now','researchnow.com');
INSERT INTO "tracker_domains" VALUES('rewe-static.de','rewe-static.de');
INSERT INTO "tracker_domains" VALUES('baidu_ads','baidu.com');
INSERT INTO "tracker_domains" VALUES('baidu_ads','baidustatic.com');
INSERT INTO "tracker_domains" VALUES('pixalate','adrta.com');
INSERT INTO "tracker_domains" VALUES('aidata.io','aidata.io');
INSERT INTO "tracker_domains" VALUES('mcafee_secure','ywxi.net');
INSERT INTO "tracker_domains" VALUES('mcafee_secure','scanalert.com');
INSERT INTO "tracker_domains" VALUES('livesportmedia.eu','livesportmedia.eu');
INSERT INTO "tracker_domains" VALUES('smi2.ru','smi2.ru');
INSERT INTO "tracker_domains" VALUES('vooxe.com','vooxe.com');
INSERT INTO "tracker_domains" VALUES('walmart','walmart.com');
INSERT INTO "tracker_domains" VALUES('mnet-ad.net','mnet-ad.net');
INSERT INTO "tracker_domains" VALUES('smi2.ru','smi2.net');
INSERT INTO "tracker_domains" VALUES('nice264.com','nice264.com');
INSERT INTO "tracker_domains" VALUES('vidazoo.com','vidazoo.com');
INSERT INTO "tracker_domains" VALUES('heap','d36lvucg9kzous.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('heap','heapanalytics.com');
INSERT INTO "tracker_domains" VALUES('kaloo.ga','kaloo.ga');
INSERT INTO "tracker_domains" VALUES('thevideo.me','thevideo.me');
INSERT INTO "tracker_domains" VALUES('layer-ad.org','layer-ad.org');
INSERT INTO "tracker_domains" VALUES('loop11','loop11.com');
INSERT INTO "tracker_domains" VALUES('spot.im','spot.im');
INSERT INTO "tracker_domains" VALUES('howtank.com','howtank.com');
INSERT INTO "tracker_domains" VALUES('sexadnetwork','sexad.net');
INSERT INTO "tracker_domains" VALUES('pushcrew','pushcrew.com');
INSERT INTO "tracker_domains" VALUES('swisscom','swisscom.ch');
INSERT INTO "tracker_domains" VALUES('spongecell','spongecell.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','getiton.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','pop6.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','adultfriendfinder.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','streamray.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','cams.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','amigos.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','board-books.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','facebookofsex.com');
INSERT INTO "tracker_domains" VALUES('friendfinder_network','nostringsattached.com');
INSERT INTO "tracker_domains" VALUES('netrk.net','netrk.net');
INSERT INTO "tracker_domains" VALUES('stroer_digital_media','stroeermediabrands.de');
INSERT INTO "tracker_domains" VALUES('cloud-media.fr','cloud-media.fr');
INSERT INTO "tracker_domains" VALUES('vizury','vizury.com');
INSERT INTO "tracker_domains" VALUES('performfeeds.com','performfeeds.com');
INSERT INTO "tracker_domains" VALUES('admized','admized.com');
INSERT INTO "tracker_domains" VALUES('sumologic.com','sumologic.com');
INSERT INTO "tracker_domains" VALUES('raygun','raygun.io');
INSERT INTO "tracker_domains" VALUES('yahoo_japan','yahoo.co.jp');
INSERT INTO "tracker_domains" VALUES('effective_measure','effectivemeasure.net');
INSERT INTO "tracker_domains" VALUES('bluelithium','bluelithium.com');
INSERT INTO "tracker_domains" VALUES('bluelithium','adrevolver.com');
INSERT INTO "tracker_domains" VALUES('adocean','adocean.pl');
INSERT INTO "tracker_domains" VALUES('amadeus.net','amadeus.net');
INSERT INTO "tracker_domains" VALUES('c1_exchange','c1exchange.com');
INSERT INTO "tracker_domains" VALUES('netbiscuits','netbiscuits.net');
INSERT INTO "tracker_domains" VALUES('expedia','expedia.com');
INSERT INTO "tracker_domains" VALUES('nonstop_consulting','trkme.net');
INSERT INTO "tracker_domains" VALUES('jumptap','jumptap.com');
INSERT INTO "tracker_domains" VALUES('mozilla.net','mozilla.net');
INSERT INTO "tracker_domains" VALUES('unister','unister-gmbh.de');
INSERT INTO "tracker_domains" VALUES('unister','unister-adservices.com');
INSERT INTO "tracker_domains" VALUES('underdog_media','udmserve.net');
INSERT INTO "tracker_domains" VALUES('wwwpromoter','wwwpromoter.com');
INSERT INTO "tracker_domains" VALUES('maxmind','maxmind.com');
INSERT INTO "tracker_domains" VALUES('aemediatraffic','hprofits.com');
INSERT INTO "tracker_domains" VALUES('rentalcars.com','rentalcars.com');
INSERT INTO "tracker_domains" VALUES('fstrk.net','fstrk.net');
INSERT INTO "tracker_domains" VALUES('toro','toroadvertisingmedia.com');
INSERT INTO "tracker_domains" VALUES('toro','toro-tags.com');
INSERT INTO "tracker_domains" VALUES('toro','toroadvertising.com');
INSERT INTO "tracker_domains" VALUES('content.ad','content.ad');
INSERT INTO "tracker_domains" VALUES('babator.com','babator.com');
INSERT INTO "tracker_domains" VALUES('algovid.com','algovid.com');
INSERT INTO "tracker_domains" VALUES('jetlore','jetlore.com');
INSERT INTO "tracker_domains" VALUES('feedbackify','feedbackify.com');
INSERT INTO "tracker_domains" VALUES('youboranqs01.com','youboranqs01.com');
INSERT INTO "tracker_domains" VALUES('flixmedia','flix360.com');
INSERT INTO "tracker_domains" VALUES('visualdna','visualdna.com');
INSERT INTO "tracker_domains" VALUES('visualdna','vdna-assets.com');
INSERT INTO "tracker_domains" VALUES('popcash','popcash.net');
INSERT INTO "tracker_domains" VALUES('f11-ads.com','f11-ads.com');
INSERT INTO "tracker_domains" VALUES('stumbleupon_widgets','stumbleupon.com');
INSERT INTO "tracker_domains" VALUES('stumbleupon_widgets','su.pr');
INSERT INTO "tracker_domains" VALUES('stumbleupon_widgets','stumble-upon.com');
INSERT INTO "tracker_domains" VALUES('spotify','scdn.co');
INSERT INTO "tracker_domains" VALUES('adgear','adgear.com');
INSERT INTO "tracker_domains" VALUES('adgear','adgrx.com');
INSERT INTO "tracker_domains" VALUES('extreme_tracker','extreme-dm.com');
INSERT INTO "tracker_domains" VALUES('leadplace','leadplace.fr');
INSERT INTO "tracker_domains" VALUES('infolinks','intextscript.com');
INSERT INTO "tracker_domains" VALUES('infolinks','infolinks.com');
INSERT INTO "tracker_domains" VALUES('eventim.com','eventim.com');
INSERT INTO "tracker_domains" VALUES('smartsupp_chat','smartsuppchat.com');
INSERT INTO "tracker_domains" VALUES('redtube.com','redtube.com');
INSERT INTO "tracker_domains" VALUES('adc_media','adc-serv.net');
INSERT INTO "tracker_domains" VALUES('hstrck.com','hstrck.com');
INSERT INTO "tracker_domains" VALUES('tracc.it','tracc.it');
INSERT INTO "tracker_domains" VALUES('walkme.com','walkme.com');
INSERT INTO "tracker_domains" VALUES('freshdesk','d36mpcpuzc4ztk.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('freshdesk','freshdesk.com');
INSERT INTO "tracker_domains" VALUES('forensiq','fqtag.com');
INSERT INTO "tracker_domains" VALUES('forensiq','securepaths.com');
INSERT INTO "tracker_domains" VALUES('spankcdn.net','spankcdn.net');
INSERT INTO "tracker_domains" VALUES('da-ads.com','da-ads.com');
INSERT INTO "tracker_domains" VALUES('truste_seal','privacy-policy.truste.com');
INSERT INTO "tracker_domains" VALUES('optimonk','optimonk.com');
INSERT INTO "tracker_domains" VALUES('seznam','imedia.cz');
INSERT INTO "tracker_domains" VALUES('oxomi.com','oxomi.com');
INSERT INTO "tracker_domains" VALUES('sas','sas.com');
INSERT INTO "tracker_domains" VALUES('sas','aimatch.com');
INSERT INTO "tracker_domains" VALUES('maxcdn','netdna-cdn.com');
INSERT INTO "tracker_domains" VALUES('gdm_digital','gdmdigital.com');
INSERT INTO "tracker_domains" VALUES('spots.im','spots.im');
INSERT INTO "tracker_domains" VALUES('adnetworkperformance.com','adnetworkperformance.com');
INSERT INTO "tracker_domains" VALUES('stackadapt','stackadapt.com');
INSERT INTO "tracker_domains" VALUES('ria.ru','ria.ru');
INSERT INTO "tracker_domains" VALUES('sse-iacapps.com','sse-iacapps.com');
INSERT INTO "tracker_domains" VALUES('afcdn.com','afcdn.com');
INSERT INTO "tracker_domains" VALUES('skyscnr.com','skyscnr.com');
INSERT INTO "tracker_domains" VALUES('imonomy','imonomy.com');
INSERT INTO "tracker_domains" VALUES('maru-edu','edigitalsurvey.com');
INSERT INTO "tracker_domains" VALUES('lswcdn.net','lswcdn.net');
INSERT INTO "tracker_domains" VALUES('bigpoint','bpcdn.net');
INSERT INTO "tracker_domains" VALUES('trustarc','truste.com');
INSERT INTO "tracker_domains" VALUES('adbetclickin.pink','adbetclickin.pink');
INSERT INTO "tracker_domains" VALUES('mytoys.de','mytoys.de');
INSERT INTO "tracker_domains" VALUES('videoadex.com','videoadex.com');
INSERT INTO "tracker_domains" VALUES('monster_advertising','monster.com');
INSERT INTO "tracker_domains" VALUES('atlassian.net','atlassian.net');
INSERT INTO "tracker_domains" VALUES('siteimprove_analytics','siteimproveanalytics.com');
INSERT INTO "tracker_domains" VALUES('mirtesen.ru','mirtesen.ru');
INSERT INTO "tracker_domains" VALUES('conrad.com','conrad.com');
INSERT INTO "tracker_domains" VALUES('upjers.com','upjers.com');
INSERT INTO "tracker_domains" VALUES('lenmit.com','lenmit.com');
INSERT INTO "tracker_domains" VALUES('semknox.com','semknox.com');
INSERT INTO "tracker_domains" VALUES('wiredminds','wiredminds.de');
INSERT INTO "tracker_domains" VALUES('yepshare.com','yepshare.com');
INSERT INTO "tracker_domains" VALUES('adglare.net','adglare.net');
INSERT INTO "tracker_domains" VALUES('enbrite.ly','enbrite.ly');
INSERT INTO "tracker_domains" VALUES('hivedx.com','hivedx.com');
INSERT INTO "tracker_domains" VALUES('spoods.io','spoods.io');
INSERT INTO "tracker_domains" VALUES('1und1','1and1.com');
INSERT INTO "tracker_domains" VALUES('audiencesquare.com','audiencesquare.com');
INSERT INTO "tracker_domains" VALUES('fidelity_media','fidelity-media.com');
INSERT INTO "tracker_domains" VALUES('adsnative','adsnative.com');
INSERT INTO "tracker_domains" VALUES('bitdefender.de','bitdefender.de');
INSERT INTO "tracker_domains" VALUES('sophus3','sophus3.com');
INSERT INTO "tracker_domains" VALUES('rightnowtech.com','rightnowtech.com');
INSERT INTO "tracker_domains" VALUES('shareaholic','dtym7iokkjlif.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('shareaholic','shareaholic.com');
INSERT INTO "tracker_domains" VALUES('wistia','wistia.com');
INSERT INTO "tracker_domains" VALUES('wistia','wistia.net');
INSERT INTO "tracker_domains" VALUES('motherlessmedia.com','motherlessmedia.com');
INSERT INTO "tracker_domains" VALUES('zooroyal.de','zooroyal.de');
INSERT INTO "tracker_domains" VALUES('sundaysky','sundaysky.com');
INSERT INTO "tracker_domains" VALUES('pardot','pardot.com');
INSERT INTO "tracker_domains" VALUES('qualaroo','qualaroo.com');
INSERT INTO "tracker_domains" VALUES('logsss.com','logsss.com');
INSERT INTO "tracker_domains" VALUES('internetstores.de','internetstores.de');
INSERT INTO "tracker_domains" VALUES('github','github.com');
INSERT INTO "tracker_domains" VALUES('post_affiliate_pro','postaffiliatepro.com');
INSERT INTO "tracker_domains" VALUES('guj.de','guj.de');
INSERT INTO "tracker_domains" VALUES('vtrtl.de','vtrtl.de');
INSERT INTO "tracker_domains" VALUES('deepintent.com','deepintent.com');
INSERT INTO "tracker_domains" VALUES('acuity_ads','acuityplatform.com');
INSERT INTO "tracker_domains" VALUES('outdooractive.com','outdooractive.com');
INSERT INTO "tracker_domains" VALUES('padsdel.com','padsdel.com');
INSERT INTO "tracker_domains" VALUES('bidswitch','exe.bid');
INSERT INTO "tracker_domains" VALUES('33across','33across.com');
INSERT INTO "tracker_domains" VALUES('slimcdn.com','slimcdn.com');
INSERT INTO "tracker_domains" VALUES('bigpoint','bigpoint-payment.com');
INSERT INTO "tracker_domains" VALUES('dantrack.net','dantrack.net');
INSERT INTO "tracker_domains" VALUES('first_impression','firstimpression.io');
INSERT INTO "tracker_domains" VALUES('pubnub.com','pubnub.com');
INSERT INTO "tracker_domains" VALUES('vindico_group','vindicosuite.com');
INSERT INTO "tracker_domains" VALUES('dynamic_1001_gmbh','dyntracker.de');
INSERT INTO "tracker_domains" VALUES('intelligent_reach','ist-track.com');
INSERT INTO "tracker_domains" VALUES('oracle_rightnow','rnengage.com');
INSERT INTO "tracker_domains" VALUES('cloudflare','cloudflare.com');
INSERT INTO "tracker_domains" VALUES('cloudflare','cloudflare.net');
INSERT INTO "tracker_domains" VALUES('spotify','spotify.com');
INSERT INTO "tracker_domains" VALUES('pulsepoint','pulsepoint.com');
INSERT INTO "tracker_domains" VALUES('akamai_technologies','abmr.net');
INSERT INTO "tracker_domains" VALUES('seeding_alliance','nativendo.de');
INSERT INTO "tracker_domains" VALUES('scarabresearch','scarabresearch.com');
INSERT INTO "tracker_domains" VALUES('valiton','vinsight.de');
INSERT INTO "tracker_domains" VALUES('signal','signal.co');
INSERT INTO "tracker_domains" VALUES('remintrex','remintrex.com');
INSERT INTO "tracker_domains" VALUES('maxcdn','maxcdn.com');
INSERT INTO "tracker_domains" VALUES('trafficfactory','trafficfactory.biz');
INSERT INTO "tracker_domains" VALUES('adsbookie','adsbookie.com');
INSERT INTO "tracker_domains" VALUES('zeusclicks','zeusclicks.com');
INSERT INTO "tracker_domains" VALUES('contentpass','contentpass.net');
INSERT INTO "tracker_domains" VALUES('contentpass','contentpass.de');
INSERT INTO "tracker_domains" VALUES('the_weather_company','weather.com');
INSERT INTO "tracker_domains" VALUES('youporn','youporn.com');
INSERT INTO "tracker_domains" VALUES('adpilot','erne.co');
INSERT INTO "tracker_domains" VALUES('adpilot','adpilot.at');
INSERT INTO "tracker_domains" VALUES('microsoft','microsoft.com');
INSERT INTO "tracker_domains" VALUES('innogames.de','innogames.com');
INSERT INTO "tracker_domains" VALUES('metapeople','mlsat02.de');
INSERT INTO "tracker_domains" VALUES('wetter_com','wetter.com');
INSERT INTO "tracker_domains" VALUES('tremor_video','tremorhub.com');
INSERT INTO "tracker_domains" VALUES('tremor_video','tremorvideo.com');
INSERT INTO "tracker_domains" VALUES('cdn77','cdn77.org');
INSERT INTO "tracker_domains" VALUES('cdn77','cdn77.com');
INSERT INTO "tracker_domains" VALUES('wywy.com','wywyuserservice.com');
INSERT INTO "tracker_domains" VALUES('mindspark','imgfarm.com');
INSERT INTO "tracker_domains" VALUES('mindspark','mindspark.com');
INSERT INTO "tracker_domains" VALUES('bonial','bonial.com');
INSERT INTO "tracker_domains" VALUES('bonial','bonialserviceswidget.de');
INSERT INTO "tracker_domains" VALUES('bonial','bonialconnect.com');
INSERT INTO "tracker_domains" VALUES('yieldr','254a.com');
INSERT INTO "tracker_domains" VALUES('zypmedia','extend.tv');
INSERT INTO "tracker_domains" VALUES('merkle_rkg','rkdms.com');
INSERT INTO "tracker_domains" VALUES('optomaton','volvelle.tech');
INSERT INTO "tracker_domains" VALUES('amazon_payments','payments-amazon.com');
INSERT INTO "tracker_domains" VALUES('google','google.dk');
INSERT INTO "tracker_domains" VALUES('bootstrap','bootstrapcdn.com');
INSERT INTO "tracker_domains" VALUES('jquery','jquery.com');
INSERT INTO "tracker_domains" VALUES('createjs','createjs.com');
INSERT INTO "tracker_domains" VALUES('jw_player','jwplayer.com');
INSERT INTO "tracker_domains" VALUES('jw_player','jwplatform.com');
INSERT INTO "tracker_domains" VALUES('jsdelivr','jsdelivr.net');
INSERT INTO "tracker_domains" VALUES('stroer_digital_media','interactivemedia.net');
INSERT INTO "tracker_domains" VALUES('stroer_digital_media','stroeerdigitalgroup.de');
INSERT INTO "tracker_domains" VALUES('stroer_digital_media','stroeerdp.de');
INSERT INTO "tracker_domains" VALUES('at_internet','aticdn.net');
INSERT INTO "tracker_domains" VALUES('batch_media','t4ft.de');
INSERT INTO "tracker_domains" VALUES('twitter','t.co');
INSERT INTO "tracker_domains" VALUES('ebay','classistatic.de');
INSERT INTO "tracker_domains" VALUES('ablida','ablida.de');
INSERT INTO "tracker_domains" VALUES('ablida','ablida.net');
INSERT INTO "tracker_domains" VALUES('t-mobile','telekom.com');
INSERT INTO "tracker_domains" VALUES('oms','oms.eu');
INSERT INTO "tracker_domains" VALUES('1und1','1und1.de');
INSERT INTO "tracker_domains" VALUES('1und1','uicdn.com');
INSERT INTO "tracker_domains" VALUES('advanced_hosters','ahcdn.com');
INSERT INTO "tracker_domains" VALUES('sap_xm','sap-xm.org');
INSERT INTO "tracker_domains" VALUES('amazon_associates','images-amazon.com');
INSERT INTO "tracker_domains" VALUES('kameleoon','kameleoon.eu');
INSERT INTO "tracker_domains" VALUES('icf_technology','nsimg.net');
INSERT INTO "tracker_domains" VALUES('burda','bf-tools.net');
INSERT INTO "tracker_domains" VALUES('addefend','yagiay.com');
INSERT INTO "tracker_domains" VALUES('permutive','permutive.com');
INSERT INTO "tracker_domains" VALUES('booking.com','bstatic.com');
INSERT INTO "tracker_domains" VALUES('burda_digital_systems','bstatic.de');
INSERT INTO "tracker_domains" VALUES('bild','bildstatic.de');
INSERT INTO "tracker_domains" VALUES('disqus','disquscdn.com');
INSERT INTO "tracker_domains" VALUES('rtl_group','static-fra.de');
INSERT INTO "tracker_domains" VALUES('rtl_group','technical-service.net');
INSERT INTO "tracker_domains" VALUES('bahn_de','img-bahn.de');
INSERT INTO "tracker_domains" VALUES('bahn_de','bahn.de');
INSERT INTO "tracker_domains" VALUES('ebay','ebaycommercenetwork.com');
INSERT INTO "tracker_domains" VALUES('t-mobile','toi.de');
INSERT INTO "tracker_domains" VALUES('aspnetcdn','aspnetcdn.com');
INSERT INTO "tracker_domains" VALUES('heimspiel','weltsport.net');
INSERT INTO "tracker_domains" VALUES('web.de','webde.de');
INSERT INTO "tracker_domains" VALUES('gujems','emsservice.de');
INSERT INTO "tracker_domains" VALUES('tisoomi','tisoomi-services.com');
INSERT INTO "tracker_domains" VALUES('circit','iqcontentplatform.de');
INSERT INTO "tracker_domains" VALUES('shopping_com','shoppingshadow.com');
INSERT INTO "tracker_domains" VALUES('eluxer_net','eluxer.net');
INSERT INTO "tracker_domains" VALUES('worldnaturenet_xyz','worldnaturenet.xyz');
INSERT INTO "tracker_domains" VALUES('tdsrmbl_net','tdsrmbl.net');
INSERT INTO "tracker_domains" VALUES('pizzaandads_com','pizzaandads.com');
INSERT INTO "tracker_domains" VALUES('wayfair_com','wayfair.com');
INSERT INTO "tracker_domains" VALUES('instagram_com','instagram.com');
INSERT INTO "tracker_domains" VALUES('immobilienscout24_de','immobilienscout24.de');
INSERT INTO "tracker_domains" VALUES('zalando_de','zalando.de');
INSERT INTO "tracker_domains" VALUES('gmx_net','gmx.net');
INSERT INTO "tracker_domains" VALUES('xvideos_com','xvideos.com');
INSERT INTO "tracker_domains" VALUES('blogspot_com','blogspot.com');
INSERT INTO "tracker_domains" VALUES('instagram_com','cdninstagram.com');
INSERT INTO "tracker_domains" VALUES('zalando_de','ztat.net');
INSERT INTO "tracker_domains" VALUES('gmx_net','gmxpro.net');
INSERT INTO "tracker_domains" VALUES('nerfherdersolo_com','nerfherdersolo.com');
INSERT INTO "tracker_domains" VALUES('immobilienscout24_de','static-immobilienscout24.de');
INSERT INTO "tracker_domains" VALUES('sentry','ravenjs.com');
INSERT INTO "tracker_domains" VALUES('sentry','sentry.io');
INSERT INTO "tracker_domains" VALUES('performio','performax.cz');
INSERT INTO "tracker_domains" VALUES('channel_pilot_solutions','cptrack.de');
INSERT INTO "tracker_domains" VALUES('schibsted','schibsted.com');
INSERT INTO "tracker_domains" VALUES('qubit','qubit.com');
INSERT INTO "tracker_domains" VALUES('qubit','d3c3cq33003psk.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('eroadvertising','eroadvertising.com');
INSERT INTO "tracker_domains" VALUES('schibsted','schibsted.io');
INSERT INTO "tracker_domains" VALUES('traffective','cdntrf.com');
INSERT INTO "tracker_domains" VALUES('traffective','traffective.com');
INSERT INTO "tracker_domains" VALUES('rawgit','rawgit.com');
INSERT INTO "tracker_domains" VALUES('opinary','opinary.com');
INSERT INTO "tracker_domains" VALUES('cloudinary','cloudinary.com');
INSERT INTO "tracker_domains" VALUES('jimdo.com','jimstatic.com');
INSERT INTO "tracker_domains" VALUES('king_com','midasplayer.com');
INSERT INTO "tracker_domains" VALUES('microsoft','gfx.ms');
INSERT INTO "tracker_domains" VALUES('blogspot_com','blogger.com');
INSERT INTO "tracker_domains" VALUES('distil_tag','distiltag.com');
INSERT INTO "tracker_domains" VALUES('radiumone','r1-cdn.net');
INSERT INTO "tracker_domains" VALUES('netletix','netzathleten-media.de');
INSERT INTO "tracker_domains" VALUES('openload','openload.co');
INSERT INTO "tracker_domains" VALUES('adgoal','smartadcheck.de');
INSERT INTO "tracker_domains" VALUES('snowplow','snplow.net');
INSERT INTO "tracker_domains" VALUES('q_division','q-divisioncdn.de');
INSERT INTO "tracker_domains" VALUES('netflix','nflxext.com');
INSERT INTO "tracker_domains" VALUES('hyvyd','hyvyd.com');
INSERT INTO "tracker_domains" VALUES('t-mobile','sdp-campaign.de');
INSERT INTO "tracker_domains" VALUES('cdnnetwok_xyz','cdnnetwok.xyz');
INSERT INTO "tracker_domains" VALUES('foxydeal_com','foxydeal.com');
INSERT INTO "tracker_domains" VALUES('webclicks24_com','webclicks24.com');
INSERT INTO "tracker_domains" VALUES('easylist_club','easylist.club');
INSERT INTO "tracker_domains" VALUES('propvideo_net','propvideo.net');
INSERT INTO "tracker_domains" VALUES('generaltracking_de','generaltracking.de');
INSERT INTO "tracker_domains" VALUES('atsfi_de','atsfi.de');
INSERT INTO "tracker_domains" VALUES('continum_net','continum.net');
INSERT INTO "tracker_domains" VALUES('freenet_de','freenet.de');
INSERT INTO "tracker_domains" VALUES('fontawesome_com','fontawesome.com');
INSERT INTO "tracker_domains" VALUES('idealo_com','idealo.com');
INSERT INTO "tracker_domains" VALUES('4finance_com','4finance.com');
INSERT INTO "tracker_domains" VALUES('ausgezeichnet_org','ausgezeichnet.org');
INSERT INTO "tracker_domains" VALUES('freegeoip_net','freegeoip.net');
INSERT INTO "tracker_domains" VALUES('adac_de','adac.de');
INSERT INTO "tracker_domains" VALUES('stailamedia_com','stailamedia.com');
INSERT INTO "tracker_domains" VALUES('crimsonhexagon_com','crimsonhexagon.com');
INSERT INTO "tracker_domains" VALUES('ehi-siegel_de','ehi-siegel.de');
INSERT INTO "tracker_domains" VALUES('s24_com','s24.com');
INSERT INTO "tracker_domains" VALUES('redblue_de','redblue.de');
INSERT INTO "tracker_domains" VALUES('tchibo_de','tchibo.de');
INSERT INTO "tracker_domains" VALUES('chefkoch_de','chefkoch.de');
INSERT INTO "tracker_domains" VALUES('freenet_de','freent.de');
INSERT INTO "tracker_domains" VALUES('crimsonhexagon_com','hexagon-analytics.com');
INSERT INTO "tracker_domains" VALUES('tchibo_de','tchibo-content.de');
INSERT INTO "tracker_domains" VALUES('zalando_de','zalan.do');
INSERT INTO "tracker_domains" VALUES('chefkoch_de','chefkoch-cdn.de');
INSERT INTO "tracker_domains" VALUES('iotec','dsp.io');
INSERT INTO "tracker_domains" VALUES('a3cloud_net','a3cloud.net');
INSERT INTO "tracker_domains" VALUES('maxonclick_com','maxonclick.com');
INSERT INTO "tracker_domains" VALUES('toponclick_com','toponclick.com');
INSERT INTO "tracker_domains" VALUES('westlotto_com','westlotto.com');
INSERT INTO "tracker_domains" VALUES('admedo_com','admedo.com');
INSERT INTO "tracker_domains" VALUES('adbrain','adbrn.com');
INSERT INTO "tracker_domains" VALUES('twitter_for_business','tellapart.com');
INSERT INTO "tracker_domains" VALUES('brightonclick.com','brightonclick.com');
INSERT INTO "tracker_domains" VALUES('voluum','cwkuki.com');
INSERT INTO "tracker_domains" VALUES('trustarc','trustarc.com');
INSERT INTO "tracker_domains" VALUES('xxxlshop.de','xxxlshop.de');
INSERT INTO "tracker_domains" VALUES('fyber','fyber.com');
INSERT INTO "tracker_domains" VALUES('eshopcomp.com','eshopcomp.com');
INSERT INTO "tracker_domains" VALUES('vodafone.de','vodafone.de');
INSERT INTO "tracker_domains" VALUES('davebestdeals.com','davebestdeals.com');
INSERT INTO "tracker_domains" VALUES('stathat','stathat.com');
INSERT INTO "tracker_domains" VALUES('ubersetzung-app.com','ubersetzung-app.com');
INSERT INTO "tracker_domains" VALUES('supership','socdm.com');
INSERT INTO "tracker_domains" VALUES('aemediatraffic','aemediatraffic.com');
INSERT INTO "tracker_domains" VALUES('insightexpress','insightexpressai.com');
INSERT INTO "tracker_domains" VALUES('platformone','impact-ad.jp');
INSERT INTO "tracker_domains" VALUES('adrom','adrom.net');
INSERT INTO "tracker_domains" VALUES('purch','servebom.com');
INSERT INTO "tracker_domains" VALUES('tumblr_analytics','sre-perim.com');
INSERT INTO "tracker_domains" VALUES('scoota','rockabox.co');
INSERT INTO "tracker_domains" VALUES('bitly','bit.ly');
INSERT INTO "tracker_domains" VALUES('programattik','programattik.com');
INSERT INTO "tracker_domains" VALUES('cardlytics','cardlytics.com');
INSERT INTO "tracker_domains" VALUES('digilant','wtp101.com');
INSERT INTO "tracker_domains" VALUES('site24x7','site24x7rum.eu');
INSERT INTO "tracker_domains" VALUES('shortnews','shortnews.de');
INSERT INTO "tracker_domains" VALUES('mrpdata','mrpdata.com');
INSERT INTO "tracker_domains" VALUES('mrpdata','mrpdata.net');
INSERT INTO "tracker_domains" VALUES('admedo_com','adizio.com');
INSERT INTO "tracker_domains" VALUES('pnamic.com','pnamic.com');
INSERT INTO "tracker_domains" VALUES('bumlam.com','bumlam.com');
INSERT INTO "tracker_domains" VALUES('fluct','adingo.jp');
INSERT INTO "tracker_domains" VALUES('interyield','ps7894.com');
INSERT INTO "tracker_domains" VALUES('adguard','adguard.com');
INSERT INTO "tracker_domains" VALUES('truoptik','truoptik.com');
INSERT INTO "tracker_domains" VALUES('digitrust','digitru.st');
INSERT INTO "tracker_domains" VALUES('adtheorent','adentifi.com');
INSERT INTO "tracker_domains" VALUES('narrative_io','narrative.io');
INSERT INTO "tracker_domains" VALUES('dcbap.com','dcbap.com');
INSERT INTO "tracker_domains" VALUES('brealtime','brealtime.com');
INSERT INTO "tracker_domains" VALUES('donationtools','donation-tools.org');
INSERT INTO "tracker_domains" VALUES('hooklogic','hlserve.com');
INSERT INTO "tracker_domains" VALUES('ividence','ivitrack.com');
INSERT INTO "tracker_domains" VALUES('comprigo','comprigo.com');
INSERT INTO "tracker_domains" VALUES('marvellous_machine','marvellousmachine.net');
INSERT INTO "tracker_domains" VALUES('adform','seadform.net');
INSERT INTO "tracker_domains" VALUES('afgr2.com','afgr2.com');
INSERT INTO "tracker_domains" VALUES('orc_international','emxdgt.com');
INSERT INTO "tracker_domains" VALUES('active_agent','active-agent.com');
INSERT INTO "tracker_domains" VALUES('yieldmo','yieldmo.com');
INSERT INTO "tracker_domains" VALUES('xvideos_com','xvideos-cdn.com');
INSERT INTO "tracker_domains" VALUES('pmddby.com','pmddby.com');
INSERT INTO "tracker_domains" VALUES('vinted','vinted.net');
INSERT INTO "tracker_domains" VALUES('typeform','typeform.com');
INSERT INTO "tracker_domains" VALUES('amazon_web_services','amazonwebservices.com');
INSERT INTO "tracker_domains" VALUES('amazon_web_services','awsstatic.com');
INSERT INTO "tracker_domains" VALUES('adthink','audienceinsights.net');
INSERT INTO "tracker_domains" VALUES('adthink','adthink.com');
INSERT INTO "tracker_domains" VALUES('onaudience','behavioralengine.com');
INSERT INTO "tracker_domains" VALUES('atlassian.net','d12ramskps3070.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('atlassian.net','atl-paas.net');
INSERT INTO "tracker_domains" VALUES('admachine','adx1.com');
INSERT INTO "tracker_domains" VALUES('brillen.de','brillen.de');
INSERT INTO "tracker_domains" VALUES('docler','awecr.com');
INSERT INTO "tracker_domains" VALUES('google','google.ru');
INSERT INTO "tracker_domains" VALUES('viralgains','viralgains.com');
INSERT INTO "tracker_domains" VALUES('capitaldata','kdata.fr');
INSERT INTO "tracker_domains" VALUES('akamoihd.net','akamoihd.net');
INSERT INTO "tracker_domains" VALUES('magnuum.com','magnuum.com');
INSERT INTO "tracker_domains" VALUES('adswizz','adswizz.com');
INSERT INTO "tracker_domains" VALUES('venturead.com','venturead.com');
INSERT INTO "tracker_domains" VALUES('adstir','ad-stir.com');
INSERT INTO "tracker_domains" VALUES('docler','fwbntw.com');
INSERT INTO "tracker_domains" VALUES('optinmonster','mstrlytcs.com');
INSERT INTO "tracker_domains" VALUES('optinmonster','optnmstr.com');
INSERT INTO "tracker_domains" VALUES('visualstudio.com','visualstudio.com');
INSERT INTO "tracker_domains" VALUES('storygize','storygize.net');
INSERT INTO "tracker_domains" VALUES('spoutable','spoutable.com');
INSERT INTO "tracker_domains" VALUES('petametrics','petametrics.com');
INSERT INTO "tracker_domains" VALUES('lucky_orange','luckyorange.com');
INSERT INTO "tracker_domains" VALUES('lucky_orange','livestatserver.com');
INSERT INTO "tracker_domains" VALUES('wikimedia.org','wikiquote.org');
INSERT INTO "tracker_domains" VALUES('advertserve','advertserve.com');
INSERT INTO "tracker_domains" VALUES('nano_interactive','audiencemanager.de');
INSERT INTO "tracker_domains" VALUES('94j7afz2nr.xyz','94j7afz2nr.xyz');
INSERT INTO "tracker_domains" VALUES('wordpress_ads','pubmine.com');
INSERT INTO "tracker_domains" VALUES('tubecorporate','tubecorporate.com');
INSERT INTO "tracker_domains" VALUES('t-mobile','telekom-dienste.de');
INSERT INTO "tracker_domains" VALUES('contact_impact','c-i.as');
INSERT INTO "tracker_domains" VALUES('google','google.fi');
INSERT INTO "tracker_domains" VALUES('google','google.com.ua');
INSERT INTO "tracker_domains" VALUES('google','google.se');
INSERT INTO "tracker_domains" VALUES('google','google.com.au');
INSERT INTO "tracker_domains" VALUES('google','google.no');
INSERT INTO "tracker_domains" VALUES('google','google.cz');
INSERT INTO "tracker_domains" VALUES('google','google.pt');
INSERT INTO "tracker_domains" VALUES('google','google.co.in');
INSERT INTO "tracker_domains" VALUES('google','google.hu');
INSERT INTO "tracker_domains" VALUES('google','google.ro');
INSERT INTO "tracker_domains" VALUES('google','google.rs');
INSERT INTO "tracker_domains" VALUES('google','google.tn');
INSERT INTO "tracker_domains" VALUES('google','google.com.mx');
INSERT INTO "tracker_domains" VALUES('google','google.com.tr');
INSERT INTO "tracker_domains" VALUES('ownpage','ownpage.fr');
INSERT INTO "tracker_domains" VALUES('dianomi','dianomi.com');
INSERT INTO "tracker_domains" VALUES('dianomi','dianomioffers.co.uk');
INSERT INTO "tracker_domains" VALUES('dianomi','d3von6il1wr7wo.cloudfront.net');
INSERT INTO "tracker_domains" VALUES('bitrix','bitrix.info');
INSERT INTO "tracker_domains" VALUES('bitrix','bitrix.ru');
INSERT INTO "tracker_domains" VALUES('wirecard','wirecard.com');
INSERT INTO "tracker_domains" VALUES('wirecard','wirecard.de');
INSERT INTO "tracker_domains" VALUES('segmento','rutarget.ru');
INSERT INTO "tracker_domains" VALUES('datonics','pro-market.net');
INSERT INTO "tracker_domains" VALUES('jivochat','jivosite.com');
INSERT INTO "tracker_domains" VALUES('impact_radius','impactradius-tag.com');
INSERT INTO "tracker_domains" VALUES('airbnb','musthird.com');
INSERT INTO "tracker_domains" VALUES('widespace','widespace.com');
INSERT INTO "tracker_domains" VALUES('platform360','pfrm.co');
INSERT INTO "tracker_domains" VALUES('kaeufersiegel.de','kaeufersiegel.de');
INSERT INTO "tracker_domains" VALUES('alexa_metrics','alexametrics.com');
INSERT INTO "tracker_domains" VALUES('xing','xing.com');
INSERT INTO "tracker_domains" VALUES('mapbox','mapbox.com');
INSERT INTO "tracker_domains" VALUES('startapp','startappservice.com');
INSERT INTO "tracker_domains" VALUES('ipify','ipify.org');
INSERT INTO "tracker_domains" VALUES('yahoo','yimg.jp');
INSERT INTO "tracker_domains" VALUES('keywee','keywee.co');
INSERT INTO "tracker_domains" VALUES('expedia','trvl-px.com');
INSERT INTO "tracker_domains" VALUES('rtbsuperhub.com','rtbsuperhub.com');
INSERT INTO "tracker_domains" VALUES('bebi','bebi.com');
INSERT INTO "tracker_domains" VALUES('smarter_travel','smartertravel.com');
INSERT INTO "tracker_domains" VALUES('giphy.com','giphy.com');
CREATE TABLE "trackers" (
	`id`	TEXT NOT NULL UNIQUE,
	`name`	TEXT NOT NULL,
	`description`	TEXT,
	`category_id`	INTEGER,
	`website_url`	TEXT,
	`logo_url`	TEXT,
	`company_id`	TEXT,
	`ghostery_id`	TEXT,
	`notes`	TEXT,
	FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
	FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`)
);
INSERT INTO "trackers" VALUES('google_analytics','Google Analytics','Enterprise-class web analytics made smarter, friendlier and free.

Google Analytics is the enterprise-class web analytics solution that gives you rich insights into your website traffic and marketing effectiveness. Powerful, flexible and easy-to-use features now let you see and analyze your traffic data in an entirely new way. With Google Analytics, you''re more prepared to write better-targeted ads, strengthen your marketing initiatives and create higher converting websites.

Google Analytics shows you how people found your site, how they explored it, and how you can enhance their visitor experience. With this information, you can improve your website return on investment, increase conversions, and make more money on the web.',6,'http://www.google.com/analytics/','http://cdn.betteradvertising.com/logos/googleanalytics.png','google','13',NULL);
INSERT INTO "trackers" VALUES('doubleclick','DoubleClick','DoubleClick is a provider of digital marketing technology and services. The world''s top marketers, publishers and agencies utilize DoubleClick''s expertise in ad serving, rich media, video, search and affiliate marketing to help them make the most of the digital medium.',4,'http://www.doubleclick.com','http://cdn.betteradvertising.com/logos/doubleclick.png','google','41',NULL);
INSERT INTO "trackers" VALUES('google','Google',NULL,4,NULL,NULL,'google','c_82',NULL);
INSERT INTO "trackers" VALUES('googleapis.com','Google APIs',NULL,9,'https://www.googleapis.com/',NULL,'google','googleapis.com',NULL);
INSERT INTO "trackers" VALUES('google_tag_manager','Google Tag Manager','Google operates an Internet search engine, offering targeted search results from billions of web pages. Results are based on a proprietary algorithm called PageRank, and advertisers deliver relevant ads targeted to search queries or Web content. The Google Network is a network of third-party customers that use Google''s ad programs to deliver relevant ads to their own sites. Google subsidiaries include YouTube and DoubleClick.',5,'http://www.google.com','http://cdn.betteradvertising.com/logos/google.png','google','1283',NULL);
INSERT INTO "trackers" VALUES('facebook','Facebook',NULL,4,NULL,NULL,'facebook','2491',NULL);
INSERT INTO "trackers" VALUES('infonline','INFOnline','INFOnline - The standard of online measurement!

True to our motto since 2002 we deliver the standardized measurement categories for the utilization of websites in Germany. True to our motto we deliver since 2002 the standardised measurement categories for the utilization of websites in Germany. In doing so we focus on the unitary standards of the community information to determine the distribution of advertising media (IVW) and the Association of Online Research (AGOF). In doing so we focus on the unitary standards of the Informationsgemeinschaft zur Feststellung der Verbreitung von Werbeträgern (IVW) and the Arbeitsgemeinschaft Online-Forschung (AGOF).

The INFO line of services include: The services of INFOnline include:

    * The counting and measurement of page impressions on open websites which are delivered by the http protocol, with the proved Scalable centralized measuring system (SZM). The counting and measurement of page impressions on open websites which are delivered by the http protocol, with the proved scaleable centralised measuring system (SZM).
    * The counting and measurement of page impressions on ssl-encrypted websites which use the https protocol with the SZM plus the interconnected offloader ssl (https which translates the requests into http requests and therefore makes them measurable for the SZM). The counting and measurement of page impressions on ssl-encrypted websites which use the https protocol with the SZM plus the interconnected ssl-offloader (which translates the https requests into http requests and therefore makes them measurable for the SZM).
    * The controlling of the use of websites: Which contents were used by how many visitors for how long? The controlling of the utilisation of websites: Which contents were used by how many visitors for how long? For the analysis of websites we use our website Controlling Cockpit (WCC), that is based on the analysis proved platform "Heatmap" developed by spring. For the analysis of websites we use our Website-Controlling-Cockpit (WCC), that is based on the proved analysis platform "HEATMAP" developed by spring. ',6,'http://www2.infonline.de/','http://cdn.betteradvertising.com/logos/infoonline.png','infonline','223',NULL);
INSERT INTO "trackers" VALUES('google_adservices','Google AdServices',NULL,4,NULL,NULL,'google','2276',NULL);
INSERT INTO "trackers" VALUES('google_syndication','Google Syndication',NULL,4,NULL,NULL,'google','2277',NULL);
INSERT INTO "trackers" VALUES('amazon_web_services','Amazon Web Services',NULL,10,NULL,NULL,'amazon_associates','c_480',NULL);
INSERT INTO "trackers" VALUES('criteo','Criteo','Criteo provides predictive tools on user''s tastes and behaviors. Our tool opens a whole range of new ways to increase e-commerce long tail issues and social networks.',4,'http://www.criteo.com/','http://cdn.betteradvertising.com/logos/criteo.png','criteo','64',NULL);
INSERT INTO "trackers" VALUES('appnexus','AppNexus','Editior''s note: Currently in Stealth Mode.',4,'http://www.appnexus.com/','http://cdn.betteradvertising.com/logos/appnexus.png','appnexus','170',NULL);
INSERT INTO "trackers" VALUES('adition','Adition','Adition Technologies provides ad serving technology.  Their flagship product, ADITION adserving delivers, reports and analyzes users’ behavior after an ad has been served to a user. With ADITION adserving, clients have a single solution for display, mobile and video advertising.',4,'http://en.adition.com/','http://cdn.betteradvertising.com/logos/aditiontechnologiesag.png','adition_technologies_ag','612',NULL);
INSERT INTO "trackers" VALUES('amazon_associates','Amazon Associates','The Amazon Associates Web Service allows you to advertise millions of new and used products more efficiently on your web site, while earning referral fees. The Service exposes Amazon''s product data through an easy-to-use web services interface that is a powerful tool to help Amazon Associate website owners and developers to make money. Associates can now easily build rich and highly effective applications that advertise Amazon products and earn referral fees for driving traffic back to Amazon''s web sites or sales of Amazon products and services.',4,'http://aws.amazon.com/associates/','http://cdn.betteradvertising.com/logos/amazonassociates.png','amazon_associates','33',NULL);
INSERT INTO "trackers" VALUES('adform','Adform','Adform is an integrated online marketing platform that combines media planning, ad serving, search engines, web analytics and reporting in one system. The  platform facilitates tracking of entire websites as well as spotlight tracking of selected web pages to give a thorough view into the effectiveness of marketing campaigns.',4,'http://www.adform.com','http://cdn.betteradvertising.com/logos/adform.png','adform','609',NULL);
INSERT INTO "trackers" VALUES('scorecard_research_beacon','ScoreCard Research Beacon','VoiceFive Networks is a market research company that studies and reports on trends and behavior across a wide variety of topics. VoiceFive Networks is commissioned to conduct research on numerous topics of concern to industry leaders in diverse fields, including travel, pharmaceuticals, and publishing.

We protect the anonymity and privacy of our survey participants, in accordance with leading privacy regulations. VoiceFive Networks does not provide personally identifiable information (PII) about survey participants to our clients, and we do not deliver – or facilitate the delivery of – advertising messages to survey participants.

VoiceFive Network''s surveys and other market research studies are used to compile reports that allow companies across industries to improve their services by better understanding the likes and dislikes of consumers. Marketers employ VoiceFive Networks to carry out a variety of projects including attitude and usage studies, discrete choice analyses and recall studies, just to name a few.

Editors Note: Comscore Beacon operates under multiple stealth names such as VoiceFive Networks and Secure Studies.',4,'http://www.voicefive.com/','http://cdn.betteradvertising.com/logos/fullcirclestudies.png','comscore','187',NULL);
INSERT INTO "trackers" VALUES('optimizely','Optimizely',NULL,6,NULL,NULL,NULL,'c_881',NULL);
INSERT INTO "trackers" VALUES('twitter','Twitter','Twitter is a service used to communicate and stay connected through the exchange of quick, frequent online and mobile messages. People write short updates, often called "Tweets" of 140 characters or fewer. These messages are dynamically posted to a Twitter profile or a blog and sent to your followers ',7,'https://twitter.com','http://cdn.betteradvertising.com/logos/twitter.png','twitter','c_174',NULL);
INSERT INTO "trackers" VALUES('kaspersky-labs.com','Kaspersky Labs',NULL,12,NULL,NULL,NULL,'kaspersky-labs.com',NULL);
INSERT INTO "trackers" VALUES('bing_ads','Bing Ads','With Microsoft search advertising, you create your adCenter account, define your target market, and set an ad budget. You can easily import your search campaign, pay on a cost-per-click (CPC) basis, and access over 40 million unique users.',4,'https://adcenter.microsoft.com/','http://cdn.betteradvertising.com/logos/microsoftadcenter.png','microsoft_advertising','67',NULL);
INSERT INTO "trackers" VALUES('openx','OpenX','OpenX is a popular free ad server used to manage the advertising on over 100,000 websites in more than 100 countries around the world.',4,'http://www.openx.org/','http://cdn.betteradvertising.com/logos/openx.png','openx','32',NULL);
INSERT INTO "trackers" VALUES('youtube','YouTube',NULL,0,NULL,NULL,'google','2303',NULL);
INSERT INTO "trackers" VALUES('the_adex','The ADEX',NULL,4,'http://www.theadex.com/','http://cdn.betteradvertising.com/logos/theadex.png','the_adex','2141',NULL);
INSERT INTO "trackers" VALUES('yieldlab','Yieldlab','Yieldlab develops the operating system for real-time trading and execution of advertising in digital channels. They support Web sites, marketers, media companies and publishers, their relationship with agencies and advertisers to intensify and become more efficient.',4,'http://www.yieldlab.de/','http://cdn.betteradvertising.com/logos/yieldlab.png','yieldlab','819',NULL);
INSERT INTO "trackers" VALUES('rubicon','Rubicon','Based in Los Angeles, the Rubicon Project launched in 2007 on a mission to automate the $65 billion global online advertising industry. Responding to one of the largest problems plaguing website publishers today – monetizing ad space that goes unsold (as much as 70 - 80 percent) across a fast-growing number of global ad networks – the Rubicon Project pioneered the category of Ad Network Optimization (ANO).',4,'http://rubiconproject.com/','http://cdn.betteradvertising.com/logos/rubicon.png','rubicon_project','60',NULL);
INSERT INTO "trackers" VALUES('nugg.ad','Nugg.Ad','With Predictive Behavioural Targeting, we bring advertisers and their customers together on Internet platforms; this creates added value for all parties concerned. Our system delivers advertising where it is best suited \u2013 and where it is noticed.  We have an unqualified obligation to adhere to the basic principles of informational autonomy and data protection.

Please call us if you have any questions about nugg.ad, Predictive Behavioural Targeting or our data-protection philosophy.',4,'http://www.nugg.ad/','http://cdn.betteradvertising.com/logos/nuggad.png','nugg.ad','30',NULL);
INSERT INTO "trackers" VALUES('tradedesk','TradeDesk','The Trade Desk is a buying platform for digital media. Its flagship product, The DESK, enables marketers to buy display media similarly to the way SEMs buy search. The platform provides stand alone tracking and reporting, which empowers marketers with a holistic view of the purchase funnel. The Trade Desk also enables data rights management, protecting data for marketers so they can monetize and reuse data safely without risk.',4,'http://www.thetradedesk.com/','http://cdn.betteradvertising.com/logos/thetradedesk.png','the_trade_desk','579',NULL);
INSERT INTO "trackers" VALUES('tealium','Tealium','Tealium is a provider of tag management technology. The Tealium Universal Tag is a simplified tag that can work with various combinations of web analytics and digital marketing solution providers. Their translation engine lets non-technical, web analytics practitioners map the collected data into vendor-specific values, and send the data to any number of web analytics tools. ',5,'http://www.tealium.com/','http://cdn.betteradvertising.com/logos/tealium.png','tealium','505',NULL);
INSERT INTO "trackers" VALUES('adobe_audience_manager','Adobe Audience Manager','Demdex is a data management solutions company. SegmentID is a data capture and segmentation solution while AdPACT, provides clients with privacy management tools. In addition, DexClarity integrates the behavioral bank of customized user segments, including management of third party data bought from data exchanges and various sellers, for online marketing efforts.',4,'http://www.demdex.com/','http://cdn.betteradvertising.com/logos/demdex.png','adobe','354',NULL);
INSERT INTO "trackers" VALUES('pubmatic','PubMatic','PubMatic, Inc. provides ad optimization solutions to online publishers. It provides publishers with a single interface to integrate with multiple ad networks and exchanges selecting the most lucrative ads available on a real-time auction basis.',4,'http://www.pubmatic.com/','http://cdn.betteradvertising.com/logos/pubmatic.png','pubmatic','333',NULL);
INSERT INTO "trackers" VALUES('index_exchange_','Index Exchange','Casale Media provides advertisers with direct access to the highest quality media inventory on the web. We supplement our media offering with a comprehensive suite of technologies and services that deliver, track and optimize online advertising campaigns for maximum response. Whether your goal is to increase brand lift or to generate on-the-spot sales, we can put together a media program that is precisely crafted to your needs',4,'http://www.casalemedia.com/','http://cdn.betteradvertising.com/logos/casalemedia.png','index_exchange','135',NULL);
INSERT INTO "trackers" VALUES('new_relic','New Relic','Your real-time performance dashboard',6,'http://newrelic.com/','http://newrelic.com/images/logo/new-relic-logo.png','new_relic','614',NULL);
INSERT INTO "trackers" VALUES('addthis','AddThis','The AddThis button spreads your content across the Web by making it easier for your visitors to bookmark and share it with other people, again... and again... and again. This simple yet powerful button is very easy to install and provides valuable Analytics about the bookmarking and sharing activity of your users. AddThis helps your visitors create a buzz for your site and increase its popularity and ranking.',4,'http://www.addthis.com/','http://cdn.betteradvertising.com/logos/addthis.png','oracle','55',NULL);
INSERT INTO "trackers" VALUES('akamai_technologies','Akamai Technologies',NULL,6,NULL,NULL,'akamai','c_11',NULL);
INSERT INTO "trackers" VALUES('mediamath','MediaMath','MediaMath provides technology, strategy, services and insights to trade effectively across the leading display advertising exchanges on behalf of major advertisers. Its TerminalOne™ technology platform combines proprietary supply relationships, programmatic buying algorithms, unique data access, workflow tools and transparent reporting to facilitate digital media trading.',4,'http://www.mediamath.com/','http://cdn.betteradvertising.com/logos/mediamath.png','mediamath','425',NULL);
INSERT INTO "trackers" VALUES('xplosion','xplosion','"The intelligent retargeting mix developed by xplosion interactive under the name of xretarget unites brand-strategic applicability with user-sensitivity."',4,'http://www.xplosion.de/','http://cdn.betteradvertising.com/logos/xplosion.png','xplosion_interactive','892',NULL);
INSERT INTO "trackers" VALUES('meetrics','Meetrics','Meetrics is a web analytics provider in the field of algorithmic real-time measurement of ''attention'' on Internet sites. Meetrics supports online media with live reports and usage analysis based on the visibility of web content in the publication of news and optimization of online marketing activities.',4,'http://www.meetrics.de/','http://cdn.betteradvertising.com/logos/meetrics.png','meetrics','709',NULL);
INSERT INTO "trackers" VALUES('media_innovation_group','Media Innovation Group','The Media Innovation Group (MIG) develops technology products focused on digital media acquisition, optimization, and measurement. Their key technology includes ZAP (Zeus Advertising Platform), an integration and analytics tool that give advertisers visibility on ad campaign performance.  B3, is the agency tool for media acquisition and optimization of display advertising., Media Innovation Group is a WPP company.',4,'http://www.themig.com/','http://cdn.betteradvertising.com/logos/mediainnovationgroup.png','media_innovation_group','439',NULL);
INSERT INTO "trackers" VALUES('bluekai','BlueKai','By aggregating valuable shopping and research behaviors across the Internet, BlueKai is building the world''s largest database of intentions.

The BlueKai Data Exchange enables partners to buy and own data to boost ad targeting across any media. Publishers can also participate as data sellers to increase revenue in a privacy friendly way. Unlike ad networks, BlueKai does not sell ads or impressions. Our goal is to create a more effective online marketing approach that is driven by intent data and advocacy for consumer participation.

The result? A harmonious equation where effective and profitable marketing becomes a polite answer to a consumer need.',4,'http://www.bluekai.com/','http://cdn.betteradvertising.com/logos/bluekai.png','oracle','116',NULL);
INSERT INTO "trackers" VALUES('exactag','Exactag',NULL,4,'http://www.exactag.com','http://','exactag','1680',NULL);
INSERT INTO "trackers" VALUES('google_users','Google CDN',NULL,9,NULL,NULL,'google','2333',NULL);
INSERT INTO "trackers" VALUES('adomik','Adomik',NULL,4,NULL,NULL,NULL,'c_m2',NULL);
INSERT INTO "trackers" VALUES('adobe_dynamic_tag_management','Adobe Dynamic Tag Management',NULL,5,NULL,NULL,'adobe','2307',NULL);
INSERT INTO "trackers" VALUES('united_internet_media_gmbh','United Internet Media GmbH',NULL,4,NULL,NULL,'united_internet','c_m4',NULL);
INSERT INTO "trackers" VALUES('emetriq','emetriq',NULL,4,NULL,NULL,'emetriq','2300',NULL);
INSERT INTO "trackers" VALUES('adtech','ADTECH','Headquartered in Frankfurt (Germany), the company''s flagship product is an integrated ad serving platform - amended by features for mobile devices and video ads. These enable web publishers to manage, serve and evaluate virtually any kind of online advertising campaigns. ADTECH allows its customers to enhance efficiency, reliability and ROI in their online advertising businesses. Globally, ADTECH AG, founded in 1998 works with customers in more than 40 countries.',6,'http://www.adtechus.com/','http://cdn.betteradvertising.com/logos/adtech.png','verizon','355',NULL);
INSERT INTO "trackers" VALUES('outbrain','Outbrain',NULL,8,NULL,NULL,'outbrain','c_134',NULL);
INSERT INTO "trackers" VALUES('hotjar','Hotjar',NULL,6,'http://www.hotjar.com/','http://','hotjar','2199',NULL);
INSERT INTO "trackers" VALUES('atlas','Atlas','',4,'https://atlassolutions.com','http://cdn.betteradvertising.com/logos/microsoftadcenter.png','facebook','185',NULL);
INSERT INTO "trackers" VALUES('at_internet','AT Internet','Editor''s Note: XiTi is now known as AT Internet.

AT Internet is an independent and trustworthy company that enables an integral analysis of websites, intranet and mobile sites.  It has provided real time, Online Intelligence Solutions since 1995. Thanks to its technology and integrity, it has enabled Web Analytics to evolve into decision making solutions: Online Intelligence systems.

',6,'http://www.xiti.com/','http://cdn.betteradvertising.com/logos/xiti.png','at_internet','50',NULL);
INSERT INTO "trackers" VALUES('aggregate_knowledge','Aggregate Knowledge','Aggregate Knowledge is an audience management and ad serving technology platform focused on assisting advertisers to optimize their creative briefs and manage their audience segments under one roof. Provides a personalized discovery solution that collects, aggregates, and analyzes the anonymous click-stream data from publisher and retailer websites to personalize marketing interactions via on site widgets, emails, and display ads. The same data is used with ad serving logs, click-through, view-through, and conversion data for the purpose of re-targeting past site visitors with personalized ads and delivering site and campaign analytics to advertisers and site owners.',4,'http://www.aggregateknowledge.com/','http://cdn.betteradvertising.com/logos/aggregateknowledge.png','neustar','400',NULL);
INSERT INTO "trackers" VALUES('yahoo','Yahoo!',NULL,6,NULL,NULL,'verizon','c_253',NULL);
INSERT INTO "trackers" VALUES('trusted_shops','Trusted Shops',NULL,6,NULL,NULL,'trusted_shops','2816',NULL);
INSERT INTO "trackers" VALUES('taboola','Taboola','',4,'http://www.taboola.com','http://cdn.betteradvertising.com/logos/taboola.png','taboola','951',NULL);
INSERT INTO "trackers" VALUES('smart_adserver','SMART AdServer','Smart AdServer develops and markets ad serving technologies for the management of online campaigns for media agencies and publishers. They provide publishers, ad networks, agencies and advertisers with an integrated display, video, rich-media and mobile ad serving solution. Smart  AdServer is a subsidiary of the Axel Springer Group.',4,'http://www.smartadserver.co.uk/','http://cdn.betteradvertising.com/logos/smartadserver.png','smart_adserver','502',NULL);
INSERT INTO "trackers" VALUES('quantcast','Quantcast','Quantcast is a new breed of audience service, focused on helping buyers and sellers quantify the real-time characteristics of digital media consumers against which they can activate addressable advertising solutions. Quantcast provides publishers, marketers and agencies unmatched capabilities to measure, organize, discover and transact based on directly-measured traffic and inferred audience data.',4,'http://www.quantcast.com/','http://cdn.betteradvertising.com/logos/quantcast.png','quantcast','16',NULL);
INSERT INTO "trackers" VALUES('adality_gmbh','adality GmbH',NULL,4,NULL,NULL,NULL,'c_m6',NULL);
INSERT INTO "trackers" VALUES('omniture__adobe_analytics_','Omniture (Adobe Analytics)','Omniture SiteCatalyst® provides marketers with actionable, real-time intelligence about online strategies and marketing initiatives. SiteCatalyst helps marketers quickly identify the most profitable paths through their Web site, determine where visitors are navigating away from their site, and identify critical success metrics for online marketing campaigns. SiteCatalyst is part of the Omniture Online Business Optimization Suite.',6,'http://www.omniture.com/en/','http://cdn.betteradvertising.com/logos/omniture.png','adobe','19',NULL);
INSERT INTO "trackers" VALUES('yandex','Yandex',NULL,4,NULL,NULL,'yandex','2686',NULL);
INSERT INTO "trackers" VALUES('contact_impact','Contact Impact',NULL,4,'https://www.contactimpact.de/',NULL,'axel_springer','2976',NULL);
INSERT INTO "trackers" VALUES('mbr_targeting','mbr targeting',NULL,4,NULL,NULL,'stroer','c_2782',NULL);
INSERT INTO "trackers" VALUES('krux_digital','Krux Digital','Krux Digital help websites responsibly manage and make profitable use of consumer data by capturing, protecting, connecting and monetizing consumer cookie information across devices, sources and formats.  Their technology is powered by real-time algorithms to ensure scalability, optimization, tracking, and management on the exchange of data across multiple devices, sources, and formats. Krux Digital also helps consumers gain confidence that websites are operating transparently to ensure data use is consistent with consumer interests and regulatory requirements.',4,'http://kruxdigital.com/','http://cdn.betteradvertising.com/logos/kruxdigital.png','salesforce','378',NULL);
INSERT INTO "trackers" VALUES('pinterest','Pinterest','Profile in Progress',7,'http://pinterest.com/','http://cdn.betteradvertising.com/logos/pinterest.png','pinterest','868',NULL);
INSERT INTO "trackers" VALUES('adscale','AdScale','AdScale is a German real-time marketplace for online advertising, bringing advertisers and website providers (publishers) together.',4,'http://www.adscale.de/','http://cdn.betteradvertising.com/logos/adscale.png','stroer','277',NULL);
INSERT INTO "trackers" VALUES('moat','Moat',NULL,4,'http://www.moat.com/','','oracle','1453',NULL);
INSERT INTO "trackers" VALUES('sizmek','Sizmek','MediaMind is a global provider of digital advertising solutions that optimize the use of media, creative and data for enhanced performance.  Our unique platform incorporates display ad serving, search, rich media, video, dynamic ads, mobile and emerging media; providing marketers with a cross-channel view of ad campaigns. Our leading Eyeblaster Rich Media and Video capabilities service the most innovative and inspiring global digital campaigns.',4,'http://www.mediamind.com/','http://cdn.betteradvertising.com/logos/mediamind.png','sizmek','316',NULL);
INSERT INTO "trackers" VALUES('ligatus','Ligatus','Ligatus is a performance-marketing system permanently integrated into more than 260 premium-partner portals.Using its own optimisation algorithm, Ligatus enables advertising clients and agencies to position their advertising messages intelligently so that they precisely match the respective target group. In this way Ligatus develops successful campaigns in close collaboration with the client. ',4,'http://www.ligatus.com/','http://cdn.betteradvertising.com/logos/ligatus.png','gruner_jahr_ag','994',NULL);
INSERT INTO "trackers" VALUES('webtrekk','Webtrekk','With Q3 Webtrekk offers one of the most comprehensive and flexible web analytics systems on the market and opens up possibilities previously not available to the individual and its own claims precisely tailored web analytics. This is made possible by utilizing all the advantages of the raw data analysis.
Any links, filtering and segmentation of analysis in real time for user-defined periods of all data collected. Whether online store, community, news or content sites; Webtrekk Q3 is the right tool for all your online presence in detail analyze and optimize want.
* automatic translation',6,'http://www.webtrekk.com/','http://cdn.betteradvertising.com/logos/webtrekk.png','webtrekk','269',NULL);
INSERT INTO "trackers" VALUES('chartbeat','ChartBeat','Chartbeat offers a real-time dashboard that shows how many people are on your site at any given moment, where they are, where they''re coming from, and what they''re doing.

Chartbeat constantly receives information about your users and we show you if they''re reading, writing or idle. We also monitor twitter and blogs for comments about your brand',6,'http://chartbeat.com/','http://cdn.betteradvertising.com/logos/chartbeat.png','chartbeat','58',NULL);
INSERT INTO "trackers" VALUES('turn_inc.','Turn Inc.','Unique from other behavioral offerings, Turn creates custom behavioral targets for every campaign in our market. Why? Because all behavioral targets are not created equal, and optimal performance comes from understanding the unique attributes of your specific audience.

To understand the value of each unique user, Turn maps a user''s behavioral indicators on multiple dimensions: engagement – what types of content users are interacting with, recency – when they are interacting, and frequency – how often they are interacting. By evaluating these dimensions in real-time, Turn understands not only if a consumer is in-market, but where they are in the purchase funnel.

Turn''s machine learning technology is more effective than targeting offered by traditional networks because it blends behavioral targeting with a broad range of other targeting methods including contextual, site, category and demographic for every ad impression. For advertisers, that means Turn can more effectively match ads to web pages and consumers than manual targeting alone. For publishers, predictive targeting increases revenue for every ad impression, because ads can be targeted to more pages and consumers than a traditional media buyer could select manually.

Turn''s technology constantly "learns" by monitoring all ad impressions, clicks, and actions, and uses these observations to continually refine its predictions. And the more data the system observes for an advertiser or publisher, the smarter and better it gets at maximizing performance.',4,'http://www.turn.com/corp/','http://cdn.betteradvertising.com/logos/turn.png','turn_inc.','177',NULL);
INSERT INTO "trackers" VALUES('tapad','Tapad','Tapad is an ad network and demand side platform focused on mobile advertising that combines audience buying and cross-platform targeting. The Tapad network serves as a single point of access for all advertising on smart devices.',4,'http://www.tapad.com/ ','http://cdn.betteradvertising.com/logos/tapad.png','telenor','1176',NULL);
INSERT INTO "trackers" VALUES('exoclick','ExoClick','ExoClick is an ad network that also offers a ''domain parking'' solution that allows publishers to monetize unused domains through Search Engine Optimization and advertising.  ',3,'http://exoclick.com/','http://cdn.betteradvertising.com/logos/exoclick.png','exoclick','702',NULL);
INSERT INTO "trackers" VALUES('liveramp','LiveRamp','Rapleaf''s database of consumer information helps businesses segment customers, understand consumer penetration across social media, and investigate fraud.',4,'http://www.rapleaf.com/','http://cdn.betteradvertising.com/logos/rapleaf.png','acxiom','242',NULL);
INSERT INTO "trackers" VALUES('advertising.com','Advertising.com','Platform-A integrates AOL''s leading media properties, TACODA''s behavioral technology and Advertising.com''s mass reach into a unified solution for advertisers and publishers. Our mission is to operate the world''s most effective, efficient marketplace for the buying and selling of digital advertising.',4,'http://www.platform-a.com/','http://cdn.betteradvertising.com/logos/aoladvertising.png','verizon','88',NULL);
INSERT INTO "trackers" VALUES('xhamster','xHamster',NULL,3,NULL,NULL,NULL,'c_m3',NULL);
INSERT INTO "trackers" VALUES('plista','Plista','plista GmbH is a German advertising network. They offer various advertising formats within the text/image, video and display/IAB layouts, as well as a powerful white label self-booking platform.',4,'http://www.plista.com','http://cdn.betteradvertising.com/logos/plista.png','plista','710',NULL);
INSERT INTO "trackers" VALUES('netratings_sitecensus','NetRatings SiteCensus','SiteCensus is a browser-based audience measurement tool that provides in-depth tracking and analysis of your Web site users, site performance and other critical measurement data. Examine your site performance, usage trends, content and product placement, visitor loyalty, search engine performance and visitor behavior. Analysis is delivered via concisely constructed reporting modules so that each important process can be researched independently and benchmarked internally.',4,'http://www.nielsen-online.com','http://cdn.betteradvertising.com/logos/nielsen.png','nielsen','43',NULL);
INSERT INTO "trackers" VALUES('visual_website_optimizer','Visual Website Optimizer','Visual Website Optimizer is the flagship product of UK and India-based website optimization firm Wingify. Visual Website Optimizer allows for testing of multiple versions of a website as well as reporting of usage statistics and user-response data back to the website developer.',6,'http://visualwebsiteoptimizer.com/','http://cdn.betteradvertising.com/logos/visualwebsiteoptimizer.png','wingify','257',NULL);
INSERT INTO "trackers" VALUES('vg_wort','VG Wort','VG Wort is a German online database.',6,'https://tom.vgwort.de/portal/showHelp','http://cdn.betteradvertising.com/logos/vgwort.png','vg_wort','711',NULL);
INSERT INTO "trackers" VALUES('buysellads','BuySellAds','We help online advertisers and website publishers buy  and sell ads better.
Buying and selling ads isn’t rocket science. We won’t confuse you with fancy algorithms or make you wonder how we do what we do. It’s as simple as selecting the website you want to advertise on, and then paying for the ad. After that, we get out of your way so that you can get on with your day. We don’t “mark up” prices — the website owners set their own pricing — and every aspect of our system is transparent.',4,'http://buysellads.com/','http://cdn.betteradvertising.com/logos/buysellads.com.png','buysellads.com','259',NULL);
INSERT INTO "trackers" VALUES('traffic_stars','Traffic Stars',NULL,3,NULL,NULL,'traffic_stars','2817',NULL);
INSERT INTO "trackers" VALUES('brightroll','BrightRoll','BrightRoll is a video advertising network that helps major brands and agencies execute targeted and scalable video ad campaigns across the industry''s leading publishers. These campaigns include proprietary campaign execution, inventory management and advertising delivery. The BrightRoll Exchange (BRX) is a self-service online video ad-buying platform that provides buyers with efficient and transparent access to video inventory.',4,'http://www.brightroll.com/','http://cdn.betteradvertising.com/logos/brightroll.png','verizon','500',NULL);
INSERT INTO "trackers" VALUES('rocket_fuel','Rocket Fuel','Rocket Fuel provides a simple yet sophisticated way to manage, run and evaluate successful online campaigns. Our technology focuses on finding desirable audience characteristics rather than mere impressions. Through rapid automated testing and user-level targeting we find the individuals that matter. With “progressive optimization” we turn quantitative learning into actionable improvements for each campaign. The result is higher performance – against your metrics – over the run of the campaign.

But, we’re not just about automation. We also provide a dedicated analyst, real-time reporting and feedback so you''ll never be caught off guard or unable to respond to clients or senior management with timely information.',4,'http://rocketfuelinc.com/','http://cdn.betteradvertising.com/logos/rocketfuel.png','sizmek','192',NULL);
INSERT INTO "trackers" VALUES('gravatar','Gravatar',NULL,7,'http://en.gravatar.com/','http://','gravatar','1773',NULL);
INSERT INTO "trackers" VALUES('zanox','Zanox','Zanox is a performance-based network and marketing services provider. They also offer expanded statistics functions for advertising on their network as well as tools for professional search engine marketing. The Zanox network is based in continental Europe with operations in the U.S.',4,'http://www.zanox.com/us/','http://cdn.betteradvertising.com/logos/zanox.png',NULL,'548',NULL);
INSERT INTO "trackers" VALUES('roq.ad','Roq.ad',NULL,4,'https://www.roq.ad/',NULL,NULL,'c_m8',NULL);
INSERT INTO "trackers" VALUES('pornhub','PornHub',NULL,3,NULL,NULL,NULL,'c_m9',NULL);
INSERT INTO "trackers" VALUES('drawbridge','Drawbridge','Adsymptotic provides mobile advertising technology and cross-device data from desktop to mobile. The company''s proprietary technology drives ad serving decisions using cross-device audience behavioral signals, improving the likelihood of finding the right people, on the right device.
',4,'http://www.drawbrid.ge/','http://cdn.betteradvertising.com/logos/drawbridge.png','drawbridge','1291',NULL);
INSERT INTO "trackers" VALUES('wikimedia.org','WikiMedia',NULL,9,NULL,NULL,NULL,'wikimedia.org',NULL);
INSERT INTO "trackers" VALUES('crazy_egg','Crazy Egg','Create tests to figure out what people are doing on your website.',6,'http://crazyegg.com/','http://cdn.betteradvertising.com/logos/crazyegg.png','crazy_egg','20',NULL);
INSERT INTO "trackers" VALUES('conversant','Conversant','ValueClick Media is an advertising network that operates the Precision Profiles platform.  They provide custom audience segments, ad serving and campaign management services. Their Precision Behavioral Targeting system identifies unique audiences using exclusion, recency and frequency controls. They also provide dynamic messaging that tailors each ad to the individual consumer.',4,'http://www.valueclickmedia.com/','http://cdn.betteradvertising.com/logos/valueclickmedia.png','apn_news_media','531',NULL);
INSERT INTO "trackers" VALUES('integral_ad_science','Integral Ad Science','AdSafe Media provides online advertising brand protection and risk management solutions. The company offers a suite of products and services for brands, agencies, ad networks and publishers. Its rating system provides a third-party content rating and certification platform to help standardize and control the online advertising ecosystem.',4,'http://www.adsafemedia.com/','http://cdn.betteradvertising.com/logos/adsafe.png','integral_ad_science','599',NULL);
INSERT INTO "trackers" VALUES('econda','Econda','Econda solutions stand for efficient web analytics. Whether you choose Shop Monitor, Click Monitor or Conversion Tuning, econda is one of the leading specialists for intelligent data collection and analysis in e-commerce.

Based on innovative technologies, the Monitor product line provides online retailers with a reliable basis for controlling and decisionmaking and with all relevant information to optimize their online shops.

Close partnerships with providers of shopsystems guarantee that econda’s solutions are always answering the customers’ needs – one of the reasons, why the German Association of Mail Order Businesses selected econda as Preferred Business Partner.

Hundreds of companies rely on software by econda – customers who have established econda as one of the market leaders for web shop analytics. ',6,'http://www.econda.de/','http://cdn.betteradvertising.com/logos/econda.png','econda','405',NULL);
INSERT INTO "trackers" VALUES('twiago','Twiago',NULL,4,NULL,NULL,NULL,'2972',NULL);
INSERT INTO "trackers" VALUES('trafficjunky','TrafficJunky','',3,'http://www.trafficjunky.net/','http://cdn.betteradvertising.com/logos/trafficjunky.png','trafficjunky','1070',NULL);
INSERT INTO "trackers" VALUES('dotomi','Dotomi','Dotomi enables clients to create an on-going dialogue with consumers through our robust consumer profiles, IntelligentAd dynamic rendering, and multi-network reach. Our Intelligent-Retention and Intelligent-Acquisition services enable clients to easily create an on-going dialog with high-value customers and prospects yielding a strong ROI for their business - we prove our value on every campaign.

As a single source solution, all targeting strategies, creative services, analytical services, data management, media management, and ad serving are done in-house at Dotomi. Our team of professionals and proprietary technology work hard to make it easy for our clients to work with us and communicate with target consumers',4,'http://www.dotomi.com/','http://cdn.betteradvertising.com/logos/dotomi.png','dotomi','120',NULL);
INSERT INTO "trackers" VALUES('jw_player','JW Player',NULL,0,NULL,NULL,'jw_player','2530',NULL);
INSERT INTO "trackers" VALUES('paypal','PayPal',NULL,2,'https://www.paypal.com',NULL,'paypal','c_2595',NULL);
INSERT INTO "trackers" VALUES('seeding_alliance','Seeding Alliance',NULL,4,'http://seeding-alliance.de',NULL,NULL,'nativendo.de',NULL);
INSERT INTO "trackers" VALUES('affilinet','affilinet',NULL,4,'https://www.affili.net/',NULL,'axel_springer','2330',NULL);
INSERT INTO "trackers" VALUES('etracker','etracker','Real-time Webanalytics instead of Logfile-Analysis, free counter or visitorcounter

Increase your online success with premium website analysis, campaign controlling and live web analytics. Save ressources, time and money with our inexpensive SaaS outsourcing solutions.',6,'http://www.etracker.com/en/','http://cdn.betteradvertising.com/logos/etracker.png','etracker_gmbh','186',NULL);
INSERT INTO "trackers" VALUES('lotame','Lotame','Lotame Solutions, Inc., founded in 2006 in Elkridge, Maryland, is a company dedicated to providing solutions within social media. Our Crowd Control technology offers social media sites the most advanced monetization techniques and allows brands to build and target customizable consumer audiences. We aim to increase revenue for our publishers and allow advertisers to target unique users across multiple social media sites. The company has now grown to include locations in major metropolitan areas.',4,'http://www.lotame.com/','http://cdn.betteradvertising.com/logos/lotame.png','lotame','109',NULL);
INSERT INTO "trackers" VALUES('juggcash','JuggCash',NULL,3,'http://www.juggcash.com','http://cdn.betteradvertising.com/logos/juggcash.png','juggcash','1148',NULL);
INSERT INTO "trackers" VALUES('liquidm_technology_gmbh','LiquidM Technology GmbH',NULL,4,NULL,NULL,NULL,'c_m10',NULL);
INSERT INTO "trackers" VALUES('eyeota','Eyeota','',4,'http://www.eyeota.com/','http://cdn.betteradvertising.com/logos/eyeota.png','eyeota','1336',NULL);
INSERT INTO "trackers" VALUES('ebay','eBay Stats','eBay makes millions of daily connections on a global scale, through their retail marketplace.  The affiliate network program allows anyone with website inventory to promote eBay.  Payment is garnered throuh various commmision structures based on actions and/or sales resulting from the ad content.  ',4,'https://www.ebaypartnernetwork.com/files/hub/en-US/index.htmln progress ','http://cdn.betteradvertising.com/logos/ebaypartnernetwork.png','ebay_partner_network','233',NULL);
INSERT INTO "trackers" VALUES('polar','Polar',NULL,4,'http://www.polarb.com/','http://','polar','2129',NULL);
INSERT INTO "trackers" VALUES('indeed','Indeed',NULL,4,'http://www.indeed.com/','http://cdn.betteradvertising.com/logos/indeed.png','indeed','2140',NULL);
INSERT INTO "trackers" VALUES('linkedin','LinkedIn',NULL,8,NULL,NULL,'linkedin','c_831',NULL);
INSERT INTO "trackers" VALUES('sevenone_media','SevenOne Media',NULL,4,NULL,NULL,NULL,'c_m11',NULL);
INSERT INTO "trackers" VALUES('browser_update','Browser Update','Browser-Update is a widget that informs website visitors to update their browser if their current one is ''out-of-date''.',2,'http://www.browser-update.org/','http://cdn.betteradvertising.com/logos/browserupdate.png','browser-update','774',NULL);
INSERT INTO "trackers" VALUES('intelliad','intelliAd',NULL,4,'http://www.intelliad.de/','http://','intelliad','1289',NULL);
INSERT INTO "trackers" VALUES('wordpress_stats','Wordpress Stats','There are hundreds of plugins and services which can provide statistics about your visitors. However I found that even though something like Google Analytics provides an incredible depth of information, it can be overwhelming and doesn''t really highlight what''s most interesting to me as a writer. That''s why Automattic created its own stats system, to focus on just the most popular metrics a blogger wants to track and provide them in a clear and concise interface.

Installing this stats plugin is much like installing Akismet, all you need is to put in your API Key and the rest is automatic.

Once it''s running it''ll begin collecting information about your pageviews, which posts and pages are the most popular, where your traffic is coming from, and what people click on when they leave. It''ll also add a link to your dashboard which allows you to see all your stats on a single page. Less is more.

Finally, because all of the processing and collection runs on our servers and not yours, it doesn''t cause any additional load on your hosting account. In fact, it''s one of the fastest stats system, hosted or not hosted, that you can use.',6,'http://wordpress.org/extend/plugins/stats/','http://cdn.betteradvertising.com/logos/wordpressdotcom.png','wordpress.com','24',NULL);
INSERT INTO "trackers" VALUES('spotxchange','SpotXchange','SpotXchange is an online video marketplace where advertisers and publishers can exchange media on an auction basis.  Publishers can select from a variety of video advertising types within a deep pool of brand and local advertisers.  Self-service tools provide real-time metrics and the ability to call ads and configure them on the fly.',4,'http://www.spotxchange.com/','http://cdn.betteradvertising.com/logos/spotxchange.png ','rtl_group','503',NULL);
INSERT INTO "trackers" VALUES('dataxu','DataXu','DataXu is an optimization platform powered by bidding algorithms that evolve based on ad campaign performance insights.  This allows them to value, buy and optimize each ad impression in real-time for decision opportunities as they occur.  DataXu''s approach is designed to improve on technologies that require pre-optimized categories or broad audience segments.  ',4,'http://www.dataxu.com/','http://cdn.betteradvertising.com/logos/dataxu.png','dataxu','353',NULL);
INSERT INTO "trackers" VALUES('liveinternet','LiveInternet','Web analytics company providing metrics for site traffic, website ranking, page views, audience comparision, and session duration.',1,'http://www.liveinternet.ru/','http://cdn.betteradvertising.com/logos/liveinternet.png','liveinternet','237',NULL);
INSERT INTO "trackers" VALUES('visual_revenue','Visual Revenue','Visual Revenue provides a predictive analytics solution that helps online media organizations optimize their landing page. Their Front Page Automation Platform provides editors with recommendations on which article excerpts to place in which front page position in real time. ',6,'http://visualrevenue.com/','http://cdn.betteradvertising.com/logos/visualrevenue.png','outbrain','689',NULL);
INSERT INTO "trackers" VALUES('stroer_digital_media','Stroer Digital Media',NULL,4,NULL,NULL,'stroer','2960',NULL);
INSERT INTO "trackers" VALUES('owa','OWA','The Austrian web analytics / ÖWA is a voluntary membership association of online publishers and advertising agencies. In 1998 the organization was called as a control device for online media under the umbrella of the Austrian Association Circulation Audit / ÖAK to life. In September 2001, the Austrian web analysis from the Association ÖAK spun off and is now an independent club.

ÖWA objectives are the promotion of the online market, particularly the collection of comparable and objective data to evaluate the performance of online services.',6,'http://oewa.at/','http://cdn.betteradvertising.com/logos/owa.png','the_austrian_web_analysis__owa_','331',NULL);
INSERT INTO "trackers" VALUES('live_intent','Live Intent',NULL,6,NULL,NULL,'liveintent','2747',NULL);
INSERT INTO "trackers" VALUES('flashtalking','Flashtalking','Flashtalking is a UK based independent provider of rich media & video ad serving. They build tools to enable creative agencies to design engaging and effective advertising campaigns for global client lists. Flashtalking technology uniquely allows agencies to create high quality video and smaller video files for seamless ad delivery using innovative video and rich media effects.',4,'http://www.flashtalking.com/','http://cdn.betteradvertising.com/logos/flashtalking.png','flashtalking','495',NULL);
INSERT INTO "trackers" VALUES('alexa_metrics','Alexa Metrics','Editor''s note: No description for this product exists. This product appears to be in stealth mode.',6,'http://www.alexa.com/','http://cdn.betteradvertising.com/logos/alexa.png','alexa','212',NULL);
INSERT INTO "trackers" VALUES('heatmap','Heatmap',NULL,4,'https://heatmap.me/','http://','heatmap','2157',NULL);
INSERT INTO "trackers" VALUES('mouseflow','Mouseflow','Mouseflow Analytics is a fairly new in depth website visitor tracking software available. The amount of information that you receive through a Mouseflow report far exceeds the basic numbers reporting that you get through similiar tracking software. You will be able to see exactly how visitors behave when they visit your site, down to the movement of their mouse and the amount of scrolling they were willing to do.',6,'http://mouseflow.com/','http://cdn.betteradvertising.com/logos/mouseflow.png','mouseflow','347',NULL);
INSERT INTO "trackers" VALUES('quantcount','Quantcount',NULL,6,NULL,NULL,'quantcast','2828',NULL);
INSERT INTO "trackers" VALUES('digital_analytix','Digital Analytix','Quick and clear answers

Sitestat makes web analytics simple, straightforward and accessible. Users at all levels, from strategic to operational, can work with it straight away and get direct help when needed.

Sitestat''s extensive reporting can truly improve your online performance.',6,'http://www.nedstat.com/','http://cdn.betteradvertising.com/logos/nedstat.png','adobe','196',NULL);
INSERT INTO "trackers" VALUES('loggly','Loggly',NULL,6,'http://loggly.com/','','loggly','1351',NULL);
INSERT INTO "trackers" VALUES('improve_digital','Improve Digital','Improve Digital is an online advertising yield management company. They enable premium publishers to maximize unsold and premium inventory using their optimization and self-learning technology.',4,'http://www.improvedigital.com/','http://cdn.betteradvertising.com/logos/improvedigital_logo.png','improve_digital','893',NULL);
INSERT INTO "trackers" VALUES('doublepimp','DoublePimp','Doublepimp works by creating additional revenue sources for publishers looking to squeeze every penny out of their traffic.',3,'http://www.doublepimp.com/','http://cdn.betteradvertising.com/logos/doublepimp.png','doublepimp','76',NULL);
INSERT INTO "trackers" VALUES('pulsepoint','PulsePoint','The ADSDAQ Exchange is the only online exchange where both advertisers and publishers have complete control.

We place rich media, banner and text ads across the Internet for over 11,000 publishers and 500 advertisers every day.',4,'http://www.contextweb.com/','http://cdn.betteradvertising.com/logos/contextweb.png','pulsepoint_ad_exchange','302',NULL);
INSERT INTO "trackers" VALUES('v12_group','V12 Group',NULL,6,NULL,NULL,NULL,'c_665',NULL);
INSERT INTO "trackers" VALUES('audience_science','Audience Science','AudienceScience offers the most powerful and flexible targeting platform for digital media worldwide and their leading behavioral targeting platform collects and measures people''s interests and intent through their Web behaviors.',4,'http://www.audiencescience.com/','http://cdn.betteradvertising.com/logos/audiencescience.png','audiencescience','56',NULL);
INSERT INTO "trackers" VALUES('webtrends','Webtrends','WebTrends standards-based technology and dedicated support lets organizations extend the rich, visitor-centric data collected by their websites to business systems throughout the enterprise. Marketers, BI analytics and others can combine online and offline data to gain the one view of their customers and business - the integrated perspective that drives marketing and business success today.',6,'http://www.webtrends.com/','http://cdn.betteradvertising.com/logos/webtrends.png','webtrends','49',NULL);
INSERT INTO "trackers" VALUES('google_trusted_stores','Google Shopping',NULL,6,NULL,NULL,'google','2968',NULL);
INSERT INTO "trackers" VALUES('m._p._newmedia','M. P. NEWMEDIA',NULL,4,'http://www.mp-newmedia.com/','http://',NULL,'1876',NULL);
INSERT INTO "trackers" VALUES('parsely','Parsely',NULL,6,NULL,NULL,'parse.ly','2613',NULL);
INSERT INTO "trackers" VALUES('scarabresearch','Scarab Research',NULL,6,'https://www.scarabresearch.com/',NULL,'emarsys','scarabresearch.com',NULL);
INSERT INTO "trackers" VALUES('highwinds','Highwinds',NULL,6,NULL,NULL,'highwinds','2610',NULL);
INSERT INTO "trackers" VALUES('typekit_by_adobe','Typekit by Adobe','Adobe is a diversified software company. They offer a line of business and mobile software and services tools used by professionals, designers, knowledge workers and developers for creating, managing and delivering content across multiple operating systems, devices and media. Adobe''s products include Photoshop, Portable Document Format (PDF), their server software product, ColdFusion and development tools including AIR and Flash. Their online marketing suite is powered by Omniture.  ',5,'http://www.adobe.com/','http://cdn.betteradvertising.com/logos/adobesystems.png','adobe','1154',NULL);
INSERT INTO "trackers" VALUES('linkpulse','Linkpulse',NULL,6,'http://www.linkpulse.com/','','linkpulse','1382',NULL);
INSERT INTO "trackers" VALUES('the_reach_group','The Reach Group',NULL,4,'http://www.redvertisment.com','',NULL,'1198',NULL);
INSERT INTO "trackers" VALUES('teads','Teads',NULL,4,'http://teads.tv/','','teads','1494',NULL);
INSERT INTO "trackers" VALUES('cedexis_radar','Cedexis Radar','Cedexis Radar is an open collective intelligence platform which provides real-time insight into the global response times of the world''s largest public infrastructures, from Cloud Computing and Storage to Content and Application Delivery Networks.',6,'http://www.cedexis.com/products_radar.html','http://cdn.betteradvertising.com/logos/cedexis.png','cedexis','434',NULL);
INSERT INTO "trackers" VALUES('neory_','NEORY ',NULL,4,'https://www.neory.com/','http://cdn.betteradvertising.com/logos/targetperformance.png',NULL,'1713',NULL);
INSERT INTO "trackers" VALUES('ensighten','Ensighten','Ensighten was founded in 2009 to solve the growing problems of online data collection. As the use of tracking tags and web analytics tools increased, so did the challenges of implementing, customizing and changing those tags.
Ensighten has stepped up to provide organizations with a flexible and secure way to manage their tags, removing the burdens of resource and time expenditures and empowering marketers, web analytics specialists and IT staff to take control of their tags.
With its patent-pending technology and team of innovative leaders, Ensighten is leading the way to a streamlined, stress-free tagging future.',5,'http://www.ensighten.com','http://cdn.betteradvertising.com/logos/ensighten.png','ensighten','459',NULL);
INSERT INTO "trackers" VALUES('kameleoon','Kameleoon',NULL,6,'http://www.kameleoon.com/','http://','kameleoon','1938',NULL);
INSERT INTO "trackers" VALUES('stickyads','StickyAds',NULL,4,NULL,NULL,'comcast','2348',NULL);
INSERT INTO "trackers" VALUES('disqus','Disqus','Disqus is a powerful comment system that easily enhances the discussion on websites.

In minutes, connect your community with those of thousands of other websites.

Track conversations across the web, plus bridge discussions with your favorite services such as FriendFeed and Plaxo.',1,'http://disqus.com/','http://cdn.betteradvertising.com/logos/disqus.png','disqus','85',NULL);
INSERT INTO "trackers" VALUES('ad4mat','ad4mat',NULL,4,'http://ad4mat.info','http://','ad4mat','1288',NULL);
INSERT INTO "trackers" VALUES('weborama','Weborama','Weborama is a French analytics and behavioral targeting company. Their solutions enable advertisers, agencies and publishers to optimize online marketing investments. The adPerf suite is used to track, manage and optimize web-based ad performance while the Lab is their marketing intelligence and research center.  ',4,'http://weborama.com/2/?l=en','http://cdn.betteradvertising.com/logos/weborama.png','weborama','532',NULL);
INSERT INTO "trackers" VALUES('soasta_mpulse','SOASTA mPulse',NULL,6,'http://www.soasta.com/','http://','akamai','1610',NULL);
INSERT INTO "trackers" VALUES('ab_tasty','AB Tasty',NULL,6,'https://en.abtasty.com','http://','ab_tasty','1930',NULL);
INSERT INTO "trackers" VALUES('usabilla','Usabilla',NULL,2,'https://usabilla.com/','http://','usabilla','1766',NULL);
INSERT INTO "trackers" VALUES('otto.de','otto.de',NULL,8,NULL,NULL,NULL,'otto.de',NULL);
INSERT INTO "trackers" VALUES('pingdom','Pingdom',NULL,6,'https://www.pingdom.com/','http://','pingdom','1526',NULL);
INSERT INTO "trackers" VALUES('ve_interactive','Ve Interactive',NULL,4,'http://www.veinteractive.com','http://','ve_interactive','1547',NULL);
INSERT INTO "trackers" VALUES('burda','BurdaForward',NULL,4,NULL,NULL,'hubert_burda_media','2801',NULL);
INSERT INTO "trackers" VALUES('rhythmone_beacon','Rhythmone Beacon',NULL,4,NULL,NULL,'rythmone','2844',NULL);
INSERT INTO "trackers" VALUES('remintrex','Remintrex',NULL,4,'http://www.remintrex.com/',NULL,NULL,'remintrex.com',NULL);
INSERT INTO "trackers" VALUES('smartclip','SmartClip',NULL,4,NULL,NULL,'smartclip','2347',NULL);
INSERT INTO "trackers" VALUES('appdynamics','AppDynamics',NULL,6,'http://www.appdynamics.com','http://','appdynamics','1740',NULL);
INSERT INTO "trackers" VALUES('connexity','Connexity','Connexity is an integrated platform that includes targeting and automatic optimization technology for advertisers to reach their desired audiences.
',4,'http://www.connexity.com','http://cdn.betteradvertising.com/logos/connexity.png','connexity','1293',NULL);
INSERT INTO "trackers" VALUES('advolution','Advolution',NULL,4,'http://www.advolution.de','http://','advolution','1929',NULL);
INSERT INTO "trackers" VALUES('wywy.com','wywy',NULL,4,'http://wywy.com/',NULL,NULL,'wywy.com',NULL);
INSERT INTO "trackers" VALUES('m-pathy','m-pathy',NULL,4,'http://www.m-pathy.com/','http://','m-pathy','2104',NULL);
INSERT INTO "trackers" VALUES('stripchat.com','stripchat.com',NULL,3,NULL,NULL,NULL,'stripchat.com',NULL);
INSERT INTO "trackers" VALUES('exelate','eXelate','Behavioral Targeting, Campaign Optimization and Insight

Leveraging behavioral targeting data on the eXelate eXchange is an efficient, cost-effective way to turn run-of-network impressions into highly valued targeted inventory. Buyers can engage either specific targeting segments to reach the perfect audience or our Campaign Insight program to optimize a current campaign and drive higher ROI.

The eXelate Targeting eXchange connects leading ad networks and agencies with targeting data on over 100M+ unique visitors captured from premier publishers.

Getting started requires little technology overhead and integrates seamlessly into your current ad serving technology and workflow. You can either use your ad server’s pixel creation and retargeting functions, or access our targeting data via any one of our several media exchange partners including AppNexus and Right Media.

eXelate captures information on targeting events, analyzes data relevance and assigns it to one of over a dozen qualified Targeting Segments as either a Demographic, Behavioral or Purchase Intent indicator.',4,'http://www.exelate.com/','http://cdn.betteradvertising.com/logos/exelate.png','harris_ia','172',NULL);
INSERT INTO "trackers" VALUES('semasio','Semasio',NULL,4,'http://semasio.com/','','semasio','1195',NULL);
INSERT INTO "trackers" VALUES('mixpanel','Mixpanel','A real-time analytics service that helps improve internet applications by tracking how users interact & engage with them.',6,'http://mixpanel.com/','http://cdn.betteradvertising.com/logos/mixpanel.png','mixpanel','240',NULL);
INSERT INTO "trackers" VALUES('t-mobile','Deustche Telekom',NULL,8,NULL,NULL,NULL,'c_923',NULL);
INSERT INTO "trackers" VALUES('scene7.com','Adobe Dynamic Media (Scene7)',NULL,4,NULL,NULL,'adobe','scene7.com',NULL);
INSERT INTO "trackers" VALUES('ekomi','eKomi',NULL,1,'http://www.ekomi.co.uk','http://','ekomi','1655',NULL);
INSERT INTO "trackers" VALUES('sovrn','sovrn','Lijit allows you to easily create your own search engine. One that searches your blog, bookmarks, photos, blogroll, and more. By offering the Lijit Search Wijit on your blog, readers can search all of YOU. In turn, Lijit gives you detailed statistics about those searches, so you can better understand and serve your reader community.',4,'http://www.lijit.com/','http://cdn.betteradvertising.com/logos/lijit.png',NULL,'18',NULL);
INSERT INTO "trackers" VALUES('cpx.to','cpx.to',NULL,11,NULL,NULL,NULL,'cpx.to',NULL);
INSERT INTO "trackers" VALUES('sharethis','ShareThis','ShareThis lets you share to all of your profiles, blogs, friends and contacts. If you see something you want to share, simply click the ShareThis button on the webpage or your browser plugin for instant sharing.',4,'http://sharethis.com/','http://cdn.betteradvertising.com/logos/sharethis.png','sharethis','52',NULL);
INSERT INTO "trackers" VALUES('spoteffect','Spoteffect',NULL,6,NULL,NULL,'spoteffect','2783',NULL);
INSERT INTO "trackers" VALUES('sitescout','SiteScout','Profile in Progress',4,'http://www.sitescout.com','http://cdn.betteradvertising.com/logos/sitescout.png','sitescout','860',NULL);
INSERT INTO "trackers" VALUES('kupona','Kupona',NULL,4,'http://www.kupona-media.de/en/retargeting-and-performance-media-width-kupona','http://cdn.betteradvertising.com/logos/kuponamedia.png','actu_cci','1783',NULL);
INSERT INTO "trackers" VALUES('conative.de','CoNative',NULL,4,'http://www.conative.de/',NULL,NULL,'conative.de',NULL);
INSERT INTO "trackers" VALUES('zopim','Zopim','Zopim is a provider of support and live chat software. Their flagship product, Zopim Live Chat, uses in-browser pop-ups to interact with users upon visiting clients'' websites and provide them with sales support.',2,'http://www.zopim.com/','http://cdn.betteradvertising.com/logos/zopim.png','zopim','630',NULL);
INSERT INTO "trackers" VALUES('tag_commander','Tag Commander','',5,'http://www.tagcommander.com/','http://cdn.betteradvertising.com/logos/tagcommander.png','tag_commander','1586',NULL);
INSERT INTO "trackers" VALUES('mail.ru_group','Mail.Ru Group','Profile in Progress',7,'http://mail.ru/','http://cdn.betteradvertising.com/logos/mailru.png','mail.ru_group','869',NULL);
INSERT INTO "trackers" VALUES('eroadvertising','EroAdvertising','Hand in hand with our customers and industry leaders we have developed a comprehensive set of tools in different languages on which large and small Advertisers and Publishers can trust to make their businesses grow.

With our solutions you can advertise your products and services or generate revenue by publishing advertisements.

Since 2006 it is our mission to give real personal service and attention to our Advertisers and Publishers to create, maintain and optimize the best Advertising Network in the Adult Entertainment Industry.',3,'http://www.ero-advertising.com/','http://cdn.betteradvertising.com/logos/eroadvertising.png','ero_advertising','479',NULL);
INSERT INTO "trackers" VALUES('sociomantic','Sociomantic','Sociomantic labs provide social targeting and related online display advertising technologies. Their cloud-based targeting service combines behavioral network analysis with data used in more traditional ad targeting methods to connect advertisers to the consumers who are most primed to convert.',4,'http://www.sociomantic.com/','http://cdn.betteradvertising.com/logos/sociomantic.png','sociomantic_labs_gmbh','849',NULL);
INSERT INTO "trackers" VALUES('tvsquared.com','TVSquared',NULL,4,'http://tvsquared.com/',NULL,NULL,'tvsquared.com',NULL);
INSERT INTO "trackers" VALUES('zononi.com','zononi.com',NULL,3,NULL,NULL,NULL,'zononi.com',NULL);
INSERT INTO "trackers" VALUES('userlike.com','Userlike',NULL,2,'https://www.userlike.com/',NULL,NULL,'userlike.com',NULL);
INSERT INTO "trackers" VALUES('vkontakte_widgets','VKontakte',NULL,7,'http://vk.com/developers.php','http://cdn.betteradvertising.com/logos/fringegroup.png',NULL,'675',NULL);
INSERT INTO "trackers" VALUES('cdn13.com','cdn13.com',NULL,8,NULL,NULL,NULL,'cdn13.com',NULL);
INSERT INTO "trackers" VALUES('ad_spirit','Ad Spirit','AdSpirit.de is an independent ad serving solution that provides an ad serving platform for publishers/advertisers, marketers and agencies. AdSpirit is a Linux-based system with an Apache server and mySQL as the database server. ',4,'http://www.adspirit.de ','http://cdn.betteradvertising.com/logos/adspirit.png','adspirit','871',NULL);
INSERT INTO "trackers" VALUES('aol_cdn','AOL CDN',NULL,6,NULL,NULL,'verizon','2325',NULL);
INSERT INTO "trackers" VALUES('buzzadexchange.com','buzzadexchange.com',NULL,4,NULL,NULL,NULL,'buzzadexchange.com',NULL);
INSERT INTO "trackers" VALUES('gemius','Gemius','Gemius SA is the largest online research agency in Central and Eastern Europe. The company has been dedicated to Internet market research since its founding in 1999. By focusing the business on maximizing credibility, quality and accuracy the company has been able to grow into the largest online market research agency in Central and Eastern Europe in less than 5 years.
Gemius SA provides a wide range of Internet research to brand name clients throughout Eastern Europe. Gemius provides data on Internet users'' behavior (gemiusTraffic), Internet audience profiles (gemiusProfile), or online advertising campaign effectiveness (gemiusEffect). Gemius'' gemiusAudience research is the online advertising currency across Eastern Europe, where by working with key joint-industry committees and other market players Gemius provides accurate, high-quality measurement of online audiences for media planners, buyers and sellers.',4,'http://www.gemius.com','http://cdn.betteradvertising.com/logos/gemius.png','gemius_sa','313',NULL);
INSERT INTO "trackers" VALUES('trustpilot','Trustpilot',NULL,2,NULL,NULL,'trustpilot','2280',NULL);
INSERT INTO "trackers" VALUES('net-metrix','NET-Metrix',NULL,6,'http://www.net-metrix.ch/','http://','net-metrix','1592',NULL);
INSERT INTO "trackers" VALUES('bunchbox','Bunchbox',NULL,6,NULL,NULL,'bunchbox','2366',NULL);
INSERT INTO "trackers" VALUES('neustar_adadvisor','Neustar AdAdvisor','TargusInfo provides on-demand information services including consumer and business data. They service retailers, call-center operators, Web marketers, and communication service providers to identify and verify their customers so they can optimize user experience and verify unknown prospects.',4,'http://www.targusinfo.com/','http://cdn.betteradvertising.com/logos/targusinfo.png','neustar','443',NULL);
INSERT INTO "trackers" VALUES('datalogix','Datalogix','Online Advertising is About to Evolve.

For years online advertisers have used content and context to target an audience – the traditional ad model. Recently, technology built to understand consumer browsing patterns has allowed ads to be placed in front of people regardless of online location by inferring interests - behavioral targeting was born.

But why try to infer interests when NextAction knows a consumer''s interests?

How people spend their hard-earned money is the most powerful and accurate indicator of their interests. Now your ads can be served to a precise audience based on the products they''ve purchased - online and offline. This is the next evolution of online ad targeting, brought to you by NextAction.

How It Works.

With over 5 years of continually updated multi-channel transaction, demographic and lifestyle data, NextAction is able to precisely target the online audience you want to reach. And, it''s all done in an anonymous and secure fashion. Relevant ads for the user and the right audience for the advertiser. Online advertising as it should be.',4,'http://www.nextaction.net/','http://cdn.betteradvertising.com/logos/datalogix.png','datalogix','175',NULL);
INSERT INTO "trackers" VALUES('refined_labs','Refined Labs',NULL,4,'http://www.refinedlabs.com','','refined_labs','1175',NULL);
INSERT INTO "trackers" VALUES('evidon','Evidon',NULL,5,NULL,NULL,NULL,'c_242',NULL);
INSERT INTO "trackers" VALUES('nexeps.com','neXeps',NULL,4,'http://nexeps.com/',NULL,NULL,'nexeps.com',NULL);
INSERT INTO "trackers" VALUES('routenplaner-karten.com','Routenplaner Karten',NULL,2,'https://www.routenplaner-karten.com/',NULL,NULL,'routenplaner-karten.com',NULL);
INSERT INTO "trackers" VALUES('vibrant_ads','Vibrant Ads','Vibrant In-Text Solutions highlight words in web content, gaining mindshare by aligning relevant information with the words that define brands and products. These solutions are user-initiated, allowing the user to control his or her experience by delivering information only when users move their mouse over a relevant word or phrase of interest. Vibrant
In-Text Solutions uses the IntelliTXT technology to ensure that all information is precisely targeted and contextually relevant.',4,'http://www.vibrantmedia.com/','http://cdn.betteradvertising.com/logos/vibrantmedia.png','vibrant_media','103',NULL);
INSERT INTO "trackers" VALUES('highwebmedia.com','highwebmedia.com',NULL,3,NULL,NULL,NULL,'highwebmedia.com',NULL);
INSERT INTO "trackers" VALUES('triplelift','TripleLift',NULL,4,'http://triplelift.com/','http://','triplelift','1576',NULL);
INSERT INTO "trackers" VALUES('estat','eStat','Médiamétrie-eStat offers a complete range of "site centric" measuring tools: - "CybereStat" and its Cyber''Streaming, Cyber''Podcast and Cyber''Clics modules, - "eStat''Pro" and its eStat''Clics, eStat''Track, eStat''Multicritères and eStat''eCommerce (ROI) options.',6,'http://www.mediametrie-estat.com/','http://cdn.betteradvertising.com/logos/mediametrie.png','mediametrie','311',NULL);
INSERT INTO "trackers" VALUES('bazaarvoice','Bazaarvoice','Bazaarvoice is a Software as a Service (SaaS) company that enables the world’s biggest brands to capture, analyze, and most importantly, act upon social data – to drive true, customer-centric change.

We achieve that by first letting consumers create and share ratings, reviews, questions, answers, and stories about products and brands on client websites. We then syndicate that content across channels to reach shoppers wherever they are.

This customer-generated content has a tremendously positive influence on purchase decisions. It is also rich with customer intelligence, which we analyze and provide to our clients so they can make real-time, information-based decisions that affect all aspects of their business – marketing, product R&D, and operations.',2,'http://www.bazaarvoice.com/','http://cdn.betteradvertising.com/logos/bazaarvoice.png','bazaarvoice','974',NULL);
INSERT INTO "trackers" VALUES('blau.de','Blau',NULL,8,'https://www.blau.de/',NULL,NULL,'blau.de',NULL);
INSERT INTO "trackers" VALUES('statcounter','Statcounter','A free yet reliable invisible web tracker, highly configurable hit counter and real-time detailed web stats. Insert a simple piece of our code on your web page or blog and you will be able to analyse and monitor all the visitors to your website in real-time!',6,'http://www.statcounter.com/','http://cdn.betteradvertising.com/logos/statcounter.png','statcounter','22',NULL);
INSERT INTO "trackers" VALUES('popads','PopAds','"PopAds is simply the best paying advertising network specialized in popunders on the Internet."',4,'https://www.popads.net/','http://cdn.betteradvertising.com/logos/popads.png','popads','838',NULL);
INSERT INTO "trackers" VALUES('liveperson','LivePerson','Founded in 1995, LivePerson helps the Internet deliver on its promise of making our day-to-day lives easier and better by supplying real-time access to the world''s experts and their knowledge.

For everyday people, LivePerson is an online destination, community and marketplace where individuals can chat live with experts in a broad range of categories. Find an expert or apply to become an expert

And for businesses, LivePerson humanizes the online experience, increasing sales, customer satisfaction and loyalty. More than 7,000 companies, including some of the largest and most-recognized global brands, use LivePerson''s real-time chat platform to communicate and build relationships with their customers on the Web. See our business solutions',2,'http://www.liveperson.com/','http://cdn.betteradvertising.com/logos/liveperson.png','liveperson','106',NULL);
INSERT INTO "trackers" VALUES('contentpass','Contentpass',NULL,4,'https://www.contentpass.de/',NULL,NULL,'contentpass.net',NULL);
INSERT INTO "trackers" VALUES('adap.tv','Adap.tv','Adap.tv is an online video serving and management technology. Their advertising platform One Source, allows publishers and advertisers to match relevant advertising with online video content.  Their technology analyzes video, audio, and metadata to serve contextually relevant ads in a viewer-friendly manner.  The adap.tv video exchange enables buying and selling decisions in real-time.',4,'http://www.adap.tv/','http://cdn.betteradvertising.com/logos/adaptv.png','verizon','573',NULL);
INSERT INTO "trackers" VALUES('adgoal','adgoal',NULL,4,'http://www.adgoal.de/','','adgoal','1186',NULL);
INSERT INTO "trackers" VALUES('tns','TNS','Various tracking remnants and currently active companies utilizing the same base technology provided by Bluemetrix.

TNS tracking companies are: Spring Scores (tns-gallup.no), TNS Counter (tns-counter.ru), and TNS Metrix.',6,'http://www.tnsglobal.com/','http://cdn.betteradvertising.com/logos/tns.png','tns','339',NULL);
INSERT INTO "trackers" VALUES('brightcove','Brightcove','Brightcove is a leading online video platform trusted by organizations of all sizes to publish and monetize professional quality video experiences across PCs, tables, smart phones, and TVs.',0,'http://www.brightcove.com/en/','http://cdn.betteradvertising.com/logos/brightcove.png','brightcove','423',NULL);
INSERT INTO "trackers" VALUES('trbo','trbo',NULL,4,'http://www.trbo.com/','http://','trbo','2106',NULL);
INSERT INTO "trackers" VALUES('onesignal','OneSignal',NULL,5,NULL,NULL,'onesignal','2498',NULL);
INSERT INTO "trackers" VALUES('zendesk','Zendesk','Zendesk is a modern help desk system in a hosted environment.

The help desk is the single-point-of-contact between your end-users and you as a service provider. With very little effort Zendesk makes it possible for you to offer a professional-grade support service and capitalize on valuable user feedback.

Used in an IT department the help desk serves as the ERP system of the IT organization. It encourages and enforces well defined registration and processing of the data that makes the foundation for resource usage, -prioritization, and -strategy. The help desk constitutes the central hub for a company''s IT Service Management (ITSM) strategy, which centers on the customer''s perspective of IT''s contribution to the business.

Zendesk clients are support organizations that embraces agile methods to service their customers. Organizations that are focused on executing strategic and tactical objects of their businesses, rather than scraping together a large application portfolio and building up a massive team to serve it all. ',2,'http://www.zendesk.com/','http://cdn.betteradvertising.com/logos/zendesk.png','zendesk','222',NULL);
INSERT INTO "trackers" VALUES('kiosked','Kiosked',NULL,4,'http://www.kiosked.com/','http://','kiosked','1985',NULL);
INSERT INTO "trackers" VALUES('alephd.com','alephd',NULL,4,'https://www.alephd.com/',NULL,'verizon','alephd.com',NULL);
INSERT INTO "trackers" VALUES('24_7','[24]7',NULL,2,'http://www.247-inc.com/','http://',NULL,'1670',NULL);
INSERT INTO "trackers" VALUES('epoq','epoq',NULL,4,'http://www.epoq.de/','http://','epoq','1801',NULL);
INSERT INTO "trackers" VALUES('madeleine.de','madeleine.de',NULL,4,NULL,NULL,NULL,'madeleine.de',NULL);
INSERT INTO "trackers" VALUES('myfonts_counter','MyFonts',NULL,6,'http://www.myfonts.com/','http://','myfonts','1634',NULL);
INSERT INTO "trackers" VALUES('nt.vc','Next Tuesday GmbH',NULL,8,'http://www.nexttuesday.de/',NULL,NULL,'nt.vc',NULL);
INSERT INTO "trackers" VALUES('radiumone','RadiumOne','RadiumOne is an online advertising network that works with publishers around the world buying display advertising space and re-selling it in targeted packages to advertisers and agencies. The targeting options available range from geographic locations to user interest-based.',4,'http://www.radiumone.com/index.html','http://cdn.betteradvertising.com/logos/radiumone.png','rhythmone','492',NULL);
INSERT INTO "trackers" VALUES('o2online.de','o2online.de',NULL,8,'https://www.o2online.de/',NULL,NULL,'o2online.de',NULL);
INSERT INTO "trackers" VALUES('zencoder','Zencoder',NULL,0,NULL,NULL,'zencoder','2607',NULL);
INSERT INTO "trackers" VALUES('tripadvisor','TripAdvisor',NULL,8,NULL,NULL,'iac_apps','c_1402',NULL);
INSERT INTO "trackers" VALUES('imgur','Imgur',NULL,8,NULL,NULL,NULL,'c_1736',NULL);
INSERT INTO "trackers" VALUES('hurra_tracker','Hurra Tracker','Hurra Communications is a Germany based company that provides search engine marketing solutions. They offer search engine campaign design and optimization services.  Hurra also provides production promotional tools and design and produce direct response and Web television advertising campaigns.
',4,'http://www.hurra.com/en/','http://cdn.betteradvertising.com/logos/hurra.png','hurra_communications','580',NULL);
INSERT INTO "trackers" VALUES('etahub.com','etahub.com',NULL,11,NULL,NULL,NULL,'etahub.com',NULL);
INSERT INTO "trackers" VALUES('infectious_media','Infectious Media','Infectious Media provides online media buying services to advertisers and agencies. Infectious Media uses a proprietary technology platform called Impression Desk that ensure that advertisements are shown to the most relevant users on the most relevant websites.  ',4,'http://www.infectiousdigital.com/','http://cdn.betteradvertising.com/logos/infectiousmedia.png','infectious_media','641',NULL);
INSERT INTO "trackers" VALUES('adroll','AdRoll',NULL,4,NULL,NULL,NULL,'c_412',NULL);
INSERT INTO "trackers" VALUES('traffichaus','TrafficHaus','',3,'http://www.traffichaus.com','http://cdn.betteradvertising.com/logos/traffichaus.png','traffichaus','1077',NULL);
INSERT INTO "trackers" VALUES('videology','Videology','TidalTV is a video advertising, optimization, and yield management solutions provider. They leverage data and technology to help advertisers meet specific brand response objectives and enable publishers to provide value  to their audiences.',4,'http://www.tidaltv.com/','http://cdn.betteradvertising.com/logos/tidaltv.png',NULL,'746',NULL);
INSERT INTO "trackers" VALUES('adup-tech.com','AdUp Technology',NULL,4,'https://www.adup-tech.com/',NULL,NULL,'adup-tech.com',NULL);
INSERT INTO "trackers" VALUES('gigya','Gigya',NULL,6,NULL,NULL,'gigya','2746',NULL);
INSERT INTO "trackers" VALUES('signal','Signal','BrightTag is a Data Rights Management Platform that allows website owners to connect with marketing, analytics and other data-driven services, while providing controls over the data that is collected and protected against unintended data access by third-parties.
',5,'https://www.signal.co/','http://cdn.betteradvertising.com/logos/brighttag.png',NULL,'508',NULL);
INSERT INTO "trackers" VALUES('161media','Platform161',NULL,6,'https://platform161.com/',NULL,NULL,'c_840',NULL);
INSERT INTO "trackers" VALUES('rackcdn.com','Rackspace',NULL,9,'https://www.rackspace.com/',NULL,NULL,'rackcdn.com',NULL);
INSERT INTO "trackers" VALUES('kxcdn.com','Keycdn',NULL,9,'https://www.keycdn.com/',NULL,NULL,'kxcdn.com',NULL);
INSERT INTO "trackers" VALUES('ixi_digital','IXI Digital',NULL,4,NULL,NULL,'ixi_services','2830',NULL);
INSERT INTO "trackers" VALUES('iadvize','iAdvize',NULL,2,'http://www.iadvize.com/','','iadvize','1216',NULL);
INSERT INTO "trackers" VALUES('igodigital','iGoDigital','iGoDigital offers a suite of product recommendations and social commerce solutions to online retailers. The individual tools that iGoDigital offers range from product finders, to customized selling or guided selling tools, to product attribute libraries.',2,'http://igodigital.com/','http://cdn.betteradvertising.com/logos/igodigital.png','igodigital','1334',NULL);
INSERT INTO "trackers" VALUES('sharethrough','ShareThrough','Sharethrough is a social video advertising platform and provides viral media distribution solutions. Sharethrough gives content owners and advertisers, access to various consumers. They also distribute video ads across social websites, games, apps, and advertising exchanges,',4,'http://www.sharethrough.com/','http://cdn.betteradvertising.com/logos/sharethrough.png','sharethrough','1368',NULL);
INSERT INTO "trackers" VALUES('vimeo','Vimeo',NULL,0,NULL,NULL,'iac_apps','2727',NULL);
INSERT INTO "trackers" VALUES('metrigo','Metrigo',NULL,4,'http://metrigo.com/','http://cdn.betteradvertising.com/logos/metrigo.png','metrigo','1471',NULL);
INSERT INTO "trackers" VALUES('i-behavior','i-Behavior','I-Behavior is a behavioral targeting company that provides database marketing solutions for multi-channel marketers and advertisers. Their key focus is direct targeting, online targeting, and retail insight based on buying behavior across industry verticals, including catalog and retail.  I-Behavior aggregates anonymous online and offline data to determine which offers will be the most relevant to display to consumers.',4,'http://www.i-behavior.com/','http://cdn.betteradvertising.com/logos/ibehavior.png','kbm_group','727',NULL);
INSERT INTO "trackers" VALUES('perfect_market','Perfect Market',NULL,4,'http://perfectmarket.com/','http://','perfect_market','1691',NULL);
INSERT INTO "trackers" VALUES('marketgid','MarketGid','MGID.com is an online catalog, a news aggregator, a targeted advertising platform, and a traffic exchange system all in one!

List products in our online catalog for FREE, and advertise on our uniquely targeted ad network for pennies per click.

If you produce news, video, or entertainment content, you can tap into one of the most technologically advanced traffic exchanges on the web! This new service is changing the way newspapers, magazines, blogs, and entertainment sites interact with their audiences, distribute their content, and build new readerships.
Put our fully customizable News Widgets anywhere on your site and receive 150%-300% extra traffic FREE! ',4,'http://www.mgid.com/','http://cdn.betteradvertising.com/logos/marketgid.png','marketgid_usa','364',NULL);
INSERT INTO "trackers" VALUES('next_performance','Next Performance','Next Performance is an audience retargeting company and advertising network based in France. Their solution is used by eCommerce platforms to serve customers target advertisements based on interests inferred from products viewed and other relevant online data.',4,'http://www.nextperformance.com/','http://cdn.betteradvertising.com/logos/nextperformance.png','nextperf','706',NULL);
INSERT INTO "trackers" VALUES('media_impact','Media Impact',NULL,4,NULL,NULL,'media_impact','2883',NULL);
INSERT INTO "trackers" VALUES('soundcloud','SoundCloud','',0,'http://soundcloud.com/','http://cdn.betteradvertising.com/logos/soundcloud.png','soundcloud','1068',NULL);
INSERT INTO "trackers" VALUES('akanoo','Akanoo',NULL,6,'http://www.akanoo.com/','http://','akanoo','2150',NULL);
INSERT INTO "trackers" VALUES('findologic.com','Findologic',NULL,2,'https://www.findologic.com/',NULL,NULL,'findologic.com',NULL);
INSERT INTO "trackers" VALUES('are_you_a_human','Are You a Human',NULL,6,'https://areyouahuman.com/',NULL,'distil_networks','c_2738',NULL);
INSERT INTO "trackers" VALUES('userreport','UserReport','"We measure usability and shows where different kind of visitors click on your website. Lets users voice their ideas on how to improve your website through a feedback forum."',2,'http://www.userreport.com/','http://cdn.betteradvertising.com/logos/userreport.png','userreport','950',NULL);
INSERT INTO "trackers" VALUES('adara_analytics','ADARA Analytics','Adara Media (formerly Opinmind) provides tools for  optimizing  advertising across multiple ad networks and exchanges for advertisers. Adara Media collects, organizes and interprets Web traffic data  categorizing high-value audience segments used to target consumers.',4,'http://www.adaramedia.com/','http://cdn.betteradvertising.com/logos/adaramedia.png','adara_analytics','469',NULL);
INSERT INTO "trackers" VALUES('kontextr','Kontextr',NULL,4,NULL,NULL,'kontext','2803',NULL);
INSERT INTO "trackers" VALUES('content_spread','Content Spread',NULL,4,NULL,NULL,NULL,'c_2785',NULL);
INSERT INTO "trackers" VALUES('visual_iq','Visual IQ',NULL,6,NULL,NULL,'visualiq','2903',NULL);
INSERT INTO "trackers" VALUES('ciuvo.com','ciuvo.com','Browser extension which does price comparison for products.',12,'https://www.ciuvo.com/',NULL,NULL,'ciuvo.com',NULL);
INSERT INTO "trackers" VALUES('adtriba.com','AdTriba',NULL,6,'https://www.adtriba.com/',NULL,NULL,'adtriba.com',NULL);
INSERT INTO "trackers" VALUES('tradedoubler','TradeDoubler','TradeDoubler is an international performance-based digital marketing company. TradeDoubler optimizes Web marketing campaigns by analyzing web clicks, impressions and purchases. Its affiliate program is a banner advertising service which links and transfers website visitors to an advertiser''s site. This boosts traffic and search engine performance by providing traffic for the advertiser.  ',4,'http://www.tradedoubler.com/','http://cdn.betteradvertising.com/logos/tradedoubler.png','tradedoubler','533',NULL);
INSERT INTO "trackers" VALUES('propeller_ads','Propeller Ads',NULL,4,'http://www.propellerads.com/','http://','propeller_ads','1702',NULL);
INSERT INTO "trackers" VALUES('exoticads.com','exoticads',NULL,3,'https://exoticads.com/welcome/',NULL,NULL,'exoticads.com',NULL);
INSERT INTO "trackers" VALUES('xfreeservice.com','xfreeservice.com',NULL,11,NULL,NULL,NULL,'xfreeservice.com',NULL);
INSERT INTO "trackers" VALUES('sheego.de','sheego.de',NULL,8,NULL,NULL,NULL,'sheego.de',NULL);
INSERT INTO "trackers" VALUES('marin_search_marketer','Marin Search Marketer','Provides a browser-based, enterprise-class paid search management application for advertisers and agencies.',4,'http://www.marinsoftware.com/','http://cdn.betteradvertising.com/logos/marinsoftware.png','marin_software','239',NULL);
INSERT INTO "trackers" VALUES('rtb_house','RTB House',NULL,4,'http://en.adpilot.com/','http://','rtb_house','1880',NULL);
INSERT INTO "trackers" VALUES('polyfill.io','Polyfill.io',NULL,8,'https://polyfill.io/',NULL,NULL,'polyfill.io',NULL);
INSERT INTO "trackers" VALUES('grandslammedia','GrandSlamMedia',NULL,4,'http://www.grandslammedia.com/','http://','grand_slam_media','1519',NULL);
INSERT INTO "trackers" VALUES('delta_projects','Delta Projects','"The foundation of our technical platform is ad serving. With a solid experience dating back to 2002 and large well-known customers Delta Projects has the knowledge and resources to serve any campaign, the flexibility to meet customer needs, and a proven customer oriented service."',4,'http://www.adaction.se/','http://cdn.betteradvertising.com/logos/adaction.png','delta_projects','904',NULL);
INSERT INTO "trackers" VALUES('clicktale','ClickTale','ClickTale delivers innovative In-Page Web Analytics that reveal the mystery of what visitors actually do inside website pages, allowing you to analyze and optimize website performance and usability. Our unique solution provides movies of your visitors'' actual browsing sessions, heatmaps of aggregate behavior inside the web page, and advanced behavioral analytics. ClickTale fills a gap left by traditional web analytics that only measures activity between pages.

Thousands of satisfied customers have used ClickTale to optimize landing pages, minimize abandonment of shopping carts, maximize completion of online forms, and run global usability tests. Since ClickTale is a hosted service, there is no software to install and setup takes just a few minutes.',6,'http://www.clicktale.com/','http://cdn.betteradvertising.com/logos/clicktale.png','clicktale','108',NULL);
INSERT INTO "trackers" VALUES('onthe.io','OnThe.io',NULL,6,NULL,NULL,'onthe.io','2629',NULL);
INSERT INTO "trackers" VALUES('whos.amung.us','Whos.amung.us','Real time analytics for your website, blog or social network profile, provides a unique spin on traditional hit counters.',6,'http://whos.amung.us/','http://cdn.betteradvertising.com/logos/whosamungus.png','whos.amung.us','252',NULL);
INSERT INTO "trackers" VALUES('relevant4.com','relevant4 GmbH',NULL,8,'https://www.relevant4.com/',NULL,NULL,'relevant4.com',NULL);
INSERT INTO "trackers" VALUES('ibm_customer_experience','IBM Customer Experience','Industry-Leading Web Analytics with Coremetrics Analytics
Maximize the Return on Your Marketing Investment by Understanding Visitor Behavior

As a digital marketer in today’s wired world, you face numerous challenges: online marketing spend growing rapidly; sophisticated web visitors who exercise tremendous purchasing power and wield unprecedented control over their online experience; and pressure to make far-reaching decisions with unclear and incomplete information.

The answer: a Web analytics solution that provides the most accurate and complete record of visitor behavior. And that’s exactly what Coremetrics® Analytics delivers, capturing every click by every visitor over time and storing them in Coremetrics’ secure Lifetime Individual Visitor Experience (LIVE) Profiles database. Our unique approach to website analytics gives you the most up-to-date, actionable insight in the industry for guiding your critical marketing decisions.',6,'http://www.coremetrics.com/','http://cdn.betteradvertising.com/logos/coremetrics.png','ibm','163',NULL);
INSERT INTO "trackers" VALUES('skimlinks','SkimLinks','SkimLinks is a startup that automates the process of creating affiliate links, allowing a publisher to link to a product on a site like Amazon and receive a commission from any resulting sales.',4,'http://www.skimlinks.com/','http://cdn.betteradvertising.com/logos/skimlinks.png','skimlinks','375',NULL);
INSERT INTO "trackers" VALUES('conviva','Conviva','Conviva stays connected to your viewers so your viewers stay connected to you.',6,'http://www.conviva.com/','http://cdn.betteradvertising.com/logos/conviva.png','conviva','561',NULL);
INSERT INTO "trackers" VALUES('brightcove_player','Brightcove Player',NULL,0,NULL,NULL,'brightcove','2451',NULL);
INSERT INTO "trackers" VALUES('klarna.com','Klarna',NULL,2,'https://www.klarna.com/',NULL,NULL,'klarna.com',NULL);
INSERT INTO "trackers" VALUES('sift_science','Sift Science',NULL,6,'https://siftscience.com/','http://','sift_science','1637',NULL);
INSERT INTO "trackers" VALUES('congstar.de','congstar.de',NULL,4,NULL,NULL,NULL,'congstar.de',NULL);
INSERT INTO "trackers" VALUES('dtscout.com','Dtscout',NULL,6,'http://www.dtscout.com/',NULL,NULL,'dtscout.com',NULL);
INSERT INTO "trackers" VALUES('smaato','Smaato','Smaato operates a mobile advertising optimization platform called SOMA. Through an open API and a range of Software Developer Kits (SDKs), SOMA can be integrated with ad networks, ad inventory owners (publishers, developers and operators) and third party ad technology providers.',4,'http://www.smaato.com/','http://cdn.betteradvertising.com/logos/smaato.png','spearhead','1647',NULL);
INSERT INTO "trackers" VALUES('spotscenered.info','spotscenered.info',NULL,11,NULL,NULL,NULL,'spotscenered.info','15/11/17: Private whois.');
INSERT INTO "trackers" VALUES('adriver','AdRiver','Want to know the effectiveness of an advertising campaign? AdRiver system gives you a complete set of tools for its analysis: Online statistics running an advertising campaign with the guest logon to the advertiser. Accurate statistics on the interactive storage media (see the user interact with the banner) and unique product. AdRiver Report . automatic generation of detailed reports AdRiver Report.
',4,'http://www.adriver.ru/','http://cdn.betteradvertising.com/logos/adriver.png','ad_river','209',NULL);
INSERT INTO "trackers" VALUES('cqq5id8n.com','cqq5id8n.com',NULL,11,NULL,NULL,NULL,'cqq5id8n.com',NULL);
INSERT INTO "trackers" VALUES('bidtheatre','BidTheatre',NULL,4,'http://www.bidtheatre.com/','http://cdn.betteradvertising.com/logos/bidtheatre.png','bidtheatre','2102',NULL);
INSERT INTO "trackers" VALUES('just_premium','Just Premium',NULL,4,'http://justpremium.com/','http://','just_premium','1786',NULL);
INSERT INTO "trackers" VALUES('mein-bmi.com','mein-bmi.com','Browser extension which collects visited urls',12,'https://www.mein-bmi.com/',NULL,NULL,'mein-bmi.com',NULL);
INSERT INTO "trackers" VALUES('internet_billboard','Internet BillBoard',NULL,4,'http://www.ibillboard.com/en/','http://cdn.betteradvertising.com/logos/internetbillboard.png','internet_billboard','1791',NULL);
INSERT INTO "trackers" VALUES('admeta','Admeta','Admeta operates as an online marketing company and provides advertising tracking services in Europe. It designs and develops a web based yield management tool for unsold inventory bidding and selling services. The marketing tool Admeta offers provide campaign management, reporting services and an online marketing platform for integration.',4,'http://www.admeta.com/','http://cdn.betteradvertising.com/logos/admeta.png','admeta','642',NULL);
INSERT INTO "trackers" VALUES('histats','Histats','Free web stats and stat counter, hit counter, free web tracker and tracking tools.',4,'http://www.histats.com/','http://cdn.betteradvertising.com/logos/histats.png','histats','251',NULL);
INSERT INTO "trackers" VALUES('truste_notice','TRUSTe Notice','TRUSTe is a privacy certification and ad verification company. It certifies website and mobile privacy practices as well as approving downloadable software applications. In it''s compliance efforts, TRUSTe serves notices for the Self Regulatory Program for Online Behavioral Advertising, the program overseen by Digital Advertising Alliance.',5,'http://www.truste.com/','http://cdn.betteradvertising.com/logos/truste.png','trustarc','507',NULL);
INSERT INTO "trackers" VALUES('vtracy.de','vtracy.de',NULL,11,NULL,NULL,NULL,'vtracy.de',NULL);
INSERT INTO "trackers" VALUES('whatbroadcast','Whatbroadcast',NULL,2,NULL,NULL,'whatsbroadcast','2810',NULL);
INSERT INTO "trackers" VALUES('flowplayer','Flowplayer',NULL,4,NULL,NULL,'flowplayer','2889',NULL);
INSERT INTO "trackers" VALUES('rambler','Rambler',NULL,8,NULL,NULL,NULL,'c_672',NULL);
INSERT INTO "trackers" VALUES('lockerz_share','AddToAny','Help your visitors share, save and subscribe to your content with Add to Any widgets',7,'http://www.addtoany.com/','http://cdn.betteradvertising.com/logos/addtoany.png','lightInthebox','54',NULL);
INSERT INTO "trackers" VALUES('tynt','Tynt',NULL,4,'http://www.tynt.com/',NULL,'33across','1480',NULL);
INSERT INTO "trackers" VALUES('smartstream.tv','SmartStream.TV',NULL,4,NULL,NULL,NULL,'smartstream.tv',NULL);
INSERT INTO "trackers" VALUES('realperson.de','Realperson Chat',NULL,2,'http://www.optimise-it.de/',NULL,'optimise_it','realperson.de',NULL);
INSERT INTO "trackers" VALUES('glotgrx.com','glotgrx.com',NULL,11,NULL,NULL,NULL,'glotgrx.com',NULL);
INSERT INTO "trackers" VALUES('threatmetrix','ThreatMetrix','',6,'http://threatmetrix.com/','http://cdn.betteradvertising.com/logos/threatmetrix.png','threatmetrix','1060',NULL);
INSERT INTO "trackers" VALUES('cxo.name','Chip Analytics',NULL,6,'http://www.chip.de/',NULL,NULL,'cxo.name',NULL);
INSERT INTO "trackers" VALUES('glomex.com','Glomex',NULL,0,'https://www.glomex.com/',NULL,NULL,'glomex.com',NULL);
INSERT INTO "trackers" VALUES('cxense','cXense','cXense provides web-based services to businesses to improve the overall relevance of their web applications. These services are advertising, analytics, search and personalization.',4,'http://www.cxense.com/','http://cdn.betteradvertising.com/logos/cxense.png','cxense','794',NULL);
INSERT INTO "trackers" VALUES('amplitude','Amplitude',NULL,6,'https://amplitude.com/','http://cdn.betteradvertising.com/logos/amplitude.png','amplitude','2175',NULL);
INSERT INTO "trackers" VALUES('falk_technologies','Falk Technologies',NULL,8,NULL,NULL,NULL,'c_3194',NULL);
INSERT INTO "trackers" VALUES('pagefair','PageFair',NULL,2,'https://pagefair.com/','http://','pagefair','1628',NULL);
INSERT INTO "trackers" VALUES('emsmobile.de','EMS Mobile',NULL,8,'http://www.emsmobile.com/',NULL,NULL,'emsmobile.de',NULL);
INSERT INTO "trackers" VALUES('fastlylb.net','Fastly',NULL,9,'https://www.fastly.com/',NULL,NULL,'fastlylb.net',NULL);
INSERT INTO "trackers" VALUES('vorwerk.de','vorwerk.de',NULL,8,'https://corporate.vorwerk.de/home/',NULL,NULL,'vorwerk.de',NULL);
INSERT INTO "trackers" VALUES('digidip','Digidip',NULL,4,NULL,NULL,'digidip','2938',NULL);
INSERT INTO "trackers" VALUES('salesforce_live_agent','Salesforce Live Agent','SalesForce is an enterprise cloud computing company that distributes business software on a subscription basis. Its flagship product is a customer relationship management (CRM) tool that is hosted on Salesforce.com and operates on a Software-as-a-Service (SaaS) platform. SalesForce also operates Force.com, a system for running business apps, and Chatter, an enterprise collaboration application.',2,'http://www.salesforce.com/','http://cdn.betteradvertising.com/logos/salesforce.png','salesforce','1063',NULL);
INSERT INTO "trackers" VALUES('mycliplister.com','Cliplister',NULL,2,'https://www.cliplister.com/',NULL,NULL,'mycliplister.com',NULL);
INSERT INTO "trackers" VALUES('peerius','Peerius','Peerius is provider of technology that provides enhanced product recommendations. Their software integrates with e-commerce platforms to call out products on publishers'' websites based on its "intelligent" recommendation technology.',2,'http://www.peerius.com/','http://cdn.betteradvertising.com/logos/peerius.png','peerius','668',NULL);
INSERT INTO "trackers" VALUES('steepto.com','Steepto',NULL,4,'https://www.steepto.com/',NULL,NULL,'steepto.com',NULL);
INSERT INTO "trackers" VALUES('adglue','Adglue',NULL,4,NULL,NULL,'admans','2524',NULL);
INSERT INTO "trackers" VALUES('monetate','Monetate','Site Optimization
made easy.

Easily test, target and personalize anything anywhere across your site. No IT support needed.',6,'http://monetate.com','http://cdn.betteradvertising.com/logos/monetate.png','monetate','398',NULL);
INSERT INTO "trackers" VALUES('mov.ad_','Mov.ad ',NULL,8,NULL,NULL,NULL,'c_3421',NULL);
INSERT INTO "trackers" VALUES('simpli.fi','Simpli.fi','Simpli.fi is a search focused demand-side platform that help search marketers take advantage of display RTB (real-time bidding).  Their clients can target banners ads based on key words users have searched.  Their data management technology allows for unique storage and targeting of individuals search terms for each user.  Like most DSP (demand-side platforms) they use strategy, data, and real-time bidding technologies to buy ad and data opportunities through exchanges and other sources.  However, their specialized focus is search marketing.',4,'http://www.simpli.fi','http://cdn.betteradvertising.com/logos/simplifi.png','simpli.fi','486',NULL);
INSERT INTO "trackers" VALUES('office365.com','office365.com',NULL,8,NULL,NULL,'microsoft','office365.com',NULL);
INSERT INTO "trackers" VALUES('digital_window','Digital Window',NULL,4,'http://www.digitalwindow.com/','http://','axel_springer','1548',NULL);
INSERT INTO "trackers" VALUES('touchcommerce','Nuance','A leading provider of Online Interaction Optimization Solutions. Combining best-in-class real time customer analytics and live interaction technology with optimization services.  They enable sales and care chat agents to significantly increase online customer conversion and satisfaction on a pay-for-performance basis.',2,'https://www.nuance.com/','http://cdn.betteradvertising.com/logos/touchcommerce.png',NULL,'243',NULL);
INSERT INTO "trackers" VALUES('jimdo.com','jimdo.com',NULL,10,NULL,NULL,NULL,'jimdo.com',NULL);
INSERT INTO "trackers" VALUES('srvtrck.com','srvtrck.com',NULL,12,NULL,NULL,NULL,'srvtrck.com',NULL);
INSERT INTO "trackers" VALUES('tribal_fusion','Tribal Fusion','Tribal Fusion is the leading site representation company, serving 20 billion monthly impressions and reaching over 230 million users worldwide per month. We partner with top quality web publishers to provide advertisers with targeted ad placements. Offering site-specific, channel-wide and run-of-network placements, we deliver results through expert advice and intelligent technology.',4,'http://www.tribalfusion.com/','http://cdn.betteradvertising.com/logos/exponential.png','exponential_interactive','84',NULL);
INSERT INTO "trackers" VALUES('snap_engage','Snap Engage',NULL,2,NULL,NULL,'snap_engage','2294',NULL);
INSERT INTO "trackers" VALUES('gfk','GfK','Profile in progress',4,'http://nurago.com/','http://cdn.betteradvertising.com/logos/nurago.png','gfk_nurago','753',NULL);
INSERT INTO "trackers" VALUES('qualtrics','Qualtrics',NULL,6,'http://www.qualtrics.com/','http://','qualtrics','1531',NULL);
INSERT INTO "trackers" VALUES('juicyads','JuicyAds','JuicyAds is the most sexy advertising network on the planet. It is a marketplace for Publishers to increase their revenues by selling ad space to Advertisers. We specialize in Direct Buy ads on specific websites and targetted Run of Network campaigns. ',3,'http://www.juicyads.com/','http://cdn.betteradvertising.com/logos/juicyads.png','juicyads','550',NULL);
INSERT INTO "trackers" VALUES('cquotient.com','CQuotient',NULL,6,'https://www.demandware.com/#cquotient',NULL,'salesforce','cquotient.com',NULL);
INSERT INTO "trackers" VALUES('ancora','Ancora',NULL,6,NULL,NULL,'ancora','2660',NULL);
INSERT INTO "trackers" VALUES('adclear','AdClear','',4,'http://www.adclear.de/en/home.html','http://cdn.betteradvertising.com/logos/adclear.png','adclear','1273',NULL);
INSERT INTO "trackers" VALUES('crimtan','Crimtan','Crimtan is a behavioral ad network built on Red Aril''s proprietary data management and advertising optimization platform. They provide advertisers with audience segmentation, optimization, ad delivery and reporting. Audience intelligence is gathered anonymously from multiple sources of user activity and provides real-time insight into audience interests and purchase intent.',4,'http://www.crimtan.com/','http://cdn.betteradvertising.com/logos/crimtan.png','crimtan','520',NULL);
INSERT INTO "trackers" VALUES('dynadmic','DynAdmic',NULL,4,NULL,NULL,NULL,'c_3173',NULL);
INSERT INTO "trackers" VALUES('viglink','VigLink','The easiest way to monetize links on your site. ',4,'http://www.viglink.com','http://cdn.betteradvertising.com/logos/viglink.png','viglink','350',NULL);
INSERT INTO "trackers" VALUES('dawandastatic.com','Dawanda CDN',NULL,8,'https://dawanda.com/',NULL,NULL,'dawandastatic.com',NULL);
INSERT INTO "trackers" VALUES('tubecup.org','tubecup.org',NULL,3,NULL,NULL,NULL,'tubecup.org',NULL);
INSERT INTO "trackers" VALUES('media.net','Media.net','',4,'http://www.media.net/','http://cdn.betteradvertising.com/logos/medianet.png','media.net','1643',NULL);
INSERT INTO "trackers" VALUES('rtmark.net','Advertising Technologies Ltd',NULL,4,'http://rtmark.net/',NULL,'big_wall_vision','rtmark.net',NULL);
INSERT INTO "trackers" VALUES('trackjs','TrackJS',NULL,6,'http://www.trackjs.com/','http://','trackjs','2170',NULL);
INSERT INTO "trackers" VALUES('elastic_ad','Elastic Ad',NULL,4,NULL,NULL,'elastic_ad','2250',NULL);
INSERT INTO "trackers" VALUES('intercom','Intercom','Intercom is a customer relationship management and messaging tool for web app owners.',2,'http://intercom.io/','http://cdn.betteradvertising.com/logos/intercom.png','intercom','792',NULL);
INSERT INTO "trackers" VALUES('adyoulike','Adyoulike',NULL,4,'http://www.adyoulike.com/','http://','adyoulike','1596',NULL);
INSERT INTO "trackers" VALUES('web_wipe_anlaytics','Wipe Analytics','TENSQUARE develops custom technological solutions and developments for the Internet and other digital media. They work with technology to provide concepts, design, and software development for websites, Intranets, Extranets and CD/DVD.',6,'http://tensquare.de','http://cdn.betteradvertising.com/logos/tensquare.png','tensquare','651',NULL);
INSERT INTO "trackers" VALUES('adnium.com','Adnium',NULL,4,'https://adnium.com/',NULL,NULL,'adnium.com',NULL);
INSERT INTO "trackers" VALUES('markmonitor','MarkMonitor',NULL,4,'https://www.markmonitor.com/','','markmonitor','1241',NULL);
INSERT INTO "trackers" VALUES('azureedge.net','Azure CDN',NULL,9,NULL,NULL,'microsoft','azureedge.net',NULL);
INSERT INTO "trackers" VALUES('bd4travel.com','bd4travel.com',NULL,NULL,NULL,NULL,NULL,'bd4travel.com',NULL);
INSERT INTO "trackers" VALUES('iovation','iovation',NULL,5,NULL,NULL,'iovation','2264',NULL);
INSERT INTO "trackers" VALUES('adtr02.com','adtr02.com',NULL,NULL,NULL,NULL,NULL,'adtr02.com',NULL);
INSERT INTO "trackers" VALUES('scribblelive','ScribbleLive',NULL,8,NULL,NULL,NULL,'c_3436',NULL);
INSERT INTO "trackers" VALUES('unruly_media','Unruly Media','',4,'http://www.unrulymedia.com/','http://cdn.betteradvertising.com/logos/unruly.png','unruly','1298',NULL);
INSERT INTO "trackers" VALUES('beeswax','Beeswax',NULL,2,NULL,NULL,'beeswax','2394',NULL);
INSERT INTO "trackers" VALUES('contentsquare.net','ContentSquare',NULL,4,'https://www.contentsquare.com/',NULL,NULL,'contentsquare.net',NULL);
INSERT INTO "trackers" VALUES('geotrust','GeoTrust',NULL,5,'http://www.geotrust.com/','http://','geotrust','2109',NULL);
INSERT INTO "trackers" VALUES('zemanta','Zemanta','Zemanta is a revolutionary new platform for accelerating on-line content production for any web user. Any user-created text (a blog post, article or web page) is directly “read” by Zemanta, which recognizes all contextual content. Zemanta then combs the web for the most relevant images, smart links, keywords and text, instantly serving these results to the user to enrich and inform their content. What’s more, Zemanta can be deployed on all major content publishing platforms and web browsers through a simple plug-in.',2,'http://www.zemanta.com/','http://cdn.betteradvertising.com/logos/zemanta.png','zemanta','213',NULL);
INSERT INTO "trackers" VALUES('trafficfabrik.com','Traffic Fabrik',NULL,3,'https://www.trafficfabrik.com/',NULL,NULL,'trafficfabrik.com',NULL);
INSERT INTO "trackers" VALUES('rncdn3.com','Reflected Networks',NULL,9,'http://www.rncdn3.com/',NULL,NULL,'rncdn3.com',NULL);
INSERT INTO "trackers" VALUES('skype','Skype','Skype is an online communication software company. Skype can be used on phone or computer or a TV with Skype on it. and can be used to speak, see and instant message other Skype users.',2,'http://www.skype.com','http://cdn.betteradvertising.com/logos/skype.png','microsoft','1991',NULL);
INSERT INTO "trackers" VALUES('fit_analytics','Fit Analytics',NULL,6,NULL,NULL,'fit_analytics','2693',NULL);
INSERT INTO "trackers" VALUES('dimml','DimML',NULL,8,NULL,NULL,NULL,'c_3410',NULL);
INSERT INTO "trackers" VALUES('sonobi','Sonobi','"We''re a digital display advertising company Sonobi Media. We bring web publishers and advertisers together via a single buying and selling solution tuned to enable publishers to maximize ad revenue and advertisers to buy quality impressions."',4,'http://sonobi.com/','http://cdn.betteradvertising.com/logos/sonobimedia.png','sonobi','917',NULL);
INSERT INTO "trackers" VALUES('belboon_gmbh','belboon GmbH',NULL,8,NULL,NULL,NULL,'c_2583',NULL);
INSERT INTO "trackers" VALUES('web.de','web.de',NULL,8,'https://web.de/',NULL,NULL,'web.de',NULL);
INSERT INTO "trackers" VALUES('iasds01.com','iasds01.com',NULL,NULL,NULL,NULL,NULL,'iasds01.com',NULL);
INSERT INTO "trackers" VALUES('autoscout24.net','autoscout24.net',NULL,NULL,NULL,NULL,NULL,'autoscout24.net',NULL);
INSERT INTO "trackers" VALUES('flickr_badge','Flickr','"Show off your favorite photos and videos to the world, securely and privately show content to your friends and family, or blog the photos and videos you take with a cameraphone."',7,'http://www.flickr.com/','http://cdn.betteradvertising.com/logos/flickr.png','verizon','1928',NULL);
INSERT INTO "trackers" VALUES('globalsign','GlobalSign',NULL,8,NULL,NULL,NULL,'c_2400',NULL);
INSERT INTO "trackers" VALUES('adloox','Adloox','"Our mission: to enable advertisers and media agencies to protect their digital communication and to help adnetworks and platforms to raise the value of their inventory."',4,'http://www.adloox.com','http://cdn.betteradvertising.com/logos/adloox.png','adloox','943',NULL);
INSERT INTO "trackers" VALUES('groupm_server','GroupM Server','Holding company and server.',4,'http://www.groupm.com/','http://cdn.betteradvertising.com/logos/groupm.png','groupm','456',NULL);
INSERT INTO "trackers" VALUES('bongacams.com','bongacams.com',NULL,3,NULL,NULL,NULL,'bongacams.com',NULL);
INSERT INTO "trackers" VALUES('symantec','Symantec (Norton Secured Seal)',NULL,5,NULL,NULL,'symantec__norton_secured_seal_','2305',NULL);
INSERT INTO "trackers" VALUES('vergic.com','vergic.com',NULL,NULL,NULL,NULL,NULL,'vergic.com',NULL);
INSERT INTO "trackers" VALUES('esprit.de','esprit.de',NULL,8,NULL,NULL,NULL,'esprit.de',NULL);
INSERT INTO "trackers" VALUES('mncdn.com','MediaNova CDN',NULL,9,'https://www.medianova.com/',NULL,NULL,'mncdn.com',NULL);
INSERT INTO "trackers" VALUES('marshadow.io','marshadow.io',NULL,4,NULL,NULL,NULL,'marshadow.io',NULL);
INSERT INTO "trackers" VALUES('bangdom.com','BangBros',NULL,3,NULL,NULL,NULL,'bangdom.com',NULL);
INSERT INTO "trackers" VALUES('teufel.de','teufel.de',NULL,8,'https://www.teufel.de/',NULL,NULL,'teufel.de',NULL);
INSERT INTO "trackers" VALUES('webgains','Webgains',NULL,8,NULL,NULL,NULL,'c_682',NULL);
INSERT INTO "trackers" VALUES('truste_consent','Truste Consent',NULL,5,NULL,NULL,'trustarc','2813',NULL);
INSERT INTO "trackers" VALUES('inspsearchapi.com','Infospace Search',NULL,4,'http://infospace.com/',NULL,'system1','inspsearchapi.com',NULL);
INSERT INTO "trackers" VALUES('tagman','TagMan','TagMan is an independent, universal container tag management system.  It addresses the problems associated with site tagging and tracking of online marketing campaigns by providing universal, or server side, tag solutions. By using this single universal tag, online marketers can save time and money in the way they track campaigns and see how all online channels are working together.',5,'http://www.tagman.com/','http://cdn.betteradvertising.com/logos/tagman.png','tagman','457',NULL);
INSERT INTO "trackers" VALUES('livechat','LiveChat',NULL,2,'http://www.livechatinc.com','http://','livechat','1618',NULL);
INSERT INTO "trackers" VALUES('reddit','Reddit','"reddit is a source for what''s new and popular on the web. Users like you provide all of the content and decide, through voting, what''s good and what''s junk."',7,'http://reddit.com','http://cdn.betteradvertising.com/logos/reddit.png','reddit','1094',NULL);
INSERT INTO "trackers" VALUES('oclasrv.com','oclasrv.com',NULL,11,NULL,NULL,NULL,'oclasrv.com',NULL);
INSERT INTO "trackers" VALUES('flxone','FLXONE',NULL,4,'http://www.flxone.com/','http://','flxone','1667',NULL);
INSERT INTO "trackers" VALUES('shopgate.com','Shopgate',NULL,2,'https://www.shopgate.com/',NULL,NULL,'shopgate.com',NULL);
INSERT INTO "trackers" VALUES('mapandroute.de','Map and Route',NULL,2,'http://www.mapandroute.de/',NULL,NULL,'mapandroute.de',NULL);
INSERT INTO "trackers" VALUES('vidible','Vidible',NULL,4,'http://vidible.tv/','http://','verizon','2207',NULL);
INSERT INTO "trackers" VALUES('tradelab','Tradelab',NULL,4,'http://www.tradelab.fr/','http://','tradelab','1641',NULL);
INSERT INTO "trackers" VALUES('twyn','Twyn','',4,'http://www.twyn.com','http://cdn.betteradvertising.com/logos/twyn.png','twyn','887',NULL);
INSERT INTO "trackers" VALUES('catchpoint','Catchpoint',NULL,6,'http://www.catchpoint.com/','http://','catchpoint_systems','1800',NULL);
INSERT INTO "trackers" VALUES('nosto.com','nosto',NULL,6,'http://www.nosto.com/',NULL,NULL,'nosto.com',NULL);
INSERT INTO "trackers" VALUES('similardeals.net','SimilarDeals',NULL,8,'http://www.similardeals.net/',NULL,NULL,'similardeals.net',NULL);
INSERT INTO "trackers" VALUES('adult_webmaster_empire','Adult Webmaster Empire','',3,'http://www.awempire.com/','http://cdn.betteradvertising.com/logos/adultwebmasterempire.png','adult_webmaster_empire','986',NULL);
INSERT INTO "trackers" VALUES('usemax','Usemax',NULL,4,'http://www.usemax.de','','usemax','1414',NULL);
INSERT INTO "trackers" VALUES('autoscout24.com','autoscout24.com',NULL,NULL,NULL,NULL,NULL,'autoscout24.com',NULL);
INSERT INTO "trackers" VALUES('nexage','Nexage','Nexage is the leading provider of market liquidity for buyers and sellers in the mobile advertising market. The Nexage Revenue Platform, comprised of an RTB exchange and mediation, maximizes revenue for publishers and developers, and campaign ROI for demand sources and advertisers.',4,'http://www.nexage.com/','http://cdn.betteradvertising.com/logos/nexage1.png','verizon','1478',NULL);
INSERT INTO "trackers" VALUES('doubleverify','DoubleVerify','DoubleVerify is a provider of online media verification. We help increase online advertising accountability and transparency by providing agencies, marketers, publishers and ad networks with real-time audit and verification of online advertising transactions.',4,'http://www.doubleverify.com/','http://cdn.betteradvertising.com/logos/doubleverify.png','doubleverify','217',NULL);
INSERT INTO "trackers" VALUES('octapi.net','octapi.net',NULL,11,NULL,NULL,NULL,'octapi.net',NULL);
INSERT INTO "trackers" VALUES('eloqua','Eloqua','Web analytics software can tell you how many visitors viewed a page for accurate marketing campaign measurement. Eloqua identifies each visitor so you can contact them and sell to them.

Eloqua website analytics transforms business websites into a powerful mechanism for systematically cultivating, engaging and capturing sales opportunities. Website profiling allows you to define and create visitor profiles quickly and easily. View customizable reports and see where your suspects and prospects are visiting. Search profiling provides a real-time view into what is driving each individual visitor to your website. Understand your search marketing effectiveness across all of your visitors for all major search engines including Google, Yahoo, and MSN.',4,'http://www.eloqua.com/','http://cdn.betteradvertising.com/logos/eloqua.png','oracle','166',NULL);
INSERT INTO "trackers" VALUES('adelphic','Adelphic',NULL,6,NULL,NULL,'adelphic','2533',NULL);
INSERT INTO "trackers" VALUES('mycdn.me','mycdn.me',NULL,11,NULL,NULL,NULL,'mycdn.me',NULL);
INSERT INTO "trackers" VALUES('adworx.at','adworx',NULL,4,'http://www.adworx.at/',NULL,NULL,'adworx.at',NULL);
INSERT INTO "trackers" VALUES('adspyglass','AdSpyglass',NULL,4,NULL,NULL,'adspyglass','2835',NULL);
INSERT INTO "trackers" VALUES('sexypartners.net','sexypartners.net',NULL,3,NULL,NULL,NULL,'sexypartners.net','15/11/17: Private whois, landing page redirects to offersupply.com.');
INSERT INTO "trackers" VALUES('adify','Adify','Every marketing dollar counts and Adify maximizes your reach to target for every campaign. Specific vertical ad networks developed by our Network Builders may exactly match your target. Adify Audiences selects across networks to match your needs. Why buy on traditional networks placing your ad on the SAME sites as you buy directly  just in sub-prime locations?

Ads running on Adify have premier placement on unique, hand-selected sites cultivated by many of the brands you know and trust.
Advertisers can see site lists BEFORE your campaign starts and of course our real-time reports include by site performance.
Engage audiences with beyond the banner advertising such as content syndication, video advertising and super rich media.',4,'http://www.adify.com/','http://cdn.betteradvertising.com/logos/coxdigitalsolutions.png','cox_enterpries','105',NULL);
INSERT INTO "trackers" VALUES('chatango','Chatango',NULL,2,'http://www.chatango.com/','http://','chatango','1653',NULL);
INSERT INTO "trackers" VALUES('springserve','SpringServe',NULL,4,NULL,NULL,'springserve','2754',NULL);
INSERT INTO "trackers" VALUES('united_digital_group','United Digital Group',NULL,4,'https://www.udg.de/',NULL,NULL,'c_2403',NULL);
INSERT INTO "trackers" VALUES('adverserve','adverServe',NULL,4,'http://www.adverserve.com/','http://','adverserve','1683',NULL);
INSERT INTO "trackers" VALUES('segment','Segment','"Segment is an analytics service for web applications."',6,'https://segment.io/','http://cdn.betteradvertising.com/logos/segmentio.png','segment','933',NULL);
INSERT INTO "trackers" VALUES('sekindo','Sekindo',NULL,4,'http://www.sekindo.com/','','sekindo','1174',NULL);
INSERT INTO "trackers" VALUES('perimeterx.net','Perimeterx',NULL,6,'https://www.perimeterx.com/',NULL,NULL,'perimeterx.net',NULL);
INSERT INTO "trackers" VALUES('klarmobil.de','klarmobil.de',NULL,NULL,NULL,NULL,NULL,'klarmobil.de',NULL);
INSERT INTO "trackers" VALUES('adnet.de','adNET.de',NULL,4,'http://www.adnet.de','','adnet.de','1413',NULL);
INSERT INTO "trackers" VALUES('cursecdn.com','cursecdn.com',NULL,9,NULL,NULL,NULL,'cursecdn.com',NULL);
INSERT INTO "trackers" VALUES('po.st','Po.st','RadiumOne is an online advertising network that works with publishers around the world buying display advertising space and re-selling it in targeted packages to advertisers and agencies. The targeting options available range from geographic locations to user interest-based.',7,'http://www.radiumone.com/index.html','http://cdn.betteradvertising.com/logos/radiumone.png','rhythmone','1081',NULL);
INSERT INTO "trackers" VALUES('switch_concepts','Switch Concepts','Switch Concepts is a digital marketing network that connects advertisers that want to speak to social businesses to websites that target social entrepreneurs.
',4,'http://www.switchconcepts.co.uk/','http://cdn.betteradvertising.com/logos/switchconcepts.png','switch_concepts','1343',NULL);
INSERT INTO "trackers" VALUES('ask.com','Ask.com',NULL,7,NULL,NULL,NULL,'c_679',NULL);
INSERT INTO "trackers" VALUES('dynamic_yield','Dynamic Yield',NULL,8,NULL,NULL,NULL,'c_2280',NULL);
INSERT INTO "trackers" VALUES('1822direkt.de','1822direkt.de',NULL,NULL,NULL,NULL,NULL,'1822direkt.de',NULL);
INSERT INTO "trackers" VALUES('hola_player','Hola Player',NULL,0,NULL,NULL,'hola_cdn','2937',NULL);
INSERT INTO "trackers" VALUES('localhost','localhost',NULL,NULL,NULL,NULL,NULL,'localhost',NULL);
INSERT INTO "trackers" VALUES('zog.link','zog.link',NULL,11,NULL,NULL,NULL,'zog.link','15/11/17: Domain is registered to Michel Vuijlsteke (http://zog.org)');
INSERT INTO "trackers" VALUES('richrelevance','RichRelevance','richrelevance is the leading provider of next-generation personalization and product recommendation tools for enterprise-class eCommerce sites, including Sears.com. The company’s suite of SaaS-based offerings, including richrecs™, richmail™, and myrecs™, are easily integrated and sustainably increase sales by 5-30% while enhancing the shopping experience. Built on the enRICH™ platform, richrelevance products offer robust merchandiser control, are exclusively retailer focused, and employ over 30 different recommendation types with cross-placement optimization and a closed-feedback loop to display relevant, clearly-explained product recommendations.',4,'http://www.richrelevance.com/','http://cdn.betteradvertising.com/logos/richrelevance.png','richrelevance','224',NULL);
INSERT INTO "trackers" VALUES('tubemogul','TubeMogul','TubeMogul provides a technology platform for simplifying the delivery of video ads and maximizing the impact of advertisers'' ad spend. Their PlayTime platform delivers video ads to audiences in multiple formats, and various devices.',4,'http://tubemogul.com/','http://cdn.betteradvertising.com/logos/tubemogul.png','tubemogul','736',NULL);
INSERT INTO "trackers" VALUES('bugsnag','Bugsnag',NULL,6,'https://bugsnag.com','http://','bugsnag','2091',NULL);
INSERT INTO "trackers" VALUES('aloodo','Aloodo',NULL,6,NULL,NULL,'aloodo','2254',NULL);
INSERT INTO "trackers" VALUES('codeonclick.com','codeonclick.com',NULL,11,NULL,NULL,NULL,'codeonclick.com',NULL);
INSERT INTO "trackers" VALUES('imgix.net','ImgIX',NULL,9,'https://www.imgix.com/',NULL,NULL,'imgix.net',NULL);
INSERT INTO "trackers" VALUES('eanalyzer.de','eanalyzer.de',NULL,11,NULL,NULL,NULL,'eanalyzer.de','15/11/17: Registered to n@work Internet Informationssysteme GmbH (work.de)');
INSERT INTO "trackers" VALUES('gravityrd-services.com','gravityrd-services.com',NULL,NULL,NULL,NULL,NULL,'gravityrd-services.com',NULL);
INSERT INTO "trackers" VALUES('greatviews.de','GreatViews','Parship Adserver',4,'http://greatviews.de/',NULL,'parship','greatviews.de',NULL);
INSERT INTO "trackers" VALUES('idcdn.de','idcdn.de',NULL,NULL,NULL,NULL,NULL,'idcdn.de',NULL);
INSERT INTO "trackers" VALUES('lkqd','LKQD',NULL,4,NULL,NULL,'lkqd','2833',NULL);
INSERT INTO "trackers" VALUES('woopic.com','woopic.com',NULL,NULL,NULL,NULL,NULL,'woopic.com',NULL);
INSERT INTO "trackers" VALUES('eyeview','Eyeview','Eyeview develops technology solutions that enable advertisers and agencies to create and target personalized video ads. We have both a passion for online video advertising and a vision for what it can be in the digital age. We aspire to bring the most comprehensive, advanced video advertising technology solution to the market.

Our technology enhances brand quality video ads by adding dynamic compositions that are updated and targeted in real-time. With Eyeview’s technology, advertisers provide a more personal, relevant, local and brand effective video experience',4,'http://www.eyeviewdigital.com/','http://cdn.betteradvertising.com/logos/eyeview.png','eyeview','1515',NULL);
INSERT INTO "trackers" VALUES('valiton','Valiton',NULL,4,'https://www.valiton.com/','http://','hubert_burda_media','1751',NULL);
INSERT INTO "trackers" VALUES('stripe.com','Stripe',NULL,2,'https://stripe.com/',NULL,NULL,'stripe.com',NULL);
INSERT INTO "trackers" VALUES('coll1onf.com','coll1onf.com',NULL,NULL,NULL,NULL,NULL,'coll1onf.com',NULL);
INSERT INTO "trackers" VALUES('salecycle','SaleCycle','',4,'http://www.salecycle.com/','http://cdn.betteradvertising.com/logos/salecycle.png','salecycle','1130',NULL);
INSERT INTO "trackers" VALUES('id-news.net','id-news.net',NULL,NULL,NULL,NULL,NULL,'id-news.net',NULL);
INSERT INTO "trackers" VALUES('doofinder.com','doofinder',NULL,2,'https://www.doofinder.com/',NULL,NULL,'doofinder.com',NULL);
INSERT INTO "trackers" VALUES('exdynsrv.com','exdynsrv.com',NULL,12,NULL,NULL,NULL,'exdynsrv.com',NULL);
INSERT INTO "trackers" VALUES('gft2.de','gft2.de',NULL,NULL,NULL,NULL,NULL,'gft2.de',NULL);
INSERT INTO "trackers" VALUES('ixquick.com','ixquick.com',NULL,NULL,NULL,NULL,NULL,'ixquick.com',NULL);
INSERT INTO "trackers" VALUES('loadbee.com','loadbee.com',NULL,NULL,NULL,NULL,NULL,'loadbee.com',NULL);
INSERT INTO "trackers" VALUES('findizer.fr','Findizer',NULL,8,'http://www.findizer.fr/',NULL,NULL,'findizer.fr',NULL);
INSERT INTO "trackers" VALUES('wix.com','Wix',NULL,8,'https://www.wix.com/',NULL,NULL,'wix.com',NULL);
INSERT INTO "trackers" VALUES('7tv.de','7tv.de',NULL,0,'https://www.7tv.de/',NULL,NULL,'7tv.de',NULL);
INSERT INTO "trackers" VALUES('opta.net','opta.net',NULL,NULL,NULL,NULL,NULL,'opta.net',NULL);
INSERT INTO "trackers" VALUES('zedo','Zedo','ZEDO is an Internet ad serving company that has been offering a variety of products and services to top web sites, advertisers and networks since 1999. ZEDO''s Third Generation Ad Serving\u2122 technology is designed to help web sites, advertisers and networks lower their operating costs and increase their revenue. Currently, the technology serves over 25 billion ads a month for hundreds of sites and leads the industry in scalability, ease of use and features.',4,'http://www.zedo.com/','http://cdn.betteradvertising.com/logos/zedo.png','zedo','102',NULL);
INSERT INTO "trackers" VALUES('alibaba.com','Alibaba',NULL,8,NULL,NULL,'alibaba','alibaba.com',NULL);
INSERT INTO "trackers" VALUES('crossengage','CrossEngage',NULL,6,NULL,NULL,'crossengage','2621',NULL);
INSERT INTO "trackers" VALUES('solads.media','solads.media',NULL,4,'http://solads.media/',NULL,NULL,'solads.media',NULL);
INSERT INTO "trackers" VALUES('office.com','office.com',NULL,8,NULL,NULL,'microsoft','office.com',NULL);
INSERT INTO "trackers" VALUES('adotmob.com','Adotmob',NULL,4,'https://adotmob.com/',NULL,NULL,'adotmob.com',NULL);
INSERT INTO "trackers" VALUES('liveadexchanger.com','liveadexchanger.com',NULL,11,NULL,NULL,NULL,'liveadexchanger.com',NULL);
INSERT INTO "trackers" VALUES('brandwire.tv','BrandWire',NULL,4,'https://brandwire.tv/',NULL,NULL,'brandwire.tv',NULL);
INSERT INTO "trackers" VALUES('dditscdn.com','dditscdn.com',NULL,NULL,NULL,NULL,NULL,'dditscdn.com',NULL);
INSERT INTO "trackers" VALUES('gumgum','gumgum','GumGum is an analytics and monetization platform for content online. GumGum enables content-owners to safely distribute and monetize their content while making the best content in the world accessible to publishers of all sizes.',4,'http://gumgum.com/','http://cdn.betteradvertising.com/logos/gumgum.png','gumgum','95',NULL);
INSERT INTO "trackers" VALUES('bombora','Bombora',NULL,6,NULL,'http://cdn.betteradvertising.com/logos/bombora.png','bombora','2284',NULL);
INSERT INTO "trackers" VALUES('king.com','King.com',NULL,4,NULL,NULL,'king.com','2689',NULL);
INSERT INTO "trackers" VALUES('admeira.ch','AdMeira',NULL,4,'http://admeira.ch/',NULL,NULL,'admeira.ch',NULL);
INSERT INTO "trackers" VALUES('adventori','ADventori',NULL,8,NULL,NULL,NULL,'c_3265',NULL);
INSERT INTO "trackers" VALUES('stayfriends.de','stayfriends.de',NULL,8,'https://www.stayfriends.de/',NULL,NULL,'stayfriends.de',NULL);
INSERT INTO "trackers" VALUES('apester','Apester',NULL,4,'http://apester.com/',NULL,'apester','2930',NULL);
INSERT INTO "trackers" VALUES('bulkhentai.com','bulkhentai.com',NULL,3,NULL,NULL,NULL,'bulkhentai.com',NULL);
INSERT INTO "trackers" VALUES('metapeople','Metapeople',NULL,4,'http://www.metapeople.com/us/','http://cdn.betteradvertising.com/logos/metapeople.png','metapeople','1920',NULL);
INSERT INTO "trackers" VALUES('smartlook','Smartlook',NULL,2,NULL,NULL,'smartlook','2638',NULL);
INSERT INTO "trackers" VALUES('getintent','GetIntent',NULL,4,'http://www.getintent.com/','http://','getintent','2004',NULL);
INSERT INTO "trackers" VALUES('sumome','SumoMe',NULL,6,'http://sumome.com/','http://','sumome','2177',NULL);
INSERT INTO "trackers" VALUES('kairion.de','kairion',NULL,4,'https://kairion.de/',NULL,'prosieben_sat1','',NULL);
INSERT INTO "trackers" VALUES('trsv3.com','trsv3.com',NULL,11,NULL,NULL,NULL,'trsv3.com',NULL);
INSERT INTO "trackers" VALUES('powerlinks','PowerLinks',NULL,4,'http://www.powerlinks.com/','http://','powerlinks','1300',NULL);
INSERT INTO "trackers" VALUES('lifestreet_media','LifeStreet Media','Founded in 2005, LifeStreet Media has become the largest social media ad network, serving billions of impressions each month into 8,000+ applications and sites to a global audience of over 100 million. The company’s proprietary technology, customer focus, and commitment to compliance with advertising guidelines have allowed it to quickly achieve market leadership. Fusing optimization technology with human insight, LifeStreet Media relentlessly creates and optimizes thousands of ads and landing pages on behalf of its advertisers. This approach maximizes revenues, eliminates guesswork, and saves time and resources for advertisers, developers and publishers alike.',4,'http://lifestreetmedia.com/','http://cdn.betteradvertising.com/logos/lifestreetmedia.png','lifestreet_media','1149',NULL);
INSERT INTO "trackers" VALUES('sparkasse.de','sparkasse.de',NULL,8,NULL,NULL,NULL,'sparkasse.de',NULL);
INSERT INTO "trackers" VALUES('netmining','Netmining','Netmining is a website optimization and analytics company that provide behavioral marketing solutions for online publishers, email programs and offline sales channels. With a real-time profiling engine that scores an individual''s interest and buying propensity, this enables companies to deliver relevant and personalized interactions across the entire customer lifecycle. Netmining is an Innovation Interactive company.',4,'http://www.netmining.com/','http://cdn.betteradvertising.com/logos/netmining.png','netmining','358',NULL);
INSERT INTO "trackers" VALUES('videoplaza','Videoplaza',NULL,4,'http://www.videoplaza.com/','http://','videoplaza','1746',NULL);
INSERT INTO "trackers" VALUES('inspectlet','Inspectlet','Profile in progress',6,'https://www.inspectlet.com/','http://cdn.betteradvertising.com/logos/inspectlet.png','inspectlet','851',NULL);
INSERT INTO "trackers" VALUES('yume','YuMe',NULL,4,NULL,NULL,NULL,'c_281',NULL);
INSERT INTO "trackers" VALUES('nanigans','Nanigans','',4,'http://www.nanigans.com/','http://cdn.betteradvertising.com/logos/nanigans.png','nanigans','1362',NULL);
INSERT INTO "trackers" VALUES('certona','Certona','Resonance® Recommendations™ is a real-time, multi-channel personalization and revenue optimization platform.

Resonance Recommendations provides targeted content for websites from personalized landing pages to optimized search and product recommendations throughout the site.

Resonance Recommendations improves engagement and conversion with a personalized experience.',4,'http://www.certona.com/products/recommendation.php','http://cdn.betteradvertising.com/logos/certona.png','certona__resonance_','283',NULL);
INSERT INTO "trackers" VALUES('affimax','AffiMax',NULL,4,'https://www.affimax.de','','affimax','1197',NULL);
INSERT INTO "trackers" VALUES('hubspot','HubSpot','HubSpot is an inbound marketing system to help your small or medium sized business get found on the Internet by the right prospects and convert more of them into leads and customers for maximum marketing ROI.',4,'http://www.hubspot.com/','http://cdn.betteradvertising.com/logos/hubspot.png','hubspot','26',NULL);
INSERT INTO "trackers" VALUES('quisma','Quisma','QUISMA is a German performance based marketing agency, specializing in keyword advertising and search engine marketing (SEM), search engine optimization (SEO) and affiliate marketing and display advertising As a global full-service agency, they participate in all phases of online marketing activity, from strategic consulting to campaign implementation including cost-efficiency and control. Quisma is a GroupM company.',4,'http://www.quisma.com/en/','http://cdn.betteradvertising.com/logos/quisma.png','quisma','537',NULL);
INSERT INTO "trackers" VALUES('pusher.com','Pusher',NULL,6,'https://pusher.com/',NULL,NULL,'pusher.com',NULL);
INSERT INTO "trackers" VALUES('blogsmithmedia.com','blogsmithmedia.com',NULL,NULL,NULL,NULL,NULL,'blogsmithmedia.com',NULL);
INSERT INTO "trackers" VALUES('sojern','Sojern','Sojern is a travel oriented ad network for both online and offline advertising. Sojern has partnerships directly with airlines that allow them to place advertisements on boarding passes and other non-traditional offline media. ',4,'http://www.sojern.com/','http://cdn.betteradvertising.com/logos/sojern.png','sojern','1698',NULL);
INSERT INTO "trackers" VALUES('sublime_skinz','Sublime Skinz',NULL,4,NULL,NULL,NULL,'2962',NULL);
INSERT INTO "trackers" VALUES('keen_io','Keen IO',NULL,6,'https://keen.io','http://','keen_io','1820',NULL);
INSERT INTO "trackers" VALUES('digiteka','Digiteka',NULL,4,NULL,NULL,'digiteka','2773',NULL);
INSERT INTO "trackers" VALUES('ard.de','ard.de',NULL,0,NULL,NULL,NULL,'ard.de',NULL);
INSERT INTO "trackers" VALUES('decenthat.com','decenthat.com',NULL,NULL,NULL,NULL,NULL,'decenthat.com',NULL);
INSERT INTO "trackers" VALUES('netflix','Netflix',NULL,8,NULL,NULL,NULL,'c_2098',NULL);
INSERT INTO "trackers" VALUES('tp-cdn.com','tp-cdn.com',NULL,NULL,NULL,NULL,NULL,'tp-cdn.com',NULL);
INSERT INTO "trackers" VALUES('adtelligence.de','Adtelligence',NULL,4,'https://adtelligence.com/',NULL,NULL,'adtelligence.de',NULL);
INSERT INTO "trackers" VALUES('tawk','Tawk',NULL,2,NULL,NULL,'tawk','2417',NULL);
INSERT INTO "trackers" VALUES('firebaseio.com','Firebase',NULL,8,'https://firebase.google.com/',NULL,'google','firebaseio.com',NULL);
INSERT INTO "trackers" VALUES('shopauskunft.de','shopauskunft.de',NULL,NULL,NULL,NULL,NULL,'shopauskunft.de',NULL);
INSERT INTO "trackers" VALUES('dcmn.com','dcmn.com',NULL,NULL,NULL,NULL,NULL,'dcmn.com',NULL);
INSERT INTO "trackers" VALUES('mythings','myThings','My Things Media',4,'http://www.mythings.com/','http://cdn.betteradvertising.com/logos/mythingsmedia.png','mythings_','524',NULL);
INSERT INTO "trackers" VALUES('asambeauty.com','asambeauty.com',NULL,8,'https://www.asambeauty.com/',NULL,NULL,'asambeauty.com',NULL);
INSERT INTO "trackers" VALUES('dailymotion','Dailymotion',NULL,8,NULL,NULL,NULL,'c_1475',NULL);
INSERT INTO "trackers" VALUES('cam-content.com','cam-content.com',NULL,NULL,NULL,NULL,NULL,'cam-content.com',NULL);
INSERT INTO "trackers" VALUES('ttvnw.net','ttvnw.net',NULL,NULL,NULL,NULL,NULL,'ttvnw.net',NULL);
INSERT INTO "trackers" VALUES('dmwd','DMWD',NULL,8,NULL,NULL,NULL,'c_3253',NULL);
INSERT INTO "trackers" VALUES('voicefive','VoiceFive','VoiceFive is market research company focused on research through surveys and panels. Each panel is hosted on an independent Website, with a description, type of research performed, and the entities sponsoring the research provided.  Participants install research software onto their computer, allowing their online browsing and purchasing behavior (including the content of all web pages) to be monitored. VoiceFive is a subsidiary of ComScore.',6,'https://www.voicefive.com','http://cdn.betteradvertising.com/logos/voicefive.png','comscore','404',NULL);
INSERT INTO "trackers" VALUES('run','RUN','',4,'http://www.rundsp.com/','http://cdn.betteradvertising.com/logos/run1.png','run','1947',NULL);
INSERT INTO "trackers" VALUES('orange','Orange','',4,'http://www.orange.co.uk/','http://cdn.betteradvertising.com/logos/orange.png','orange_mobile','1743',NULL);
INSERT INTO "trackers" VALUES('media-imdb.com','media-imdb.com',NULL,NULL,NULL,NULL,NULL,'media-imdb.com',NULL);
INSERT INTO "trackers" VALUES('marketo','Marketo','Unite Sales and Marketing to Drive Revenue and Improve Marketing Accountability

Marketo provides sophisticated yet easy marketing automation software that helps marketing and sales work together to drive revenue and improve marketing accountability. Marketo’s Lead Management and Lead Insight for Sales solutions include email marketing, lead nurturing, lead scoring, and closed-loop reporting capabilities to generate and qualify sales leads, shorten sales cycles, demonstrate marketing ROI, and drive revenue growth.',4,'http://www.marketo.com/','http://cdn.betteradvertising.com/logos/marketo.png','marketo','159',NULL);
INSERT INTO "trackers" VALUES('shopify_stats','Shopify Stats',NULL,4,'http://www.shopify.com/','http://','shopify','1272',NULL);
INSERT INTO "trackers" VALUES('dc_stormiq','DC StormIQ','StormIQ™ is an integrated web analytics and PPC optimisation platform, offering unbeatable tracking, reporting and optimisation.',4,'http://www.dc-storm.com/','http://cdn.betteradvertising.com/logos/dcstorm.png','dc_storm','250',NULL);
INSERT INTO "trackers" VALUES('maxpoint_interactive','MaxPoint Interactive','MaxPoint is an online advertising technology company that offers neighborhood level targeting to compel in-store purchase for national and local brands. The company identifies potential customers through customized consumer profiles and Digital Zip, their neighborhood-level targeting technology. This enables ad targeting to a specific location within a retailerâ€™s trade area and campaigns to match demand for a specific product.',4,'http://www.maxpointinteractive.com/','http://cdn.betteradvertising.com/logos/maxpoint.png','maxpoint_interactive','724',NULL);
INSERT INTO "trackers" VALUES('adxpansion','AdXpansion','Targeted adult traffic.',3,'http://www.adxpansion.com/','http://cdn.betteradvertising.com/logos/adxpansion.png','adxpansion','481',NULL);
INSERT INTO "trackers" VALUES('onaudience','OnAudience',NULL,4,'http://www.onaudience.com/',NULL,NULL,'2981',NULL);
INSERT INTO "trackers" VALUES('uservoice','UserVoice','UserVoice Inc provides products to individuals/enterprises to improve their business by obtaining customer feedback,votes and providing forums. The products are available to customers for startups, enterprise,conferences, non profits,etc.',2,'http://uservoice.com/','http://cdn.betteradvertising.com/logos/uservoice.png','uservoice','59',NULL);
INSERT INTO "trackers" VALUES('owneriq','OwnerIQ','OwnerIQ operates a network of channel-focused websites to help find and store must have self-support product information. This enables marketing professionals to target their online market communications, including advertising, direct marketing, and market research by using consumers purchase behavior; and brand advertisers with customized programs to target consumers based on products they already own.',4,'http://www.owneriq.com/','http://cdn.betteradvertising.com/logos/owneriq.png','owneriq','359',NULL);
INSERT INTO "trackers" VALUES('convertro','Convertro','Convertro provides online conversion and media attribution solutions for companies. It offers visitor tracking, media attribution, and phone tracking solutions.  Their Visitor tracking code captures conversion events and all associated visitor sessions and referring sources.
',4,'http://www.convertro.com/','http://cdn.betteradvertising.com/logos/convertro.png','verizon','582',NULL);
INSERT INTO "trackers" VALUES('connextra','Connextra','Connextra is an ad serving company focused on the gambling and travel industries. Their technology enables integration of live pricing into online ads helping to maximize the performance of the creative and to improve results from publishing partners and affiliates. Connextra''s services include IP and browser targeting, linking live data to editorial content, real-time statistics and reporting and real-time editing of Flash, HTML or GIF advertisements.',4,'http://connextra.com/','http://cdn.betteradvertising.com/logos/connextra.png','connextra','472',NULL);
INSERT INTO "trackers" VALUES('yandex_adexchange','Yandex AdExchange',NULL,4,NULL,NULL,'yandex','2914',NULL);
INSERT INTO "trackers" VALUES('digicert_trust_seal','Digicert Trust Seal','"SSL Certificates from DigiCert provide the strongest 2048-Bit and SHA-2 encryption available in a variety of options designed to meet your needs."',5,'http://www.digicert.com/','http://cdn.betteradvertising.com/logos/digicert.png','digicert','2108',NULL);
INSERT INTO "trackers" VALUES('urban-media.com','urban-media.com',NULL,NULL,NULL,NULL,NULL,'urban-media.com',NULL);
INSERT INTO "trackers" VALUES('marketgrid','Marketgrid',NULL,4,NULL,NULL,'marketgid_ru','2855',NULL);
INSERT INTO "trackers" VALUES('adtiger','AdTiger','AdTiger is an German marketing agency. AdTiger.de is a project of arejo Ltd.',4,'http://www.adtiger.de/','http://cdn.betteradvertising.com/logos/adtiger.png','adtiger','276',NULL);
INSERT INTO "trackers" VALUES('pulpix.com','pulpix.com',NULL,NULL,NULL,NULL,NULL,'pulpix.com',NULL);
INSERT INTO "trackers" VALUES('branch_metrics','Branch',NULL,4,NULL,NULL,'branch_metrics_inc','2398',NULL);
INSERT INTO "trackers" VALUES('smartclick.net','SmartClick',NULL,4,'http://smartclick.net/',NULL,NULL,'smartclick.net',NULL);
INSERT INTO "trackers" VALUES('xing','Xing',NULL,6,NULL,NULL,'xing','2636',NULL);
INSERT INTO "trackers" VALUES('travel_audience','Travel Audience',NULL,6,NULL,NULL,NULL,'2944',NULL);
INSERT INTO "trackers" VALUES('streamrail.com','StreamRail',NULL,0,'https://www.streamrail.com/',NULL,'ironsource','streamrail.com',NULL);
INSERT INTO "trackers" VALUES('t8cdn.com','t8cdn.com',NULL,NULL,NULL,NULL,NULL,'t8cdn.com',NULL);
INSERT INTO "trackers" VALUES('sueddeutsche.com','sueddeutsche.com',NULL,NULL,NULL,NULL,NULL,'sueddeutsche.com',NULL);
INSERT INTO "trackers" VALUES('apple','Apple','Apple is an American multinational corporation that designs and markets consumer electronics, computer software, and personal computers. iAd is their mobile ad network.',4,'http://www.apple.com/','http://cdn.betteradvertising.com/logos/apple.png','apple','2027',NULL);
INSERT INTO "trackers" VALUES('magnetic','Magnetic','Magnetic provide tools for advertisers and publishers to leverage search data to target and retarget ad campaigns to the most relevant audience online.',4,'http://www.magnetic.is','http://cdn.betteradvertising.com/logos/magnetic.png','magnetic','526',NULL);
INSERT INTO "trackers" VALUES('schneevonmorgen.com','Schnee von Morgen',NULL,0,'http://www.schneevonmorgen.com/',NULL,NULL,'schneevonmorgen.com',NULL);
INSERT INTO "trackers" VALUES('fullstory','FullStory',NULL,6,NULL,NULL,'fullstory','2372',NULL);
INSERT INTO "trackers" VALUES('vicomi.com','vicomi.com',NULL,NULL,NULL,NULL,NULL,'vicomi.com',NULL);
INSERT INTO "trackers" VALUES('alipay.com','Alipay',NULL,2,'https://www.alipay.com/',NULL,'alibaba','alipay.com',NULL);
INSERT INTO "trackers" VALUES('deichmann.com','deichmann.com',NULL,4,NULL,NULL,NULL,'deichmann.com',NULL);
INSERT INTO "trackers" VALUES('upravel.com','upravel.com',NULL,11,NULL,NULL,NULL,'upravel.com',NULL);
INSERT INTO "trackers" VALUES('hqentertainmentnetwork.com','hqentertainmentnetwork.com',NULL,NULL,NULL,NULL,NULL,'hqentertainmentnetwork.com',NULL);
INSERT INTO "trackers" VALUES('here__formerly_navteq_media_solutions_','HERE (formerly Navteq Media Solutions)',NULL,8,NULL,NULL,NULL,'c_449',NULL);
INSERT INTO "trackers" VALUES('commission_junction','CJ Affiliate','Commission Junction provides online performance marketing solutions for advertisers and publishers. It offers them a comprehensive suite of affiliate marketing, management, recruitment and administrative services. Acting as a third party Commission Junction tracks, serves, reports and pays for pay-for-performance transactions. Commission Junction is a ValueClick company.',4,'http://www.cj.com/','http://cdn.betteradvertising.com/logos/commissionjunction.png','apn_news_media','557',NULL);
INSERT INTO "trackers" VALUES('othersearch.info','FlowSurf',NULL,8,NULL,NULL,NULL,'othersearch.info',NULL);
INSERT INTO "trackers" VALUES('avocet','Avocet',NULL,8,NULL,NULL,NULL,'c_3588',NULL);
INSERT INTO "trackers" VALUES('toplist.cz','toplist.cz',NULL,11,NULL,NULL,NULL,'toplist.cz',NULL);
INSERT INTO "trackers" VALUES('optimicdn.com','OptimiCDN',NULL,9,'https://en.optimicdn.com/',NULL,NULL,'optimicdn.com',NULL);
INSERT INTO "trackers" VALUES('bounce_exchange','Bounce Exchange',NULL,4,'http://bounceexchange.com','http://','bounce_exchange','1463',NULL);
INSERT INTO "trackers" VALUES('rtblab','RTBmarkt',NULL,4,'http://www.rtbmarkt.de/en/home/','',NULL,'1196',NULL);
INSERT INTO "trackers" VALUES('haendlerbund.de','Händlerbund',NULL,2,'https://www.haendlerbund.de/en',NULL,NULL,'haendlerbund.de',NULL);
INSERT INTO "trackers" VALUES('cdn-net.com','cdn-net.com',NULL,NULL,NULL,NULL,NULL,'cdn-net.com',NULL);
INSERT INTO "trackers" VALUES('omarsys.com','Omarsys',NULL,4,'http://omarsys.com/',NULL,'xcaliber','omarsys.com',NULL);
INSERT INTO "trackers" VALUES('adfox','AdFox','Russian text advertising company.',4,'http://adfox.ru','http://cdn.betteradvertising.com/logos/adfox.png','adfox','422',NULL);
INSERT INTO "trackers" VALUES('iperceptions','iPerceptions','   1.  Who is coming to your website?
   2. Why are they there?
   3. How are you doing?
   4. What do you need to fix?

iPerceptions is helping leading organizations all over the world answer these burning questions.

Do you have the answers? Your visitors do. All you need to do is listen to them. ',2,'http://www.iperceptions.com/','http://cdn.betteradvertising.com/logos/iperceptions.png','iperceptions','220',NULL);
INSERT INTO "trackers" VALUES('pusherapp.com','pusherapp.com',NULL,NULL,NULL,NULL,NULL,'pusherapp.com',NULL);
INSERT INTO "trackers" VALUES('chaturbate.com','chaturbate.com',NULL,3,NULL,NULL,NULL,'chaturbate.com',NULL);
INSERT INTO "trackers" VALUES('sixt-neuwagen.de','sixt-neuwagen.de',NULL,8,NULL,NULL,NULL,'sixt-neuwagen.de',NULL);
INSERT INTO "trackers" VALUES('sparda.de','sparda.de',NULL,NULL,NULL,NULL,NULL,'sparda.de',NULL);
INSERT INTO "trackers" VALUES('yieldify','Yieldify',NULL,4,'http://www.yieldify.com/','http://','yieldify','1779',NULL);
INSERT INTO "trackers" VALUES('cdnetworks.net','cdnetworks.net',NULL,NULL,NULL,NULL,NULL,'cdnetworks.net',NULL);
INSERT INTO "trackers" VALUES('komoona','Komoona','',4,'http://www.komoona.com/','http://cdn.betteradvertising.com/logos/komoona.png','komoona','1091',NULL);
INSERT INTO "trackers" VALUES('freewheel','FreeWheel','FreeWheel Media offers Monetization Rights Management (MRM), an online video advertising solution to syndicate video, manage ad sales, and analyze performance, FreeWheel''s platform technology serves video and companion ads. Clients include content owners, distributors, and third-party ad sellers and networks. The company helps media companies sell to advertisers and agencies.',0,'http://www.freewheel.tv/','http://cdn.betteradvertising.com/logos/freewheel.png','comcast','380',NULL);
INSERT INTO "trackers" VALUES('sessioncam','SessionCam',NULL,6,'http://www.sessioncam.com/','','sessioncam','1379',NULL);
INSERT INTO "trackers" VALUES('sailthru_horizon','Sailthru Horizon','',4,'https://www.sailthru.com','http://cdn.betteradvertising.com/logos/sailthru.png','sailthru','983',NULL);
INSERT INTO "trackers" VALUES('datacaciques.com','datacaciques.com',NULL,NULL,NULL,NULL,NULL,'datacaciques.com',NULL);
INSERT INTO "trackers" VALUES('mediarithmics.com','Mediarithmics',NULL,4,'http://www.mediarithmics.com/en/',NULL,NULL,'mediarithmics.com',NULL);
INSERT INTO "trackers" VALUES('clicktripz','ClickTripz',NULL,4,'https://www.clicktripz.com','http://','clicktripz','1977',NULL);
INSERT INTO "trackers" VALUES('apicit.net','apicit.net',NULL,NULL,NULL,NULL,NULL,'apicit.net',NULL);
INSERT INTO "trackers" VALUES('ampproject.org','ampproject.org',NULL,NULL,NULL,NULL,NULL,'ampproject.org',NULL);
INSERT INTO "trackers" VALUES('deviantart.net','deviantart.net',NULL,NULL,NULL,NULL,NULL,'deviantart.net',NULL);
INSERT INTO "trackers" VALUES('txxx.com','txxx.com',NULL,8,'https://txxx.com',NULL,NULL,'txxx.com',NULL);
INSERT INTO "trackers" VALUES('uppr.de','uppr.de',NULL,NULL,NULL,NULL,NULL,'uppr.de',NULL);
INSERT INTO "trackers" VALUES('2app.lk','2app.lk',NULL,NULL,NULL,NULL,NULL,'2app.lk',NULL);
INSERT INTO "trackers" VALUES('get_site_control','Get Site Control',NULL,4,NULL,NULL,'getsitecontrol','2872',NULL);
INSERT INTO "trackers" VALUES('clicky','Clicky','Clicky is a web analyzer that works great with any web site, even Ajax and Flash sites. It was originally targeted towards smaller web sites and blogs because it tracks a high level of detail on every visitor, and these types of sites find this information very interesting. Since then, many additional features have been added to Clicky, such as the customizable dashboard full of Ajax love, and our amazing filtering interface that gives you actionable data on any subset of your visitors. These features, along with many others, make Clicky one of the best web analyzers on the planet.',6,'http://getclicky.com/','http://getclicky.com/media/logo.gif','clicky','3',NULL);
INSERT INTO "trackers" VALUES('msedge.net','msedge.net',NULL,NULL,NULL,NULL,NULL,'msedge.net',NULL);
INSERT INTO "trackers" VALUES('wikia_beacon','Wikia Beacon',NULL,6,'http://www.wikia.com/','','wikia','1202',NULL);
INSERT INTO "trackers" VALUES('aldi-international.com','aldi-international.com',NULL,8,NULL,NULL,NULL,'aldi-international.com',NULL);
INSERT INTO "trackers" VALUES('bigpoint','Bigpoint',NULL,8,NULL,NULL,NULL,'c_1959',NULL);
INSERT INTO "trackers" VALUES('rythmxchange','Rythmxchange',NULL,0,NULL,NULL,'rythmone','2323',NULL);
INSERT INTO "trackers" VALUES('stuff.com','stuff.com',NULL,NULL,NULL,NULL,NULL,'stuff.com',NULL);
INSERT INTO "trackers" VALUES('lenua.de','Lenua System',NULL,4,'http://lenua.de/',NULL,'synatix','lenua.de',NULL);
INSERT INTO "trackers" VALUES('lentainform.com','lentainform.com',NULL,8,'https://www.lentainform.com/',NULL,NULL,'lentainform.com',NULL);
INSERT INTO "trackers" VALUES('avail','Avail',NULL,4,'http://avail.com','http://','avail','1559',NULL);
INSERT INTO "trackers" VALUES('ladies.de','ladies.de',NULL,NULL,NULL,NULL,NULL,'ladies.de',NULL);
INSERT INTO "trackers" VALUES('mps-gba.de','mps-gba.de',NULL,NULL,NULL,NULL,NULL,'mps-gba.de',NULL);
INSERT INTO "trackers" VALUES('twitch.tv','Twitch',NULL,0,NULL,NULL,'amazon_associates','twitch.tv',NULL);
INSERT INTO "trackers" VALUES('olark','Olark','Olark provides offers a live chat solution for businesses'' websites. Their solution integrates live support and chat to businesses'' existing CRM efforts and software.',2,'http://www.olark.com/','http://cdn.betteradvertising.com/logos/olark.png','olark','655',NULL);
INSERT INTO "trackers" VALUES('oracle_rightnow','Oracle RightNow',NULL,8,NULL,NULL,'oracle','c_1170',NULL);
INSERT INTO "trackers" VALUES('sirdata','Sirdata',NULL,6,NULL,NULL,'sirdata','2659',NULL);
INSERT INTO "trackers" VALUES('wdr.de','wdr.de',NULL,8,'https://www1.wdr.de/index.html',NULL,NULL,'wdr.de',NULL);
INSERT INTO "trackers" VALUES('sexiba.com','sexiba.com',NULL,NULL,NULL,NULL,NULL,'sexiba.com',NULL);
INSERT INTO "trackers" VALUES('elba.at','elba.at',NULL,NULL,NULL,NULL,NULL,'elba.at',NULL);
INSERT INTO "trackers" VALUES('tumblr_buttons','Tumblr Buttons','Tumblr is a platform for blogging and sharing online content. Their customizable tools let users post text, photos, quotes, links, music, and videos, from web browsers, phones, desktop and email.',7,'http://www.tumblr.com/','http://cdn.betteradvertising.com/logos/tumblr.png','tumblr','1205',NULL);
INSERT INTO "trackers" VALUES('fandommetrics.com','fandommetrics.com',NULL,NULL,NULL,NULL,NULL,'fandommetrics.com',NULL);
INSERT INTO "trackers" VALUES('hotelreservation.com','hotelreservation.com',NULL,NULL,NULL,NULL,NULL,'hotelreservation.com',NULL);
INSERT INTO "trackers" VALUES('netseer','NetSeer','NetSeer is a technology start-up focused on contextual media and ad targeting.',4,'http://www.netseer.com/','http://cdn.betteradvertising.com/logos/netseer.png','netseer','608',NULL);
INSERT INTO "trackers" VALUES('vivalu','VIVALU',NULL,4,NULL,NULL,'vivalu','2290',NULL);
INSERT INTO "trackers" VALUES('errorception','Errorception','',6,'http://errorception.com/','http://cdn.betteradvertising.com/logos/errorception.png','errorception','982',NULL);
INSERT INTO "trackers" VALUES('iias.eu','iias.eu',NULL,NULL,NULL,NULL,NULL,'iias.eu',NULL);
INSERT INTO "trackers" VALUES('impact_radius','Impact Radius',NULL,5,'http://www.impactradius.com/','http://','impact_radius','1330',NULL);
INSERT INTO "trackers" VALUES('answers_cloud_service','Answers Cloud Service',NULL,1,NULL,NULL,'answers.com','2302',NULL);
INSERT INTO "trackers" VALUES('aniview.com','AniView',NULL,4,'https://www.aniview.com/',NULL,NULL,'aniview.com',NULL);
INSERT INTO "trackers" VALUES('onclickmax.com','onclickmax.com',NULL,NULL,NULL,NULL,NULL,'onclickmax.com',NULL);
INSERT INTO "trackers" VALUES('decibel_insight','Decibel Insight',NULL,6,NULL,NULL,'decibel_insight','2232',NULL);
INSERT INTO "trackers" VALUES('adobe_tagmanager','Adobe TagManager','Adobe is a diversified software company. They offer a line of business and mobile software and services tools used by professionals, designers, knowledge workers and developers for creating, managing and delivering content across multiple operating systems, devices and media. Adobe''s products include Photoshop, Portable Document Format (PDF), their server software product, ColdFusion and development tools including AIR and Flash. Their online marketing suite is powered by Omniture.  ',4,'http://www.adobe.com/','http://cdn.betteradvertising.com/logos/adobesystems.png','adobe','1377',NULL);
INSERT INTO "trackers" VALUES('overheat.it','overheat.it',NULL,NULL,NULL,NULL,NULL,'overheat.it',NULL);
INSERT INTO "trackers" VALUES('snowplow','Snowplow',NULL,6,NULL,NULL,'snowplow','2671',NULL);
INSERT INTO "trackers" VALUES('psyma','Psyma',NULL,4,'http://www.psyma.com/','http://','psyma','1850',NULL);
INSERT INTO "trackers" VALUES('bauer_media','Bauer Media',NULL,4,NULL,NULL,'bauer_media','2911',NULL);
INSERT INTO "trackers" VALUES('homeaway','HomeAway',NULL,8,NULL,NULL,NULL,'c_2665',NULL);
INSERT INTO "trackers" VALUES('perfect_audience','Perfect Audience',NULL,4,'https://www.perfectaudience.com/','','perfect_audience','1403',NULL);
INSERT INTO "trackers" VALUES('itineraire.info','itineraire.info',NULL,NULL,NULL,NULL,NULL,'itineraire.info',NULL);
INSERT INTO "trackers" VALUES('revcontent','RevContent',NULL,4,'https://www.revcontent.com/','http://','revcontent','2195',NULL);
INSERT INTO "trackers" VALUES('algolia.net','algolia.net',NULL,NULL,NULL,NULL,NULL,'algolia.net',NULL);
INSERT INTO "trackers" VALUES('zergnet','ZergNet','',2,'http://www.zergnet.com/info','http://cdn.betteradvertising.com/logos/zergnet.png','zergnet','1124',NULL);
INSERT INTO "trackers" VALUES('adskeeper','AdsKeeper',NULL,4,NULL,NULL,'adskeeper','2632',NULL);
INSERT INTO "trackers" VALUES('jivox','Jivox','',4,'http://www.jivox.com/','http://cdn.betteradvertising.com/logos/jivox.png','jivox','1690',NULL);
INSERT INTO "trackers" VALUES('basilic.io','basilic.io',NULL,NULL,NULL,NULL,NULL,'basilic.io',NULL);
INSERT INTO "trackers" VALUES('crosssell.info','econda Cross Sell',NULL,4,'https://www.econda.de/en/solutions/personalization/cross-sell/',NULL,'econda','crosssell.info',NULL);
INSERT INTO "trackers" VALUES('hi-media_performance','Hi-Media Performance','Hi-media Performance is an online advertising network. Hi-media Performance and sister company Allopass, micro-payments solutions provider, are owned by the Hi-media Group.',4,'http://www.hi-mediaperformance.co.uk/','http://cdn.betteradvertising.com/logos/himediaperformance.png','hi-media_performance','715',NULL);
INSERT INTO "trackers" VALUES('perform_group','Perform Group',NULL,5,'http://www.performgroup.co.uk/','http://','perform_group','1255',NULL);
INSERT INTO "trackers" VALUES('kenshoo','Kenshoo','The Kenshoo Universal Platform delivers automation, business intelligence, integration and scale to make better marketing investments. ',6,'http://www.kenshoo.com/','http://cdn.betteradvertising.com/logos/kenshoo.png','kenshoo','903',NULL);
INSERT INTO "trackers" VALUES('stepstone.com','stepstone.com',NULL,NULL,NULL,NULL,NULL,'stepstone.com',NULL);
INSERT INTO "trackers" VALUES('clever_push','Clever Push',NULL,6,NULL,NULL,'clever_push','2618',NULL);
INSERT INTO "trackers" VALUES('urldelivery.com','urldelivery.com',NULL,NULL,NULL,NULL,NULL,'urldelivery.com',NULL);
INSERT INTO "trackers" VALUES('sim-technik.de','sim-technik.de',NULL,NULL,NULL,NULL,NULL,'sim-technik.de',NULL);
INSERT INTO "trackers" VALUES('recreativ','Recreativ',NULL,4,'http://recreativ.ru/','http://','recreativ','1315',NULL);
INSERT INTO "trackers" VALUES('polldaddy','Polldaddy','The most powerful and easy-to-use survey software around. Create stunning surveys, polls, and quizzes in minutes. Collect responses via your website,  e-mail, iPad, Facebook, and Twitter. Generate and share easy-to-read reports.',2,'http://polldaddy.com/','http://cdn.betteradvertising.com/logos/polldaddy.png','polldaddy','607',NULL);
INSERT INTO "trackers" VALUES('s3xified.com','s3xified.com',NULL,11,NULL,NULL,NULL,'s3xified.com',NULL);
INSERT INTO "trackers" VALUES('traveltainment.de','traveltainment.de',NULL,NULL,NULL,NULL,NULL,'traveltainment.de',NULL);
INSERT INTO "trackers" VALUES('microsoft','Microsoft Services',NULL,8,NULL,'http://cdn.betteradvertising.com/logos/microsoftadvertising.png','microsoft','c_250',NULL);
INSERT INTO "trackers" VALUES('intent_media','Intent Media','Intent Media provides advertising to e-commerce sites and enables these sites to turn customer intent into new revenue streams. They connect advertisers with markets of interested buyers by providing audience segmentation services and delivers new inventory to performance marketers.',4,'http://www.intentmedia.com/','http://cdn.betteradvertising.com/logos/intentmedia.png','intent_media','733',NULL);
INSERT INTO "trackers" VALUES('rtl_group','RTL Group',NULL,8,NULL,NULL,NULL,'c_2991',NULL);
INSERT INTO "trackers" VALUES('skadtec.com','GP One GmbH',NULL,6,'http://www.gp-one.com/',NULL,NULL,'skadtec.com',NULL);
INSERT INTO "trackers" VALUES('nativo','Nativo',NULL,4,'http://www.nativo.net/','http://','nativo','1528',NULL);
INSERT INTO "trackers" VALUES('kaltura','Kaltura','"Kaltura is the world''s first Open Source Online Video Platform, providing both enterprise level commercial software and services, fully supported and maintained by Kaltura, as well as free open-source community supported solutions, for video publishing, management, syndication and monetization."',0,'http://corp.kaltura.com/','http://cdn.betteradvertising.com/logos/kaltura.png','kaltura','1394',NULL);
INSERT INTO "trackers" VALUES('effiliation','Effiliation',NULL,4,'http://www.effiliation.com/','http://','effiliation','1843',NULL);
INSERT INTO "trackers" VALUES('intimate_merger','Intimate Merger',NULL,6,NULL,NULL,'intimate_merger','2588',NULL);
INSERT INTO "trackers" VALUES('barclaycard.de','barclaycard.de',NULL,NULL,NULL,NULL,NULL,'barclaycard.de',NULL);
INSERT INTO "trackers" VALUES('innogames.de','InnoGames',NULL,8,'https://www.innogames.com/',NULL,NULL,'innogames.de',NULL);
INSERT INTO "trackers" VALUES('districtm.io','district m',NULL,4,'https://districtm.net/',NULL,NULL,'districtm.io',NULL);
INSERT INTO "trackers" VALUES('yandex.api','Yandex.API','Yandex is a Russian search engine and Internet services firm. They also offer a variety of other online services including: news, weather, traffic, maps, personal email, and a web analytics platform. Yandex also operates an ad network.',2,'http://api.yandex.ru/','http://cdn.betteradvertising.com/logos/yandex.png','yandex','670',NULL);
INSERT INTO "trackers" VALUES('xceler8.io','xceler8.io',NULL,NULL,NULL,NULL,NULL,'xceler8.io',NULL);
INSERT INTO "trackers" VALUES('snacktv','SnackTV',NULL,6,NULL,NULL,NULL,'2519',NULL);
INSERT INTO "trackers" VALUES('trafficforce','TrafficForce',NULL,4,'http://www.trafficforce.com/','http://','trafficforce','2089',NULL);
INSERT INTO "trackers" VALUES('lacmp.net','lacmp.net',NULL,NULL,NULL,NULL,NULL,'lacmp.net',NULL);
INSERT INTO "trackers" VALUES('rollbar','Rollbar',NULL,6,'http://www.rollbar.com/','http://','rollbar','1828',NULL);
INSERT INTO "trackers" VALUES('baur.de','baur.de',NULL,8,NULL,NULL,NULL,'baur.de',NULL);
INSERT INTO "trackers" VALUES('vepxl1.net','vepxl1.net',NULL,NULL,NULL,NULL,NULL,'vepxl1.net',NULL);
INSERT INTO "trackers" VALUES('adwebster','adwebster',NULL,4,'http://adwebster.com','http://','adwebster','2071',NULL);
INSERT INTO "trackers" VALUES('clickonometrics','Clickonometrics',NULL,4,'http://clickonometrics.pl/','http://','clickonometrics','1789',NULL);
INSERT INTO "trackers" VALUES('realytics.io','realytics.io',NULL,NULL,NULL,NULL,NULL,'realytics.io',NULL);
INSERT INTO "trackers" VALUES('nativeads.com','nativeads.com',NULL,NULL,NULL,NULL,NULL,'nativeads.com',NULL);
INSERT INTO "trackers" VALUES('proxistore.com','Proxistore',NULL,4,'https://www.proxistore.com/',NULL,NULL,'proxistore.com',NULL);
INSERT INTO "trackers" VALUES('greentube.com','Greentube Internet Entertainment Solutions',NULL,7,'https://www.greentube.com/',NULL,NULL,'greentube.com',NULL);
INSERT INTO "trackers" VALUES('heroku','Heroku',NULL,10,NULL,NULL,NULL,'c_3374',NULL);
INSERT INTO "trackers" VALUES('adzerk','Adzerk','Adzerk is a supplier ad-servers and ad-serving technology. Their platform offers features such as real-time reporting, ad serving and network building support.',4,'http://adzerk.com/','http://cdn.betteradvertising.com/logos/adzerk.png','adzerk','1066',NULL);
INSERT INTO "trackers" VALUES('lengow','Lengow',NULL,4,'http://www.lengow.com/','','lengow','1215',NULL);
INSERT INTO "trackers" VALUES('adworxs.net','adworxs.net',NULL,NULL,NULL,NULL,NULL,'adworxs.net',NULL);
INSERT INTO "trackers" VALUES('jscache.com','jscache.com',NULL,NULL,NULL,NULL,NULL,'jscache.com',NULL);
INSERT INTO "trackers" VALUES('clickintext','ClickInText','ClickInText is an advertising agency that provides a variety of technologies to meet the advertising needs of their advertisers.',4,'http://www.clickintext.com/','http://cdn.betteradvertising.com/logos/clickintext.png','clickintext','718',NULL);
INSERT INTO "trackers" VALUES('tamedia.ch','tamedia.ch',NULL,NULL,NULL,NULL,NULL,'tamedia.ch',NULL);
INSERT INTO "trackers" VALUES('visible_measures','Visible Measures','Visible Measures is a provider of independent third party measurement solutions for internet video publishers and advertisers. Visible Measures benchmarks the world of online video providing industry standard performance metrics across video content, video ads and audiences for  the online video community.',4,'http://www.visiblemeasures.com/','http://cdn.betteradvertising.com/logos/visiblemeasures.png','visible_measures','450',NULL);
INSERT INTO "trackers" VALUES('gamedistribution.com','gamedistribution.com',NULL,NULL,NULL,NULL,NULL,'gamedistribution.com',NULL);
INSERT INTO "trackers" VALUES('flattr_button','Flattr Button','"Flattr is the worlds first social micro-payment system...Flattr was founded to help people share money, not just content."',7,'http://flattr.com/','http://cdn.betteradvertising.com/logos/flattr.png','flattr','908',NULL);
INSERT INTO "trackers" VALUES('sstatic.net','sstatic.net',NULL,NULL,NULL,NULL,NULL,'sstatic.net',NULL);
INSERT INTO "trackers" VALUES('trustwave.com','trustwave.com',NULL,NULL,NULL,NULL,NULL,'trustwave.com',NULL);
INSERT INTO "trackers" VALUES('siteimprove','Siteimprove','"With Siteimprove Analytics it''s possible to follow your users'' behavior minute by minute, at any time of the day. An effective, clear, page-by-page analysis provides web editors with the unique potential to react quickly to significant changes in visitor behavior."',6,'http://siteimprove.com','http://cdn.betteradvertising.com/logos/siteimprove.png','siteimprove','966',NULL);
INSERT INTO "trackers" VALUES('adtrue','Adtrue',NULL,4,NULL,NULL,'adtrue','2730',NULL);
INSERT INTO "trackers" VALUES('1000mercis','1000mercis',NULL,6,NULL,NULL,'1000mercis','2662',NULL);
INSERT INTO "trackers" VALUES('ipg_mediabrands','IPG Mediabrands',NULL,4,NULL,NULL,'ipg_mediabrands','2936',NULL);
INSERT INTO "trackers" VALUES('tradetracker','TradeTracker','TradeTracker is a SaaS (Software as a Service) provider.  Their tracking software helps advertisers assess their ad performance and provide access to a network of affiliates.
',4,'http://www.tradetracker.com','http://cdn.betteradvertising.com/logos/tradetracker.png','tradetracker','556',NULL);
INSERT INTO "trackers" VALUES('adnologies','Adnologies','Adnologies GmbH is a provider of digital marketing solutions for agencies, portal operators and marketers. At the core is their ASP (Application Service Provider) ad serving solution HEIAS. The nature of the product design allows for flexibility and quick customization across many platforms . Services also include retargeting.',4,'http://www.adnologies.com/','http://cdn.betteradvertising.com/logos/adnologies.png','adnologies_gmbh','529',NULL);
INSERT INTO "trackers" VALUES('24-ads.com','24-ads.com',NULL,NULL,NULL,NULL,NULL,'24-ads.com',NULL);
INSERT INTO "trackers" VALUES('pushnative.com','pushnative.com',NULL,11,NULL,NULL,NULL,'pushnative.com',NULL);
INSERT INTO "trackers" VALUES('flag_counter','Flag Counter','"Add our free counter to any webpage and collect flags from all over the world. Every time someone from a new country visits your site, a flag will be added to your counter...Clicking on your Flag Counter will reveal amazing information and charts!"',4,'http://flagcounter.com/','http://cdn.betteradvertising.com/logos/flagcounter.png','flag_counter','1153',NULL);
INSERT INTO "trackers" VALUES('dstillery','Dstillery','The patent pending algorithms and methods connect a brand''s existing customers with user segments composed entirely of consumers who are interwoven via the social graph. These bespoke Media6 segments are both completely customized for each advertiser and enormously scalable.',4,'http://www.media6degrees.com/','http://cdn.betteradvertising.com/logos/media6degrees.png',NULL,'147',NULL);
INSERT INTO "trackers" VALUES('office.net','office.net',NULL,8,NULL,NULL,'microsoft','office.net',NULL);
INSERT INTO "trackers" VALUES('tinypass','Tinypass',NULL,5,'http://www.tinypass.com/','http://','piano__previously_tinypass_','1834',NULL);
INSERT INTO "trackers" VALUES('mobtrks.com','mobtrks.com',NULL,NULL,NULL,NULL,NULL,'mobtrks.com',NULL);
INSERT INTO "trackers" VALUES('yoochoose.net','yoochoose.net',NULL,NULL,NULL,NULL,NULL,'yoochoose.net',NULL);
INSERT INTO "trackers" VALUES('cpmstar','CPMStar','CPMStar has been providing some of the web''s best and most unique multiplayer games content via its proprietary multiplayer enabling technology. Bringing together CPMStar''s unique mix of premium brand advertisers, unique content providers, and product licensees, the CPMStar Network promises to revolutionize the world of online entertainment by allowing great content to flourish in the marketplace. CPMStar is committed to bringing innovation to interactive entertainment by helping the most exciting new content on the web succeed through intelligent design, marketing, and technology.',4,'http://www.cpmstar.com','http://cdn.betteradvertising.com/logos/cpmstar.png','cpmstar','411',NULL);
INSERT INTO "trackers" VALUES('blink_new_media','Blink New Media','Engage:BDR is a global display advertising network with a proprietary ad serving technology, Blink New Media.  They specialize in Brand-safe and placement-specific inventory that they buy directly through publishers.  ',4,'http://engagebdr.com/','http://cdn.betteradvertising.com/logos/engagebdr.png','engage:bdr__blink_new_media_','729',NULL);
INSERT INTO "trackers" VALUES('acquia.com','acquia.com',NULL,NULL,NULL,NULL,NULL,'acquia.com',NULL);
INSERT INTO "trackers" VALUES('gravity_insights','Gravity Insights','Gravity is a technology for personalization of content across the Internet. Their platform sifts through and analyzes natural language across client sites to build "interest graphs" for website and content optimization. They also own an analytics platform called Gravity Insights.',6,'http://www.gravity.com/','http://cdn.betteradvertising.com/logos/gravity.png','gravity','782',NULL);
INSERT INTO "trackers" VALUES('padstm.com','padstm.com',NULL,NULL,NULL,NULL,NULL,'padstm.com',NULL);
INSERT INTO "trackers" VALUES('baynote_observer','Baynote Observer','Baynote Observer
Based on UseRank technology, we break through the bias, noise, and gaming of click-based approaches by using dozens of different behavioral heuristics that accurately determine your visitor''s true intent. A small sample of what we look at includes:

Page Actions
 We capture visitors'' detailed interactions within a page.
Search Context
 Search context has proven to be an important indicator of a visitor''s intent.

Navigation Patterns
 Not all pageviews are created equal, Baynote understands whether pageviews are the result of success or failure.
Conversions
 We understand when a lead converts and captures the actions that lead to it',4,'http://www.baynote.com/','http://cdn.betteradvertising.com/logos/baynote.png','baynote','98',NULL);
INSERT INTO "trackers" VALUES('demandbase','Demandbase','Convert 3X More Web Traffic into Actionable Sales Leads

Lead Generation Linked to Real-Time Web Traffic Monitoring

Demandbase Professional™ is an on-demand subscription service that enables you to identify, reach and convert all Web site visitors in your target market, including those who do not submit their contact information – the 95 percent of all Web traffic we call “the silent majority.” With Demandbase Professional you can leverage your inbound marketing programs like online advertising, SEO, search marketing, social network marketing and PR that drive traffic to your site and integrate them with your direct marketing programs ? from email campaigns to telesales. ',4,'http://www.demandbase.com/','http://cdn.betteradvertising.com/logos/demandbase.png',NULL,'160',NULL);
INSERT INTO "trackers" VALUES('stackpathdns.com','stackpathdns.com',NULL,NULL,NULL,NULL,NULL,'stackpathdns.com',NULL);
INSERT INTO "trackers" VALUES('booking.com','Booking.com',NULL,8,NULL,NULL,NULL,'c_1707',NULL);
INSERT INTO "trackers" VALUES('optimatic','Optimatic',NULL,0,NULL,NULL,'optimatic','2360',NULL);
INSERT INTO "trackers" VALUES('realytics','Realytics',NULL,6,NULL,NULL,'realytics','2649',NULL);
INSERT INTO "trackers" VALUES('vi','Vi',NULL,4,'http://www.vi.ru/','http://','vi','2006',NULL);
INSERT INTO "trackers" VALUES('livefyre','Livefyre',NULL,1,'http://www.livefyre.com/','','livefyre','1420',NULL);
INSERT INTO "trackers" VALUES('digiteka.net','digiteka.net',NULL,NULL,NULL,NULL,NULL,'digiteka.net',NULL);
INSERT INTO "trackers" VALUES('tremor_video','Tremor Video',NULL,0,NULL,NULL,NULL,'tremorhub.com',NULL);
INSERT INTO "trackers" VALUES('research_now','Research Now',NULL,4,'http://www.researchnow.com/','http://','research_now','1727',NULL);
INSERT INTO "trackers" VALUES('rewe-static.de','rewe-static.de',NULL,NULL,NULL,NULL,NULL,'rewe-static.de',NULL);
INSERT INTO "trackers" VALUES('baidu_ads','Baidu Ads',NULL,4,'http://www.baidu.com/','http://cdn.betteradvertising.com/logos/baidu.png','baidu','1572',NULL);
INSERT INTO "trackers" VALUES('pixalate','Pixalate',NULL,4,NULL,NULL,'pixalate','2368',NULL);
INSERT INTO "trackers" VALUES('aidata.io','aidata.io',NULL,NULL,NULL,NULL,NULL,'aidata.io',NULL);
INSERT INTO "trackers" VALUES('mcafee_secure','McAfee Secure','McAfee is a security technology company that delivers services to protect consumers and businesses from malware and online threats. They also provide security management features that deliver real-time analytics, improve Internet security, and help businesses achieve operational efficiencies.',5,'http://www.mcafeesecure.com/us/','http://cdn.betteradvertising.com/logos/mcafeesecure.png','mcafee','778',NULL);
INSERT INTO "trackers" VALUES('livesportmedia.eu','livesportmedia.eu',NULL,NULL,NULL,NULL,NULL,'livesportmedia.eu',NULL);
INSERT INTO "trackers" VALUES('smi2.ru','smi2.ru',NULL,4,'https://smi2.ru/',NULL,NULL,'smi2.ru',NULL);
INSERT INTO "trackers" VALUES('vooxe.com','vooxe.com',NULL,NULL,NULL,NULL,NULL,'vooxe.com',NULL);
INSERT INTO "trackers" VALUES('walmart','Walmart',NULL,8,NULL,NULL,NULL,'c_793',NULL);
INSERT INTO "trackers" VALUES('mnet-ad.net','mnet-ad.net',NULL,NULL,NULL,NULL,NULL,'mnet-ad.net',NULL);
INSERT INTO "trackers" VALUES('nice264.com','nice264.com',NULL,NULL,NULL,NULL,NULL,'nice264.com',NULL);
INSERT INTO "trackers" VALUES('vidazoo.com','vidazoo.com',NULL,NULL,NULL,NULL,NULL,'vidazoo.com',NULL);
INSERT INTO "trackers" VALUES('heap','Heap',NULL,6,'https://heapanalytics.com/','http://','heap','1648',NULL);
INSERT INTO "trackers" VALUES('kaloo.ga','kaloo.ga',NULL,NULL,NULL,NULL,NULL,'kaloo.ga',NULL);
INSERT INTO "trackers" VALUES('thevideo.me','thevideo.me',NULL,NULL,NULL,NULL,NULL,'thevideo.me',NULL);
INSERT INTO "trackers" VALUES('layer-ad.org','Layer-ADS.net',NULL,4,'http://layer-ads.net/',NULL,NULL,'layer-ad.org',NULL);
INSERT INTO "trackers" VALUES('loop11','Loop11',NULL,6,NULL,NULL,'360i','2314',NULL);
INSERT INTO "trackers" VALUES('spot.im','Spot.IM',NULL,7,'https://www.spot.im/','http://','spot.im','2194',NULL);
INSERT INTO "trackers" VALUES('howtank.com','howtank.com',NULL,NULL,NULL,NULL,NULL,'howtank.com',NULL);
INSERT INTO "trackers" VALUES('sexadnetwork','SexAdNetwork','',3,'http://www.sexadnetwork.com/','http://cdn.betteradvertising.com/logos/sexadnetwork.png','sexadnetwork','1071',NULL);
INSERT INTO "trackers" VALUES('pushcrew','Pushcrew',NULL,2,NULL,NULL,'pushcrew','2572',NULL);
INSERT INTO "trackers" VALUES('swisscom','Swisscom',NULL,8,NULL,NULL,NULL,'c_3749',NULL);
INSERT INTO "trackers" VALUES('spongecell','Spongecell','Spongecell is a web services company that offers event management solutions. Spongecell''s flagship product Spongecell Promote, offers web services and tools that allow marketers and Web sites to manage events, track audiences, optimize attendance, and enhance on-going customer relationships. Spongecell Ads, are online display ads with widget-like functionality that allow users to share the contents of the ad with their friends and also, importantly, set a reminder for themselves.',4,'http://www.spongecell.com/','http://cdn.betteradvertising.com/logos/spongecell.png','spongecell','528',NULL);
INSERT INTO "trackers" VALUES('friendfinder_network','FriendFinder Network','FriendFinder Networks is an Internet-based social networking company. Their sites’ services include social networking, online personals, live and recorded video, online chat rooms, instant messaging, photo and video sharing, blogs, message boards, email and premium content websites. FriendFinder Networks also produces pictorial and video content, licenses the Penthouse brand to consumer product companies and entertainment venues, and publishes branded men’s lifestyle magazines.',3,'http://www.ffn.com/','http://cdn.betteradvertising.com/logos/adultfriendfinder.png','friendfinder_networks','600',NULL);
INSERT INTO "trackers" VALUES('netrk.net','netrk.net',NULL,NULL,NULL,NULL,NULL,'netrk.net',NULL);
INSERT INTO "trackers" VALUES('cloud-media.fr','cloud-media.fr',NULL,NULL,NULL,NULL,NULL,'cloud-media.fr',NULL);
INSERT INTO "trackers" VALUES('vizury','Vizury','',4,'http://www.vizury.com/website/','http://cdn.betteradvertising.com/logos/vizury.png','vizury','1260',NULL);
INSERT INTO "trackers" VALUES('performfeeds.com','performfeeds.com',NULL,NULL,NULL,NULL,NULL,'performfeeds.com',NULL);
INSERT INTO "trackers" VALUES('admized','ADMIZED',NULL,8,NULL,NULL,NULL,'c_3246',NULL);
INSERT INTO "trackers" VALUES('sumologic.com','sumologic.com',NULL,NULL,NULL,NULL,NULL,'sumologic.com',NULL);
INSERT INTO "trackers" VALUES('raygun','Raygun',NULL,4,NULL,NULL,'raygun','2373',NULL);
INSERT INTO "trackers" VALUES('yahoo_japan','Yahoo! Japan',NULL,8,NULL,NULL,NULL,'c_2456',NULL);
INSERT INTO "trackers" VALUES('effective_measure','Effective Measure','Effective Measure is a web analytics company that provides data about visitors to a website. Their patent-pending Digital Helix technology addresses cookie deletion issues and unique visitor audience calculations. This allows advertisers and publishers to define and measure audience numbers accurately without duplication, and track data points over a specific time period.',4,'http://www.effectivemeasure.com/','http://cdn.betteradvertising.com/logos/effectivemeasure.png','effective_measure','534',NULL);
INSERT INTO "trackers" VALUES('bluelithium','Bluelithium','We use data from 155 million online consumers worldwide, sophisticated analytics and advanced targeting technologies to create value for both marketers and publishers.',4,'http://www.bluelithium.com/','http://cdn.betteradvertising.com/logos/yahoo.png','verizon','150',NULL);
INSERT INTO "trackers" VALUES('adocean','AdOcean','AdOcean is a Poland based technology company.  Their ad serving system separates the main server, which acts as the management system, from the ad impression servers.  This allows for effective management on a high volume of advertisements by requiring less communication between the server and the web browsers of the users. The data on each ad impression are recorded in a database and used to build statistics for campaigns. AdOcean is a Gemius S.A. company.',4,'http://adocean.cz/en','http://cdn.betteradvertising.com/logos/adocean.png','adocean','621',NULL);
INSERT INTO "trackers" VALUES('amadeus.net','amadeus.net',NULL,NULL,NULL,NULL,NULL,'amadeus.net',NULL);
INSERT INTO "trackers" VALUES('c1_exchange','C1 Exchange',NULL,4,NULL,NULL,'c1_exchange_','2942',NULL);
INSERT INTO "trackers" VALUES('netbiscuits','Netbiscuits',NULL,6,'http://www.netbiscuits.net/','http://','netbiscuits','2192',NULL);
INSERT INTO "trackers" VALUES('expedia','Expedia',NULL,8,'https://www.trvl-px.com/',NULL,'iac_apps','c_510',NULL);
INSERT INTO "trackers" VALUES('nonstop_consulting','nonstop Consulting',NULL,4,'http://www.nonstopconsulting.co.uk','','united_digital_group__fka_nonstopconsulting_','1409',NULL);
INSERT INTO "trackers" VALUES('jumptap','Jumptap','Jumptap is a mobile advertising network that consists of operators (wireless carriers), publishers (provides subscribers and data to advertisers), and developer applications (iPhone).  Jumptap offers advertisers and agencies advertising solutions to reach their audience and make content relevant for mobile users. They can run ads across a comprehensive set of premium mobile channels including 10 different audience segmented packages.',4,'http://www.jumptap.com/','http://cdn.betteradvertising.com/logos/jumptap.png','millenial_media__jumptap_','1476',NULL);
INSERT INTO "trackers" VALUES('mozilla.net','mozilla.net',NULL,NULL,NULL,NULL,NULL,'mozilla.net',NULL);
INSERT INTO "trackers" VALUES('unister','Unister','"Unister Media GmbH is specialized in the marketing of online portals...Within this wide-reaching portfolio, you can book through us display advertising, newsletters and mailings integrations, performance-oriented formats as well as special implementations and integrations."',6,'http://www.unister.de/','http://cdn.betteradvertising.com/logos/unister.png','unister','1029',NULL);
INSERT INTO "trackers" VALUES('underdog_media','Underdog Media','The proprietary ad serving technology was carefully designed to be simple to use, efficient, flexible and performance-driven. Underdog’s system features advanced campaign controls, optimization tools, site and channel targeting opportunities, and real-time data.',4,'http://www.underdogmedia.com','http://cdn.betteradvertising.com/logos/underdogmedia.png','underdog_media','474',NULL);
INSERT INTO "trackers" VALUES('wwwpromoter','WWWPromoter',NULL,4,NULL,NULL,'wwwpromoter','2545',NULL);
INSERT INTO "trackers" VALUES('maxmind','MaxMind','"MaxMind provides IP intelligence through the GeoIP brand. By pinpointing the location of Internet customers and visitors by country, geographic region, city, and postal code, GeoIP data provides online businesses with a valuable marketing tool as well as the ability to customize their websites to better serve clients."',4,'http://www.maxmind.com/','http://cdn.betteradvertising.com/logos/maxmind.png','maxmind','948',NULL);
INSERT INTO "trackers" VALUES('rentalcars.com','rentalcars.com',NULL,NULL,NULL,NULL,NULL,'rentalcars.com',NULL);
INSERT INTO "trackers" VALUES('fstrk.net','fstrk.net',NULL,NULL,NULL,NULL,NULL,'fstrk.net',NULL);
INSERT INTO "trackers" VALUES('toro','TORO',NULL,4,'http://toroadvertising.com/','http://','toro_advertising','1984',NULL);
INSERT INTO "trackers" VALUES('content.ad','Content.ad',NULL,4,'https://www.content.ad/','','content.ad','1192',NULL);
INSERT INTO "trackers" VALUES('aemediatraffic','Aemediatraffic',NULL,6,NULL,NULL,NULL,'aemediatraffic.com','16/11/17: hprofits.com is a login page with copyright Aemediatraffic. aemediatraffic.com has a similar login landing. Seems to be Ukraine-based company.');
INSERT INTO "trackers" VALUES('babator.com','babator.com',NULL,NULL,NULL,NULL,NULL,'babator.com',NULL);
INSERT INTO "trackers" VALUES('algovid.com','algovid.com',NULL,11,NULL,NULL,NULL,'algovid.com',NULL);
INSERT INTO "trackers" VALUES('jetlore','Jetlore',NULL,6,NULL,NULL,'jetlore','2865',NULL);
INSERT INTO "trackers" VALUES('feedbackify','Feedbackify','',2,'http://www.feedbackify.com/','','feedbackify','1093',NULL);
INSERT INTO "trackers" VALUES('youboranqs01.com','youboranqs01.com',NULL,NULL,NULL,NULL,NULL,'youboranqs01.com',NULL);
INSERT INTO "trackers" VALUES('flixmedia','Flixmedia',NULL,8,NULL,NULL,NULL,'c_3256',NULL);
INSERT INTO "trackers" VALUES('visualdna','VisualDNA','VisualDNA is a patented profiling solution created by London-based technology company, Imagini, that enables publishers to map audiences in a totally unique way and advertisers to reach highly relevant audiences for their brands.

Using image-based quizzes and behavior tracking inference technology, we are able to generate high value actionable data at scale, profiling 100% of users on our partner sites. Advertising targeted using VisualDNA’s unique audience optimization technology delivers CTR uplift in excess of 320%.

VisualDNA quizzes are fun, entertaining and very popular with users with high potential for virality. VisualDNA has over 20 million profiled users.

Partners already using VisualDNA technology include the LA Times, Mirror, Adconion, Hotels.com, Match.com, House of Fraser, Acer, Lastminute.com, NBA, Tom.com, Pepsi, eHarmony, Tequila, the British Army and Explorra.',4,'http://www.visualdna.com/','http://resources-ms-ak.visualdna.com/www.tweetdna.com/live/20100709142629/images/twitter/poweredby-black.png','harris_ia','293',NULL);
INSERT INTO "trackers" VALUES('popcash','Popcash',NULL,4,'http://popcash.net/','http://','popcash_network','1941',NULL);
INSERT INTO "trackers" VALUES('f11-ads.com','Factor Eleven',NULL,4,NULL,NULL,NULL,'f11-ads.com',NULL);
INSERT INTO "trackers" VALUES('stumbleupon_widgets','StumbleUpon Widgets','StumbleUpon is a tool to help users discover and share websites. They offer a toolbar that delivers high-quality pages matched to users'' personal preferences. These pages have been explicitly recommended by your friends or other websurfers with interests similar.',7,'http://www.stumbleupon.com/','http://cdn.betteradvertising.com/logos/stumbleupon.png','stumbleupon','701',NULL);
INSERT INTO "trackers" VALUES('adgear','AdGear','AdGear is an ad serving technology that uses high precision audience targeting and analytics for publishers and advertisers.  The technology is focused on leveraging data and platform integration. The product supports evolving ad formats for mobile devices and video streaming.  AdGear’s data management tools allow publishers to share and sell their data profiles and supports 3rd party services including optimizers, networks, data providers and ad exchanges.  AdGear is a Bloom Digital Platform product.',4,'http://adgear.com/','http://cdn.betteradvertising.com/logos/adgear.png','samsung','391',NULL);
INSERT INTO "trackers" VALUES('extreme_tracker','eXTReMe Tracker','With the eXTReMe Tracker you get every advanced feature required to picture the visitors of your website. Conveniently arranged, numbers, percentages, stats, totals and averages. All the way up from simple counting your visitors until tracking the keywords they use to find you.',6,'http://www.extremetracking.com/','http://cdn.betteradvertising.com/logos/extremedigital.png','extreme_digital','155',NULL);
INSERT INTO "trackers" VALUES('leadplace','LeadPlace',NULL,6,NULL,NULL,'leadplace','2320',NULL);
INSERT INTO "trackers" VALUES('infolinks','InfoLinks','Infolinks presents the next generation of In-Text Advertising, leading the industry with the most relevant in-text advertising links and the highest revenue share - guaranteed.',4,'http://www.infolinks.com/','http://cdn.betteradvertising.com/logos/infolinks.png','infolinks','66',NULL);
INSERT INTO "trackers" VALUES('eventim.com','eventim.com',NULL,NULL,NULL,NULL,NULL,'eventim.com',NULL);
INSERT INTO "trackers" VALUES('smartsupp_chat','Smartsupp Chat',NULL,2,NULL,NULL,'smartsuppp','2778',NULL);
INSERT INTO "trackers" VALUES('redtube.com','redtube.com',NULL,9,NULL,NULL,NULL,'redtube.com',NULL);
INSERT INTO "trackers" VALUES('adc_media','ad:C media',NULL,4,'http://www.adcmedia.de/en/','http://cdn.betteradvertising.com/logos/adcmedia.png',NULL,'1367',NULL);
INSERT INTO "trackers" VALUES('hstrck.com','hstrck.com',NULL,NULL,NULL,NULL,NULL,'hstrck.com',NULL);
INSERT INTO "trackers" VALUES('tracc.it','tracc.it',NULL,NULL,NULL,NULL,NULL,'tracc.it',NULL);
INSERT INTO "trackers" VALUES('walkme.com','walkme.com',NULL,NULL,NULL,NULL,NULL,'walkme.com',NULL);
INSERT INTO "trackers" VALUES('freshdesk','Freshdesk','',2,'http://www.freshdesk.com','http://cdn.betteradvertising.com/logos/freshdesk.png','freshdesk','1092',NULL);
INSERT INTO "trackers" VALUES('forensiq','Forensiq',NULL,4,'http://www.cpadetective.com/','','cpa_detective','1380',NULL);
INSERT INTO "trackers" VALUES('spankcdn.net','spankcdn.net',NULL,NULL,NULL,NULL,NULL,'spankcdn.net',NULL);
INSERT INTO "trackers" VALUES('da-ads.com','da-ads.com',NULL,NULL,NULL,NULL,NULL,'da-ads.com',NULL);
INSERT INTO "trackers" VALUES('truste_seal','TRUSTe Seal','TRUSTe is a privacy certification and verification company. It certifies website and mobile privacy practices as well as approving downloadable software applications. In its compliance efforts, TRUSTe serves notices for the Self Regulatory Program for Online Behavioral Advertising, the program overseen by Digital Advertising Alliance.',5,'http://www.truste.com/','http://cdn.betteradvertising.com/logos/truste.png','trustarc','1582',NULL);
INSERT INTO "trackers" VALUES('optimonk','Optimonk',NULL,6,NULL,NULL,'optimonk','2422',NULL);
INSERT INTO "trackers" VALUES('seznam','Seznam',NULL,6,NULL,NULL,'seznam','2707',NULL);
INSERT INTO "trackers" VALUES('oxomi.com','oxomi.com',NULL,NULL,NULL,NULL,NULL,'oxomi.com',NULL);
INSERT INTO "trackers" VALUES('sas','SAS','',6,'http://www.sas.com/','http://cdn.betteradvertising.com/logos/sas.png','sas','1407',NULL);
INSERT INTO "trackers" VALUES('gdm_digital','GDM Digital','',4,'http://www.gdmdigital.com/','http://cdn.betteradvertising.com/logos/gdmdigital1.png','ve_interactive__formely_gdm_digital_','2137',NULL);
INSERT INTO "trackers" VALUES('spots.im','spots.im',NULL,NULL,NULL,NULL,NULL,'spots.im',NULL);
INSERT INTO "trackers" VALUES('adnetworkperformance.com','adnetworkperformance.com',NULL,NULL,NULL,NULL,NULL,'adnetworkperformance.com',NULL);
INSERT INTO "trackers" VALUES('stackadapt','StackAdapt',NULL,4,NULL,NULL,'stackadapt','2774',NULL);
INSERT INTO "trackers" VALUES('ria.ru','ria.ru',NULL,NULL,NULL,NULL,NULL,'ria.ru',NULL);
INSERT INTO "trackers" VALUES('sse-iacapps.com','sse-iacapps.com',NULL,NULL,NULL,NULL,NULL,'sse-iacapps.com',NULL);
INSERT INTO "trackers" VALUES('afcdn.com','afcdn.com',NULL,NULL,NULL,NULL,NULL,'afcdn.com',NULL);
INSERT INTO "trackers" VALUES('skyscnr.com','skyscnr.com',NULL,NULL,NULL,NULL,NULL,'skyscnr.com',NULL);
INSERT INTO "trackers" VALUES('imonomy','imonomy',NULL,6,NULL,NULL,'imonomy','2288',NULL);
INSERT INTO "trackers" VALUES('maru-edu','Maru-EDU',NULL,2,NULL,NULL,'maruedr','2688',NULL);
INSERT INTO "trackers" VALUES('lswcdn.net','lswcdn.net',NULL,NULL,NULL,NULL,NULL,'lswcdn.net',NULL);
INSERT INTO "trackers" VALUES('trustarc','TrustArc',NULL,5,NULL,NULL,'trustarc','c_775',NULL);
INSERT INTO "trackers" VALUES('adbetclickin.pink','adbetnet',NULL,4,'http://adbetnet.com/',NULL,NULL,'adbetclickin.pink',NULL);
INSERT INTO "trackers" VALUES('mytoys.de','mytoys.de',NULL,NULL,NULL,NULL,NULL,'mytoys.de',NULL);
INSERT INTO "trackers" VALUES('videoadex.com','videoadex.com',NULL,NULL,NULL,NULL,NULL,'videoadex.com',NULL);
INSERT INTO "trackers" VALUES('monster_advertising','Monster Advertising','Monster.com is a career and recruitment resource. The Monster Career Ad Network sources job postings automatically from Monster or MonsterTRAK, develops the postings into a creative ad that is then targeted toward appropriate candidates via strategic placements throughout the web. Monster.com is the flagship brand of Monster Worldwide, Inc.',4,'http://www.monster.com/','http://cdn.betteradvertising.com/logos/monster.png','monster_worldwide','1534',NULL);
INSERT INTO "trackers" VALUES('atlassian.net','Atlassian',NULL,NULL,NULL,NULL,NULL,'atlassian.net',NULL);
INSERT INTO "trackers" VALUES('siteimprove_analytics','SiteImprove Analytics',NULL,6,NULL,NULL,'siteimprove','2452',NULL);
INSERT INTO "trackers" VALUES('mirtesen.ru','mirtesen.ru',NULL,NULL,NULL,NULL,NULL,'mirtesen.ru',NULL);
INSERT INTO "trackers" VALUES('conrad.com','conrad.com',NULL,NULL,NULL,NULL,NULL,'conrad.com',NULL);
INSERT INTO "trackers" VALUES('upjers.com','upjers.com',NULL,NULL,NULL,NULL,NULL,'upjers.com',NULL);
INSERT INTO "trackers" VALUES('lenmit.com','lenmit.com',NULL,NULL,NULL,NULL,NULL,'lenmit.com',NULL);
INSERT INTO "trackers" VALUES('semknox.com','semknox.com',NULL,NULL,NULL,NULL,NULL,'semknox.com',NULL);
INSERT INTO "trackers" VALUES('wiredminds','WiredMinds','WiredMinds AG is a German web analytics company.',6,'http://www.wiredminds.de/','http://cdn.betteradvertising.com/logos/wiredminds.png','wiredminds','510',NULL);
INSERT INTO "trackers" VALUES('yepshare.com','yepshare.com',NULL,NULL,NULL,NULL,NULL,'yepshare.com',NULL);
INSERT INTO "trackers" VALUES('adglare.net','adglare.net',NULL,NULL,NULL,NULL,NULL,'adglare.net',NULL);
INSERT INTO "trackers" VALUES('enbrite.ly','enbrite.ly',NULL,NULL,NULL,NULL,NULL,'enbrite.ly',NULL);
INSERT INTO "trackers" VALUES('hivedx.com','hivedx.com',NULL,NULL,NULL,NULL,NULL,'hivedx.com',NULL);
INSERT INTO "trackers" VALUES('spoods.io','spoods.io',NULL,NULL,NULL,NULL,NULL,'spoods.io',NULL);
INSERT INTO "trackers" VALUES('1und1','1&1 Internet',NULL,8,NULL,NULL,NULL,'c_1566',NULL);
INSERT INTO "trackers" VALUES('audiencesquare.com','audiencesquare.com',NULL,NULL,NULL,NULL,NULL,'audiencesquare.com',NULL);
INSERT INTO "trackers" VALUES('fidelity_media','Fidelity Media',NULL,4,'http://fidelity-media.com/','http://cdn.betteradvertising.com/logos/fidelitymedia.png','fidelity_media','2078',NULL);
INSERT INTO "trackers" VALUES('adsnative','adsnative',NULL,4,'http://www.adsnative.com/','http://','adsnative','2059',NULL);
INSERT INTO "trackers" VALUES('bitdefender.de','bitdefender.de',NULL,NULL,NULL,NULL,NULL,'bitdefender.de',NULL);
INSERT INTO "trackers" VALUES('sophus3','Sophus3','Sophus3 is a provider of tools for website analysis and optimization services.',4,'http://www.sophus3.com/ ','http://cdn.betteradvertising.com/logos/sophus3.png','sophus3','714',NULL);
INSERT INTO "trackers" VALUES('rightnowtech.com','rightnowtech.com',NULL,NULL,NULL,NULL,NULL,'rightnowtech.com',NULL);
INSERT INTO "trackers" VALUES('shareaholic','Shareaholic',NULL,4,'hhttps://www.shareaholic.com/','http://cdn.betteradvertising.com/logos/shareaholic1.png','shareaholic','1421',NULL);
INSERT INTO "trackers" VALUES('wistia','Wistia',NULL,6,NULL,NULL,'wistia','2336',NULL);
INSERT INTO "trackers" VALUES('motherlessmedia.com','motherlessmedia.com',NULL,NULL,NULL,NULL,NULL,'motherlessmedia.com',NULL);
INSERT INTO "trackers" VALUES('zooroyal.de','zooroyal.de',NULL,NULL,NULL,NULL,NULL,'zooroyal.de',NULL);
INSERT INTO "trackers" VALUES('sundaysky','SundaySky','',4,'http://www.sundaysky.com/','http://cdn.betteradvertising.com/logos/sundaysky1.png','sundaysky','1530',NULL);
INSERT INTO "trackers" VALUES('pardot','Pardot','An innovative provider of on-demand interactive marketing solutions. Prospect Insight, Pardot''s industry leading marketing automation suite, is used by hundreds of sales and marketing professionals each month due to its rich feature set, ease of use, and flexibility.',6,'http://www.pardot.com/','http://cdn.betteradvertising.com/logos/pardot.png','pardot','241',NULL);
INSERT INTO "trackers" VALUES('qualaroo','Qualaroo',NULL,6,NULL,NULL,NULL,'c_2450',NULL);
INSERT INTO "trackers" VALUES('logsss.com','logsss.com',NULL,11,NULL,NULL,NULL,'logsss.com',NULL);
INSERT INTO "trackers" VALUES('internetstores.de','internetstores.de',NULL,NULL,NULL,NULL,NULL,'internetstores.de',NULL);
INSERT INTO "trackers" VALUES('github','GitHub',NULL,2,NULL,NULL,NULL,'c_1618',NULL);
INSERT INTO "trackers" VALUES('post_affiliate_pro','Post Affiliate Pro',NULL,4,'http://www.qualityunit.com/','','qualityunit','1411',NULL);
INSERT INTO "trackers" VALUES('guj.de','guj.de',NULL,NULL,NULL,NULL,NULL,'guj.de',NULL);
INSERT INTO "trackers" VALUES('vtrtl.de','vtrtl.de',NULL,NULL,NULL,NULL,NULL,'vtrtl.de',NULL);
INSERT INTO "trackers" VALUES('deepintent.com','deepintent.com',NULL,NULL,NULL,NULL,NULL,'deepintent.com',NULL);
INSERT INTO "trackers" VALUES('acuity_ads','Acuity Ads','',4,'http://www.acuityads.com/','http://cdn.betteradvertising.com/logos/acuityads.png','acuity_ads','1250',NULL);
INSERT INTO "trackers" VALUES('outdooractive.com','outdooractive.com',NULL,NULL,NULL,NULL,NULL,'outdooractive.com',NULL);
INSERT INTO "trackers" VALUES('padsdel.com','padsdel.com',NULL,NULL,NULL,NULL,NULL,'padsdel.com',NULL);
INSERT INTO "trackers" VALUES('bidswitch','Bidswitch',NULL,4,NULL,NULL,'bidswitch','2749',NULL);
INSERT INTO "trackers" VALUES('33across','33Across','33Across has developed breakthrough technology that uses social graph data to dramatically improve online marketing.  33Across enables brand and performance marketers to unlock the power of the Social Web. Our SocialDNA™ platform uses previously untapped social data sources, in combination with advanced social network algorithms, to create unique and scalable audience segments.',4,'http://33across.com/','http://cdn.betteradvertising.com/logos/33across.png','33across','256',NULL);
INSERT INTO "trackers" VALUES('slimcdn.com','slimcdn.com',NULL,NULL,NULL,NULL,NULL,'slimcdn.com',NULL);
INSERT INTO "trackers" VALUES('dantrack.net','DANtrack',NULL,4,'http://media.dantrack.net/privacy/',NULL,'dentsu_aegis_network','dantrack.net',NULL);
INSERT INTO "trackers" VALUES('first_impression','First Impression',NULL,4,NULL,NULL,'first_impression','2249',NULL);
INSERT INTO "trackers" VALUES('pubnub.com','pubnub.com',NULL,NULL,NULL,NULL,NULL,'pubnub.com',NULL);
INSERT INTO "trackers" VALUES('vindico_group','Vindico Group','Vindico Group is an ad-serving platform that provides advertisers with video ad serving, tracking and analytics tools. It allows advertisers and their agencies control over the deployment, assignment, and scheduling of both video and banner ads across broadband networks enabling advertisers to self-manage their campaigns at the site and individual file levels. Vindico Group is a division of BBE (formerly Broadband Enterprises).',4,'http://www.vindicogroup.com/','http://cdn.betteradvertising.com/logos/vindicogroup.png','vindico_group','489',NULL);
INSERT INTO "trackers" VALUES('dynamic_1001_gmbh','Dynamic 1001 GmbH',NULL,8,NULL,NULL,NULL,'c_2789',NULL);
INSERT INTO "trackers" VALUES('intelligent_reach','Intelligent Reach',NULL,4,'http://www.intelligentreach.com/','http://','intelligent_reach','1550',NULL);
INSERT INTO "trackers" VALUES('google_appspot','Google Appspot',NULL,10,NULL,NULL,'google',NULL,NULL);
INSERT INTO "trackers" VALUES('msn','Microsoft Network',NULL,8,NULL,'http://cdn.betteradvertising.com/logos/microsoftadvertising.png','microsoft',NULL,NULL);
INSERT INTO "trackers" VALUES('sourcepoint','Sourcepoint',NULL,4,'https://www.sourcepoint.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('cloudflare','CloudFlare',NULL,9,'https://www.cloudflare.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('spotify','Spotify',NULL,0,'https://www.spotify.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('1plusx','1plusX',NULL,6,'https://www.1plusx.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('maxcdn','MaxCDN',NULL,9,'https://www.maxcdn.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('trafficfactory','Traffic Factory',NULL,4,'https://www.trafficfactory.biz/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adsbookie','AdsBookie',NULL,4,'http://adsbookie.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('zeusclicks','ZeusClicks',NULL,4,'http://zeusclicks.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('the_weather_company','The Weather Company',NULL,4,'http://www.theweathercompany.com/',NULL,'ibm',NULL,NULL);
INSERT INTO "trackers" VALUES('youporn','YouPorn',NULL,3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adpilot','AdPilot',NULL,4,'http://www.adpilotgroup.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('geniee','GENIEE',NULL,4,'http://geniee.co.jp/',NULL,NULL,'2346',NULL);
INSERT INTO "trackers" VALUES('bing_maps','Bing Maps',NULL,2,NULL,NULL,'microsoft',NULL,NULL);
INSERT INTO "trackers" VALUES('wetter_com','Wetter.com',NULL,8,'http://www.wetter.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('cdn77','CDN77',NULL,9,'https://www.cdn77.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('mindspark','Mindspark',NULL,6,'http://www.mindspark.com/',NULL,'iac_apps',NULL,NULL);
INSERT INTO "trackers" VALUES('bonial','Bonial Connect',NULL,2,'http://www.bonial.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('atg_group','ATG Ad Tech Group',NULL,4,'https://ad-tech-group.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('yieldr','Yieldr',NULL,6,'https://www.yieldr.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('zypmedia','ZypMedia',NULL,4,'http://www.zypmedia.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('acxiom','Acxiom',NULL,6,NULL,NULL,'acxiom',NULL,NULL);
INSERT INTO "trackers" VALUES('twenga','Twenga Solutions',NULL,4,'https://www.twenga-solutions.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('fraudlogix','FraudLogix',NULL,4,'https://www.fraudlogix.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('openload','Openload',NULL,9,'https://openload.co/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('merkle_rkg','Merkle RKG',NULL,6,'https://www.merkleinc.com/what-we-do/digital-agency-services/rkg-now-fully-integrated-merkle',NULL,'dentsu_aegis_network',NULL,NULL);
INSERT INTO "trackers" VALUES('bidtellect','Bidtellect',NULL,4,'https://www.bidtellect.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('optomaton','Optomaton',NULL,4,'http://www.optomaton.com/',NULL,'ve',NULL,NULL);
INSERT INTO "trackers" VALUES('amazon_payments','Amazon Payments',NULL,2,NULL,NULL,'amazon_associates',NULL,NULL);
INSERT INTO "trackers" VALUES('bootstrap','Bootstrap CDN',NULL,9,'http://getbootstrap.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('jquery','jQuery',NULL,9,'https://jquery.org/',NULL,'js_foundation',NULL,NULL);
INSERT INTO "trackers" VALUES('createjs','CreateJS',NULL,9,'https://createjs.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('jsdelivr','jsDelivr',NULL,9,'https://www.jsdelivr.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('batch_media','Batch Media',NULL,4,'http://batch.ba/',NULL,'the_adex',NULL,NULL);
INSERT INTO "trackers" VALUES('monotype_gmbh','Monotype GmbH',NULL,9,'http://www.monotype.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('monotype_imaging','Monotype Imaging Inc.',NULL,9,'https://www.fonts.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ablida','ablida',NULL,4,'https://www.ablida.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('advanced_hosters','Advanced Hosters',NULL,9,'https://advancedhosters.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('sap_xm','SAP Exchange Media',NULL,4,'http://sapexchange.media/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('icf_technology','ICF Technology',NULL,2,'http://www.icftechnology.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('addefend','AdDefend',NULL,4,'https://www.addefend.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('permutive','Permutive',NULL,4,'http://permutive.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('burda_digital_systems','Burda Digital Systems',NULL,4,NULL,NULL,'hubert_burda_media',NULL,NULL);
INSERT INTO "trackers" VALUES('bild','Bild.de',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('bahn_de','Deutsche Bahn',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('aspnetcdn','Microsoft Ajax CDN',NULL,9,NULL,NULL,'microsoft',NULL,NULL);
INSERT INTO "trackers" VALUES('heimspiel','HEIM:SPIEL Medien GmbH',NULL,8,'http://www.heimspiel.de',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('gujems','G+J e|MS',NULL,4,'http://www.gujmedia.de/',NULL,'gruner_jahr_ag',NULL,NULL);
INSERT INTO "trackers" VALUES('tisoomi','Tisoomi',NULL,4,'https://tisoomi-services.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('circit','circIT',NULL,6,'http://www.circit.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('shopping_com','Shopping.com',NULL,4,NULL,NULL,'ebay_partner_network',NULL,NULL);
INSERT INTO "trackers" VALUES('wayfair_com','Wayfair',NULL,8,'https://www.wayfair.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('instagram_com','Instagram',NULL,8,NULL,NULL,'facebook',NULL,NULL);
INSERT INTO "trackers" VALUES('immobilienscout24_de','immobilienscout24.de',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('zalando_de','zalando.de',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('gmx_net','gmx.net',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('xvideos_com','xvideos.com',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('blogspot_com','blogspot.com',NULL,8,NULL,NULL,'google',NULL,NULL);
INSERT INTO "trackers" VALUES('eluxer_net','eluxer.net',NULL,12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('worldnaturenet_xyz','worldnaturenet.xyz',NULL,12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('tdsrmbl_net','tdsrmbl.net',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('pizzaandads_com','pizzaandads.com',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('nerfherdersolo_com','nerfherdersolo.com',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('sentry','Sentry',NULL,6,'https://sentry.io/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('performio','Performio.cz',NULL,4,'http://performio.cz/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('channel_pilot_solutions','ChannelPilot Solutions',NULL,6,'https://www.channelpilot.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('schibsted','Schibsted Media Group',NULL,4,'http://www.schibsted.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('qubit','Qubit Opentag','QuBit is a data analysis and optimization company. They build predictive models by collecting and analyzing client data to streamline operations, website and marketing experiences. Their product suite includes the tag management system OpenTag.',6,'http://www.qubit.com/','http://cdn.betteradvertising.com/logos/qubit.png',NULL,'764',NULL);
INSERT INTO "trackers" VALUES('traffective','Traffective',NULL,4,'https://traffective.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('rawgit','RawGit',NULL,9,'http://rawgit.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('opinary','Opinary',NULL,2,'http://opinary.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('cloudinary','Cloudinary',NULL,9,'https://cloudinary.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('king_com','King.com',NULL,8,'https://king.com/',NULL,'activision_blizzard',NULL,NULL);
INSERT INTO "trackers" VALUES('distil_tag','Distil Bot Discovery',NULL,6,'https://www.distilnetworks.com/block-bot-detection/',NULL,'distil_networks',NULL,NULL);
INSERT INTO "trackers" VALUES('netletix','Netletix',NULL,4,'http://www.netletix.com//',NULL,'ip_de',NULL,NULL);
INSERT INTO "trackers" VALUES('q_division','Q-Division',NULL,4,'https://q-division.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('hyvyd','Hyvyd GmbH',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('oms','OMS',NULL,4,'http://oms.eu/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('cdnnetwok_xyz','cdnnetwok.xyz',NULL,12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('foxydeal_com','foxydeal.com','Browser extension offering price comparison.',12,'https://www.foxydeal.de',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('webclicks24_com','webclicks24.com',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('easylist_club','easylist.club',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('propvideo_net','propvideo.net',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('generaltracking_de','generaltracking.de',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('atsfi_de','atsfi.de',NULL,11,NULL,NULL,'axel_springer',NULL,NULL);
INSERT INTO "trackers" VALUES('continum_net','continum.net',NULL,10,'http://continum.net/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('freenet_de','freenet.de',NULL,8,'http://freenet.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('fontawesome_com','fontawesome.com',NULL,9,'http://fontawesome.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('idealo_com','idealo.com',NULL,4,'http://idealo.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('4finance_com','4finance.com',NULL,2,'http://4finance.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ausgezeichnet_org','ausgezeichnet.org',NULL,2,'http://ausgezeichnet.org/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('freegeoip_net','freegeoip.net',NULL,6,'http://freegeoip.net/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adac_de','adac.de',NULL,8,'http://adac.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('stailamedia_com','stailamedia.com',NULL,4,'http://stailamedia.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('crimsonhexagon_com','crimsonhexagon.com',NULL,6,'http://crimsonhexagon.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ehi-siegel_de','ehi-siegel.de',NULL,2,'http://ehi-siegel.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('s24_com','Shopping24 internet group',NULL,4,'https://www.s24.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('redblue_de','redblue',NULL,6,'https://www.redblue.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('tchibo_de','tchibo.de',NULL,8,'http://tchibo.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('chefkoch_de','chefkoch.de',NULL,8,'http://chefkoch.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('iotec','iotec',NULL,4,'https://www.iotecglobal.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('a3cloud_net','a3cloud.net',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('maxonclick_com','maxonclick.com',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('toponclick_com','toponclick.com',NULL,11,NULL,NULL,NULL,NULL,'15/11/17: Private whois, no landing page.');
INSERT INTO "trackers" VALUES('westlotto_com','westlotto.com',NULL,8,'http://westlotto.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('admedo_com','Admedo',NULL,4,'http://admedo.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adbrain','AdBrain',NULL,4,'https://www.adbrain.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('twitter_for_business','Twitter for Business',NULL,4,'https://business.twitter.com/',NULL,'twitter',NULL,NULL);
INSERT INTO "trackers" VALUES('brightonclick.com','brightonclick.com',NULL,4,NULL,NULL,NULL,NULL,'15/11/17: Private whois and empty landing page.');
INSERT INTO "trackers" VALUES('voluum','Voluum',NULL,4,'https://voluum.com/',NULL,NULL,NULL,'15/11/17: Privacy policy on http://bergmann-czapla.de/datenschutzerklaerung/ names the domain cwkuki.com as having the Voluum opt out cookie. Visiting the optout url https://t.cwkuki.com/optout sets a ''voluum_dsp_output'' cookie. Therefore, we can safely assume this domain belongs to Voluum.');
INSERT INTO "trackers" VALUES('xxxlshop.de','xxxlshop.de',NULL,8,'https://www.xxxlshop.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('fyber','Fyber',NULL,4,'https://www.fyber.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('eshopcomp.com','eshopcomp.com',NULL,12,NULL,NULL,NULL,NULL,'15/11/17: Assuming it is an extension due to presence including banks + mozilla.org');
INSERT INTO "trackers" VALUES('vodafone.de','vodafone.de',NULL,8,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('davebestdeals.com','davebestdeals.com',NULL,12,NULL,NULL,NULL,NULL,'15/11/17: Likely an extension/adware from site presence. Private whois.');
INSERT INTO "trackers" VALUES('stathat','StatHat',NULL,6,'http://www.stathat.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ubersetzung-app.com','ubersetzung-app.com',NULL,12,'https://www.ubersetzung-app.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('supership','Supership',NULL,4,'https://supership.jp/en/',NULL,NULL,NULL,'16/11/17: socdm.com registered to Supership Inc.');
INSERT INTO "trackers" VALUES('wikia_cdn','Wikia CDN',NULL,9,NULL,NULL,'wikia',NULL,'16/11/17: nocookie.net claimed as wikia CDN here: http://answers.wikia.com/wiki/What_is_nocookie.net');
INSERT INTO "trackers" VALUES('insightexpress','InsightExpress',NULL,6,'https://www.millwardbrowndigital.com/',NULL,'millward_brown',NULL,NULL);
INSERT INTO "trackers" VALUES('platformone','Platform One',NULL,4,'https://www.platform-one.co.jp/',NULL,'daconsortium',NULL,'16/11/17: Optout page at http://feedback.impact-ad.jp/optout');
INSERT INTO "trackers" VALUES('adrom','adRom',NULL,4,'http://www.adrom.net/',NULL,NULL,NULL,'16/11/17: txt.eu registered to adRom GmbH');
INSERT INTO "trackers" VALUES('purch','Purch',NULL,4,'http://www.purch.com/',NULL,NULL,NULL,'16/11/17: serveboom.com registered to Bestofmedia, which was acquired by Purch.');
INSERT INTO "trackers" VALUES('tumblr_analytics','Tumblr Analytics',NULL,6,NULL,NULL,'tumblr',NULL,'16/11/17: sre-perim.com registered to Tumblr and called via a Cedexis script on Tumblr blogs.');
INSERT INTO "trackers" VALUES('scoota','Scoota',NULL,4,'http://scoota.com/',NULL,NULL,NULL,'16/11/17: rockabox.co registered to Rockabox Media Ltd. From the Scoota website: ''Scoota is the trading name of Rockabox Media Ltd.''');
INSERT INTO "trackers" VALUES('bitly','Bitly',NULL,6,'https://bitly.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('programattik','Programattik',NULL,4,'http://www.programattik.com/',NULL,'ttnet',NULL,NULL);
INSERT INTO "trackers" VALUES('cardlytics','Cardlytics',NULL,6,'http://www.cardlytics.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('digilant','Digilant',NULL,4,'https://www.digilant.com/',NULL,NULL,NULL,'16/11/17: wtp101.com registered to AdNetik. AdNetik rebranded to Digilant (https://adexchanger.com/data-exchanges/havas-ownership-but-a-memory-adnetik-rebrands-as-digilant/)');
INSERT INTO "trackers" VALUES('site24x7','Site24x7',NULL,6,'https://www.site24x7.com/',NULL,'zoho_corp',NULL,NULL);
INSERT INTO "trackers" VALUES('shortnews','ShortNews.de',NULL,8,'http://www.shortnews.de/#',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('mrpdata','MRP',NULL,6,'http://mrpdata.com/Account/Login?ReturnUrl=%2F',NULL,'fifth_story',NULL,NULL);
INSERT INTO "trackers" VALUES('sortable','Sortable',NULL,4,'https://sortable.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('pnamic.com','pnamic.com',NULL,12,NULL,NULL,NULL,NULL,'16/11/17: Private whois and blank landing. Discussion here suggests adware extension: https://www.reddit.com/r/techsupport/comments/6xklp2/need_help_removing_clkpnamiccom_adware/');
INSERT INTO "trackers" VALUES('bumlam.com','bumlam.com',NULL,11,NULL,NULL,NULL,NULL,'16/11/17: Private whois and blank landing. Tracking pixel on https://sync.bumlam.com/');
INSERT INTO "trackers" VALUES('fluct','Fluct',NULL,4,'https://corp.fluct.jp/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('interyield','Interyield',NULL,4,'http://www.advertise.com/publisher-solutions/',NULL,'advertise.com',NULL,'6/12/17: Observed script loaded on the ps7894.com domain (https://www.ps7894.com/InterYield/bindevent.do) which contains references to InterYield, which is a Advertise.com product.');
INSERT INTO "trackers" VALUES('adguard','Adguard',NULL,12,'https://adguard.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('truoptik','Tru Optik',NULL,6,'http://truoptik.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('pmddby.com','pmddby.com',NULL,12,NULL,NULL,NULL,NULL,'6/12/17: No landing page; private whois.');
INSERT INTO "trackers" VALUES('digitrust','DigiTrust',NULL,4,'http://www.digitru.st/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adtheorent','Adtheorent',NULL,4,'http://adtheorent.com/',NULL,NULL,NULL,'6/12/17: adentifi.com domain is registereed to Adtheorent. The latter''s guide to pixel placement also includes this domain (https://adtheorent.atlassian.net/wiki/spaces/traktion/pages/491567/Pixel+Placement+Instructions)');
INSERT INTO "trackers" VALUES('narrative_io','Narrative I/O',NULL,6,'http://www.narrative.io/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('dcbap.com','dcbap.com',NULL,12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('brealtime','bRealTime',NULL,4,'http://www.brealtime.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('donationtools','iRobinHood',NULL,12,'http://www.irobinhood.org',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('hooklogic','HookLogic',NULL,4,'http://hooklogic.com/',NULL,'criteo',NULL,NULL);
INSERT INTO "trackers" VALUES('ividence','Ividence',NULL,4,'https://www.ividence.com/home/',NULL,'sien',NULL,NULL);
INSERT INTO "trackers" VALUES('comprigo','comprigo',NULL,12,'https://www.comprigo.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('marvellous_machine','Marvellous Machine',NULL,4,'https://www.marvellousmachine.net/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('afgr2.com','afgr2.com',NULL,3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('orc_international','ORC International',NULL,4,'https://orcinternational.com/',NULL,'engine_group',NULL,NULL);
INSERT INTO "trackers" VALUES('active_agent','Active Agent',NULL,4,'http://www.active-agent.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('yieldmo','Yieldmo',NULL,4,'https://www.yieldmo.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('google_photos','Google Photos',NULL,9,NULL,NULL,'google',NULL,NULL);
INSERT INTO "trackers" VALUES('vinted','Vinted',NULL,8,'https://www.vinted.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('typeform','Typeform',NULL,2,'https://www.typeform.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('amazon_cloudfront','Amazon CloudFront',NULL,10,NULL,NULL,'amazon_associates',NULL,NULL);
INSERT INTO "trackers" VALUES('adthink','Adthink',NULL,4,'https://adthink.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('admachine','AdMachine',NULL,4,'https://admachine.co/',NULL,NULL,NULL,'2018/01/03: Whois record for Platform Inc. Domain is mentioned on docs here: http://docs.admachine.co/article/69-xml-feed-implementation-reference . Footer references Platform.IO');
INSERT INTO "trackers" VALUES('brillen.de','brillen.de',NULL,8,'https://www.brillen.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('docler','Docler',NULL,0,'https://www.doclerholding.com/en/about/companies/33/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('viralgains','ViralGains',NULL,4,'https://www.viralgains.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('visualstudio.com','Visualstudio.com',NULL,8,'https://www.visualstudio.com/',NULL,'microsoft',NULL,NULL);
INSERT INTO "trackers" VALUES('capitaldata','CapitalData',NULL,6,'https://www.capitaldata.fr/',NULL,'highco',NULL,NULL);
INSERT INTO "trackers" VALUES('akamoihd.net','akamoihd.net',NULL,12,NULL,NULL,NULL,NULL,'2018-01-03: Probable ad injector');
INSERT INTO "trackers" VALUES('magnuum.com','magnuum.com',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adswizz','AdsWizz',NULL,4,'http://www.adswizz.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('venturead.com','venturead.com',NULL,11,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('adstir','adstir',NULL,4,'https://en.ad-stir.com/',NULL,'united_inc',NULL,NULL);
INSERT INTO "trackers" VALUES('optinmonster','OptinMonster',NULL,6,'https://optinmonster.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('storygize','Storygize',NULL,4,'http://www.storygize.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('spoutable','Spoutable',NULL,4,'http://spoutable.com/',NULL,NULL,'2472',NULL);
INSERT INTO "trackers" VALUES('petametrics','LiftIgniter',NULL,2,'https://www.liftigniter.com/',NULL,NULL,'2103',NULL);
INSERT INTO "trackers" VALUES('lucky_orange','Lucky Orange',NULL,6,'http://www.luckyorange.com/',NULL,NULL,'1406',NULL);
INSERT INTO "trackers" VALUES('advertserve','AdvertServe',NULL,4,'https://secure.advertserve.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('nano_interactive','Nano Interactive',NULL,4,'http://www.nanointeractive.com/home/de',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('94j7afz2nr.xyz','94j7afz2nr.xyz',NULL,12,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('wordpress_ads','Wordpress Ads',NULL,4,'https://wordpress.com/',NULL,'wordpress.com',NULL,NULL);
INSERT INTO "trackers" VALUES('tubecorporate','Tube Corporate',NULL,3,'https://tubecorporate.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ownpage','Ownpage',NULL,2,'http://www.ownpage.fr/index.en.html',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('dianomi','Diamoni',NULL,4,'http://www.dianomi.com/cms/',NULL,NULL,'2024',NULL);
INSERT INTO "trackers" VALUES('bitrix','Bitrix24',NULL,4,'https://www.bitrix24.com/',NULL,NULL,'2522',NULL);
INSERT INTO "trackers" VALUES('wirecard','Wirecard',NULL,2,'https://www.wirecard.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('segmento','Segmento',NULL,4,'https://segmento.ru/en',NULL,NULL,'1231',NULL);
INSERT INTO "trackers" VALUES('datonics','Datonics',NULL,4,'http://datonics.com/',NULL,NULL,'171',NULL);
INSERT INTO "trackers" VALUES('jivochat','JivoChat',NULL,2,'https://www.jivochat.com/',NULL,NULL,'1687',NULL);
INSERT INTO "trackers" VALUES('airbnb','Airbnb',NULL,6,'https://affiliate.withairbnb.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('widespace','Widespace',NULL,4,'https://www.widespace.com/',NULL,NULL,'1906',NULL);
INSERT INTO "trackers" VALUES('platform360','Platform360',NULL,4,'http://www.platform360.co/#home',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('kaeufersiegel.de','Käufersiegel',NULL,2,'https://www.kaeufersiegel.de/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('mapbox','Mapbox',NULL,2,'https://www.mapbox.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('startapp','StartApp',NULL,4,'https://www.startapp.com/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('ipify','ipify',NULL,8,'https://www.ipify.org/',NULL,NULL,NULL,NULL);
INSERT INTO "trackers" VALUES('keywee','Keywee',NULL,6,'https://keywee.co/',NULL,NULL,'3124',NULL);
INSERT INTO "trackers" VALUES('rtbsuperhub.com','rtbsuperhub.com',NULL,4,NULL,NULL,NULL,NULL,'2/2/18: No whois information');
INSERT INTO "trackers" VALUES('bebi','Bebi Media',NULL,4,'https://www.bebi.com/',NULL,NULL,'2244',NULL);
INSERT INTO "trackers" VALUES('smarter_travel','Smarter Travel Media',NULL,4,'https://www.smartertravel.com/',NULL,'iac_apps',NULL,NULL);
INSERT INTO "trackers" VALUES('giphy.com','Giphy',NULL,7,'https://giphy.com/',NULL,NULL,NULL,NULL);
CREATE TABLE urls(
    url TEXT PRIMARY KEY,
    robots_allowed TEXT NULL,
    status TEXT NULL,
    last_checked DATETIME NULL
);
CREATE UNIQUE INDEX tracker_domain_pair ON tracker_domains(tracker, domain);
COMMIT;
