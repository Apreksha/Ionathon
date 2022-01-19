class Question{
  late final int id,answer;
  late final String question;
  late final List<String> options;
  Question({required this.id,required this.question,required this.answer,required this.options});
}

const List sample_data=[
  {
    "id":1,
    "question":"Question 1",
    "options":['A','D','E','J'],
    "answer_index":0
  },
  {
    "id":1,
    "question":"Question 2",
    "options":['A','D','E','J'],
    "answer_index":0
  },
  {
    "id":1,
    "question":"Question 3",
    "options":['A','D','E','J'],
    "answer_index":0
  },
  {
    "id":1,
    "question":"Question 4",
    "options":['A','D','E','J'],
    "answer_index":0
  },
  {
    "id":1,
    "question":"Question 5",
    "options":['A','D','E','J'],
    "answer_index":0
  },
];