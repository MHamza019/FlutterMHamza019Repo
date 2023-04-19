class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Who is the founder of Pakistan?",
    "options": ['Allama Iqbal', 'Muhammad Ali Jinnah', 'Liaquat Ali KhanD', 'Chaudhry Rahmat Ali'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What is the national language of Pakistan?",
    "options": ['Urdu', 'Punjabi', 'Sindhi', 'Pashto'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "What is the national animal of Pakistan?",
    "options": ['Markhor', 'Snow leopard', 'Lion', 'Tiger'],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "What is the highest peak in Pakistan?",
    "options": ['Nanga Parbat', 'Tirich Mir', 'K2', 'Rakaposhi'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "What is the currency of Pakistan?",
    "options": ['Pakistani rupee', 'Indian rupee', 'US dollar', 'Pound sterling'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Which river is the longest river in Pakistan?",
    "options": ['Chenab River', 'Jhelum River', 'Indus River', 'Ravi River'],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question": "What is the name of the highest paved road in Pakistan?",
    "options": ['Silk Road', 'Karakoram Highway', 'Grand Trunk Road', 'Khyber Pass'],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question": "Which Pakistani cricketer has the highest number of test runs?",
    "options": ['Javed Miandad', 'Inzamam-ul-Haq', 'Younis Khan', 'Misbah-ul-Haq'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Who is the current Prime Minister of Pakistan?",
    "options": ['Imran Khan', 'Nawaz Sharif', 'Asif Ali Zardari', 'Benazir Bhutto'],
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "What is the name of the famous fort in Lahore, Pakistan?",
    "options": ['Shalimar Fort', 'Badshahi Fort', 'Lahore Fort', 'Rohtas Fort'],
    "answer_index": 2,
  },
];
