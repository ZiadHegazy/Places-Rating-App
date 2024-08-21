import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_rating/PlaceModel.dart';
import 'package:places_rating/Places.dart';
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}
class _ReviewState extends State<Review> {
  int page=1;
  List<List<dynamic>> selectedAnswers=[[],[],[],[],[],[]];
  List<dynamic> questions = [
    {
      "questionId": "1",
      "questionValue": "ratingOfParking",
      "question1StarScore": 5.0,
      "question2StarsScore": 20.0,
      "question3StarsScore": 30.0,
      "totalScore": 0.0,
      "starRating": 0.0,
      "steps": [
        {
          "stepId": "step_1_1",
          "stepTitle": "Parking",
          "stepTitleAr": "اماكن الانتظار",
          "iconPath": "https://svgshare.com/i/11fX.svg",
          "responses": [
            {
              "responseId": "1_1_1",
              "responseTitle": "Disability parking spaces available (private or public parking).",
              "responseTitleAr": " يوجد أماكن انتظار سيارات مخصصة للأشخاص ذوى الإعاقة.",
              "defaultScore": 0.0,
              "score": 30.0,
              "isSelected": false,
            },
            {
              "responseId": "1_1_2",
              "responseTitle": "Private parking spaces available.",
              "responseTitleAr": " يوجد أماكن انتظار للسيارات خاصة بالمكان.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
            {
              "responseId": "1_1_3",
              "responseTitle": "Street parking spaces available (around 100 m walking distance to the place entrance).",
              "responseTitleAr": " يوجد أماكن انتظار للسيارات فى الشارع تبعد حوالى 100 متر عن مدخل المكان.",
              "defaultScore": 0.0,
              "score": 5.0,
              "isSelected": false,
            },
            {
              "responseId": "1_1_4",
              "responseTitle": "A staff member is assigned to park the cars (valet service).",
              "responseTitleAr": " يوجد شخص مسئول عن ركن السيارات (خدمة الڤاليه).",
              "defaultScore": 0.0,
              "score": 20.0,
              "isSelected": false,
            },
            {
              "responseId": "1_1_5",
              "responseTitle": "Drop-off area available.",
              "responseTitleAr": "  يوجد مساحة لنزول الركاب أمام المكان.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
          ],
        },
      ],
    },
    {
      "questionId": "2",
      "questionValue": "ratingOfPavements",
      "question1StarScore": 15.0,
      "question2StarsScore": 25.0,
      "question3StarsScore": 50.0,
      "totalScore": 0.0,
      "starRating": 0.0,
      "steps": [
        {
          "stepId": "step_2_1",
          "stepTitle": "Pavements",
          "stepTitleAr": "الرصيف ",
          "iconPath": "https://svgshare.com/i/11e7.svg",
          "responses": [
            {
              "responseId": "2_1_1",
              "responseTitle": "No pavement.",
              "responseTitleAr": " لا يوجد رصيف.",
              "defaultScore": 0.0,
              "score": 15.0,
              "isSelected": false,
            },
            {
              "responseId": "2_1_3",
              "responseTitle": "Pavement height is less than 15 cm (smart phone height).",
              "responseTitleAr": "  ارتفاع الرصيف أقل من 15 سم - (حوالي طول هاتف ذكي).",
              "defaultScore": 0.0,
              "score": 5.0,
              "isSelected": false,
            },
            {
              "responseId": "2_1_4",
              "responseTitle": "Ramp available at the pavement.",
              "responseTitleAr": "يوجد منحدر بالرصيف.",
              "defaultScore": 0.0,
              "score": 15.0,
              "isSelected": false,
            },
            {
              "responseId": "2_1_5",
              "responseTitle": "Flat and clear path to front door (not slippery nor broken and there are no obstacles on the way).",
              "responseTitleAr": "الطريق إلى المكان ليس به تكسير ولا عوائق ولا يسبب الأنزلاق.",
              "defaultScore": 0.0,
              "score": 20.0,
              "isSelected": false,
            },
          ],
        },
        {
          "stepId": "step_2_2",
          "stepTitle": "Entrance Steps",
          "stepTitleAr": "سلالم المدخل",
          "iconPath": "https://svgshare.com/i/11eb.svg",
          "responses": [
            {
              "responseId": "2_2_1",
              "responseTitle": "No steps / 0",
              "responseTitleAr": "لا يوجد سلالم  / 0",
              "defaultScore": 0.0,
              "score": 20.0,
              "isSelected": false,
            },
            {
              "responseId": "2_2_2",
              "responseTitle": "One step / 1",
              "responseTitleAr": "سلمة واحدة / 1",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
            {
              "responseId": "2_2_3",
              "responseTitle": "Two steps / 2",
              "responseTitleAr": "سلمتين / 2",
              "defaultScore": 0.0,
              "score": 0.0,
              "isSelected": false,
            },
            {
              "responseId": "2_2_4",
              "responseTitle": "Three steps / 3",
              "responseTitleAr": "ثلاث سلالم / 3",
              "defaultScore": 0.0,
              "score": 0.0,
              "isSelected": false,
            },
            {
              "responseId": "2_2_5",
              "responseTitle": "Four steps or more/ 4+",
              "responseTitleAr": "اربع سلالم أو أكثر / 4+",
              "defaultScore": 0.0,
              "score": 0.0,
              "isSelected": false,
            },
          ],
        },
        {
          "stepId": "step_2_3",
          "stepTitle": "Doors and Entrances",
          "stepTitleAr": "الابواب و المداخل",
          "iconPath": "https://svgshare.com/i/11fo.svg",
          "responses": [
            {
              "responseId": "2_3_1",
              "responseTitle": "There are steps to the entrance, and there are ramps or elevators as alternatives.",
              "responseTitleAr": "يوجد سلالم للمدخل ويوجد منحدرات او مصاعد كبديل لها.",
              "defaultScore": 0.0,
              "score": 20,
              "isSelected": false,
            },
            {
              "responseId": "2_3_2",
              "responseTitle": "Handrails are available at the entrance.",
              "responseTitleAr": " يوجد درابزين عند المدخل.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
            {
              "responseId": "2_3_3",
              "responseTitle": "Entrance doors' width allow wheelchair users to pass / wide doorway.",
              "responseTitleAr": " عرض ابواب المدخل يسمح بمرور مستخدمي الكراسى المتحركة.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
          ],
        },
      ],
    },
    {
      "questionId": "3",
      "questionValue": "ratingOfServicesAccessability",
      "question1StarScore": 0.0,
      "question2StarsScore": 10.0,
      "question3StarsScore": 30.0,
      "totalScore": 0.0,
      "starRating": 0.0,
      "steps": [
        {
          "stepId": "step_3_1",
          "stepTitle": "Service Accessibility",
          "stepTitleAr": "سهولة الوصول للخدمة ",
          "iconPath": "https://svgshare.com/i/11fM.svg",
          "responses": [
            {
              "responseId": "3_1_1",
              "responseTitle": "Easy access to service(s) inside the place for wheelchair users. (space is wide and clear).",
              "responseTitleAr": " الوصول للخدمات  سهل لمستخدمي الكراسي المتحركة. (المكان واسع ولا يوجد عواقب)",
              "defaultScore": 0.0,
              "score": 15.0,
              "isSelected": false,
            },
            {
              "responseId": "3_1_2",
              "responseTitle": "The service is available at the ground floor of the venue.",
              "responseTitleAr": "الخدمة تقدم فى الدور الأرضي بالمكان.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
            {
              "responseId": "3_1_3",
              "responseTitle": "The service is available at more than one floor in the venue.",
              "responseTitleAr": "الخدمة تقدم فى أكثر من دور بالمكان.",
              "defaultScore": 0,
              "score": 0,
              "isSelected": false,
            },
            {
              "responseId": "3_1_4",
              "responseTitle": "There are no stairs to the service, or there are stairs and there are ramps or elevators as alternatives.",
              "responseTitleAr": "لا يوجد سلالم للخدمة او يوجد سلالم ويوجد منحدرات او مصاعد كبديل لها.",
              "defaultScore": 0.0,
              "score": 15,
              "isSelected": false,
            },
            {
              "responseId": "3_1_5",
              "responseTitle": "There is an elevator.",
              "responseTitleAr": "يوجد مصعد.",
              "defaultScore": 0.0,
              "score": 0.0,
              "isSelected": false,
            },
          ],
        },
      ],
    },
    {
      "questionId": "4",
      "questionValue": "ratingOfToilets",
      "question1StarScore": 5.0,
      "question2StarsScore": 10.0,
      "question3StarsScore": 20.0,
      "totalScore": 0.0,
      "starRating": 0.0,
      "steps": [
        {
          "stepId": "step_4_1",
          "stepTitle": "Toilets",
          "stepTitleAr": "الحمامات ",
          "iconPath": "https://svgshare.com/i/11eH.svg",
          "responses": [
            {
              "responseId": "4_1_1",
              "responseTitle": "Disability toilet allocated for persons with disabilities.",
              "responseTitleAr": "يوجد حمام مخصص للأشخاص ذوى الإعاقة.",
              "defaultScore": 0.0,
              "score": 20.0,
              "isSelected": false,
            },
            {
              "responseId": "4_1_2",
              "responseTitle": "Unisex toilet allocated for persons with disabilities.",
              "responseTitleAr": "يوجد حمام مختلط مخصص للاشخاص ذوي الإعاقة (للسيدات والرجال).",
              "defaultScore": 0.0,
              "score": 20.0,
              "isSelected": false,
            },
            {
              "responseId": "4_1_3",
              "responseTitle": "There is at least one toilet compartment wide enough for wheelchair users.",
              "responseTitleAr": " يوجد على الاقل كابينة واحدة بالحمام واسعة كفاية لمستخدمي الكراسي المتحركة.",
              "defaultScore": 0.0,
              "score": 10.0,
              "isSelected": false,
            },
            {
              "responseId": "4_1_4",
              "responseTitle": "There are fixed grab bars for toilet seats.",
              "responseTitleAr": "يوجد مساند حول المرحاض.",
              "defaultScore": 0.0,
              "score": 5.0,
              "isSelected": false,
            },
          ],
        },
      ],
    },
  ];

  void handleSubmitReview(PlaceModel place,Places places){
    int totalQ1=0;
    int totalQ2=0;
    int totalQ3=0;
    int totalQ4=0;
    for(int i=0;i<selectedAnswers.length;i++){
      for(int j=0;j<selectedAnswers[i].length;j++){
        if(selectedAnswers[i][j]['questionIndex']==0){
          totalQ1=(selectedAnswers[i][j]['score']+totalQ1).toInt();
        }else if(selectedAnswers[i][j]['questionIndex']==1){
          totalQ2=(selectedAnswers[i][j]['score']+totalQ2).toInt();
        }else if(selectedAnswers[i][j]['questionIndex']==2){
          totalQ3=(selectedAnswers[i][j]['score']+totalQ3).toInt();
        }else if(selectedAnswers[i][j]['questionIndex']==3){
          totalQ4=(selectedAnswers[i][j]['score']+totalQ4).toInt();
        }
      }
    }
    int parkingRating=0;
    int serviceRating=0;
    int pavementRating=0;
    int toiletRating=0;
    if(totalQ1>=questions[0]['question1StarScore']) {
      parkingRating = 1;
    }
    if(totalQ1>=questions[0]['question2StarsScore']) {
      parkingRating = 2;
    }
    if(totalQ1>=questions[0]['question3StarsScore']) {
      parkingRating = 3;
    }
    if(totalQ2>=questions[1]['question1StarScore']) {
      pavementRating = 1;
    }
    if(totalQ2>=questions[1]['question2StarsScore']) {
      pavementRating = 2;
    }
    if(totalQ2>=questions[1]['question3StarsScore']) {
      pavementRating = 3;
    }
    if(totalQ3>=questions[2]['question1StarScore']) {
      serviceRating = 1;
    }
    if(totalQ3>=questions[2]['question2StarsScore']) {
      serviceRating = 2;
    }
    if(totalQ3>=questions[2]['question3StarsScore']) {
      serviceRating = 3;
    }
    if(totalQ4>=questions[3]['question1StarScore']) {
      toiletRating = 1;
    }
    if(totalQ4>=questions[3]['question2StarsScore']) {
      toiletRating = 2;
    }
    if(totalQ4>=questions[3]['question3StarsScore']) {
      toiletRating = 3;
    }
    places.ratePlace(place, parkingRating, serviceRating, pavementRating, toiletRating);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Place is rated successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        );
      },
    );

  }
  bool alreadySelected(int questionId,int stepId,String responseId){
    for(int i=0;i<selectedAnswers[page-1].length;i++){
      if(selectedAnswers[page-1][i]['questionIndex']==questionId && selectedAnswers[page-1][i]['stepIndex']==stepId && selectedAnswers[page-1][i]['responseId']==responseId){
        return true;
      }

    }
    return false;
  }
  List<Widget> CheckBoxes(int questionIndex,int stepIndex){
    List<Widget> temp=[];
    for(int index=0;index<questions[questionIndex]['steps'][stepIndex]['responses'].length;index++){

      temp.add(
          CheckboxListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
            checkColor: Color.fromRGBO(218, 3, 95, 1),
            activeColor: Color.fromRGBO(237, 139, 173, 1.0),

            title:Text(questions[questionIndex]['steps'][stepIndex]['responses'][index]['responseTitle'].toString()),
            value: alreadySelected(questionIndex, stepIndex, questions[questionIndex]['steps'][stepIndex]['responses'][index]['responseId']),
            onChanged: (bool? value) {
              setState(() {
                if(value==true){
                  selectedAnswers[page-1].add({
                    'questionIndex':questionIndex,
                    'stepIndex':stepIndex,
                    'responseId':questions[questionIndex]['steps'][stepIndex]['responses'][index]['responseId'],
                    'score':questions[questionIndex]['steps'][stepIndex]['responses'][index]['score']
                  });
                }else{
                  for(int i=0;i<selectedAnswers[page-1].length;i++){
                    if(selectedAnswers[page-1][i]['questionIndex']==questionIndex && selectedAnswers[page-1][i]['stepIndex']==stepIndex && selectedAnswers[page-1][i]['responseId']==questions[questionIndex]['steps'][stepIndex]['responses'][index]['responseId']){
                      selectedAnswers[page-1].removeAt(i);
                      break;
                    }
                  }
                }
              });
            },
          )


      );
      if(index<questions[questionIndex]['steps'][stepIndex]['responses'].length-1){
        temp.add(SizedBox(
          height: 10,
        ));
      }

    }



    return temp;
  }

  Widget drawPage(){
    int questionIndex=0;
    int stepIndex=0;
    int tempIndex=page;
    for(int i=0;i<questions.length;i++){
      tempIndex-=1;
      if(tempIndex<questions[i]["steps"].length){
        questionIndex=i;
        stepIndex=tempIndex;
        break;
      }
      tempIndex=(tempIndex- questions[i]["steps"].length).toInt()+1;
    }
    return Column(
      children: [
        SvgPicture.network(questions[questionIndex]['steps'][stepIndex]['iconPath'],width: 100,height: 100,),
        Text(questions[questionIndex]['steps'][stepIndex]['stepTitle'],style: TextStyle(fontSize: 20),),
        ...CheckBoxes(questionIndex, stepIndex)



      ]
    );



  }


  @override
  Widget build(BuildContext context) {
    final PlaceModel place = ModalRoute.of(context)!.settings.arguments as PlaceModel;
    final Places places=Provider.of<Places>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                value: page/6,
                color: Colors.yellow,
              ),
              SizedBox(height: 20,),
              drawPage(),
            ]
      ),
    ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: (){
              if(page>1){
                setState(() {
                  page--;
                });
              }
            }, child: Icon(Icons.arrow_back,color: Colors.grey)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(218, 3, 95, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                onPressed: (){
              if(page<6){
                setState(() {
                  page++;
                });
              }else{
                handleSubmitReview(place,places);
              }
            }, child: page==6? Text("Submit Your Rating",style: TextStyle(fontSize: 18,color:Colors.white ),): Icon(Icons.arrow_forward,color: Colors.white)),
          ],
        ),
      )
    );
  }
}