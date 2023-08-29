

import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/analytic_info_model.dart';
import 'package:responsive_admin_dashboard/models/discussions_info_model.dart';
import 'package:responsive_admin_dashboard/models/referal_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Accuracy Score",
    count: 0.82,
    svgSrc: "assets/icons/Comments.svg",
    color: green,
  ),  
  AnalyticInfo(
    title: "Precision Score",
    count: 0.84,
    svgSrc: "assets/icons/Subscribers.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Recall Score",
    count: 0.98,
    svgSrc: "assets/icons/Post.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "F1 Score",
    count: 0.91,
    svgSrc: "assets/icons/Pages.svg",
    color: orange,
  ),
];


// Features Description
List discussionData = [
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (1).png",
    name: "ID",
    date: "Customer's unique identifier",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (2).png",
    name: "Year_Birth",
    date: "Customer's birth year",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (3).png",
    name: "Education",
    date: "Customer's education level",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (4).png",
    name: "Marital_Status",
    date: "Customer's marital status",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (5).png",
    name: "Income",
    date: "Customer's yearly household income",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (6).png",
    name: "Kidhome",
    date: "Number of children in customer's household",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (7).png",
    name: "Teenhome",
    date: "Number of teenagers in customer's household",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (8).png",
    name: "Dt_Customer",
    date: "Date of customer's enrollment with the company",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (9).png",
    name: "Recency",
    date: "Number of days since customer's last purchase",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (10).png",
    name: "Complain",
    date: "1 if the customer complained in the last 2 years, 0 otherwise",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (11).png",
    name: "MntWines",
    date: "Amount spent on wine in last 2 years",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (12).png",
    name: "MntFruits",
    date: "Amount spent on fruits in last 2 years",
  ),   
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (13).png",
    name: "MntMeatProducts",
    date: "Amount spent on meat in last 2 years",
  ),   
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (14).png",
    name: "MntFishProducts",
    date: "Amount spent on fish in last 2 years",
  ),   
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (15).png",
    name: "MntSweetProducts",
    date: "Amount spent on sweets in last 2 years",
  ),     
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (16).png",
    name: "MntGoldProds",
    date: "Amount spent on gold in last 2 years",
  ),  
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (17).png",
    name: "NumDealsPurchases",
    date: "Number of purchases made with a discount",
  ),       
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (18).png",
    name: "NumWebPurchases",
    date: "Number of purchases made through the company\’s website",
  ),  
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (19).png",
    name: "NumCatalogPurchases",
    date: "Number of purchases made using a catalogue",
  ),  
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (20).png",
    name: "NumStorePurchases",
    date: "Number of purchases made directly in stores",
  ),   
  DiscussionInfoModel(
    imageSrc: "assets/images/newplot (21).png",
    name: "NumWebVisitsMonth",
    date: "Number of visits to company’s website in the last month",
  ),                    
];

List referalData = [
  ReferalInfoModel(
    title: "True Positive",
    count: 234,
    svgSrc: "assets/icons/Facebook.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "False Positive",
    count: 234,
    svgSrc: "assets/icons/Twitter.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "True Negative",
    count: 234,
    svgSrc: "assets/icons/Linkedin.svg",
    color: primaryColor,
  ),

  ReferalInfoModel(
    title: "False Negative",
    count: 234,
    svgSrc: "assets/icons/Dribbble.svg",
    color: red,
  ),
];
