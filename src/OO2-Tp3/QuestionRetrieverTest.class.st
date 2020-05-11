Class {
	#name : #QuestionRetrieverTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'socialRetriever',
		'topicsRetriever',
		'newsRetriever',
		'popularTodayRetriever',
		'user1',
		'user2',
		'user3',
		'topicOO1',
		'topicOO2',
		'questionUser1TopicOO1',
		'questionUser3TopicOO2',
		'questionUser2TopicOO2',
		'question2User3TopicOO2'
	],
	#category : #'OO2-Tp3-Tests'
}

{ #category : #testing }
QuestionRetrieverTest >> popularTodayAtLeastOneVote [
 
  "1 likes / 2 preguntas // preguntas con al menos 1 voto"
  questionUser2TopicOO2 addVote: (Vote user: user3 likesPublication: questionUser2TopicOO2).
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 0.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 1
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayFiveLikesFourQuestionsAtLeastOneVote [
  "5 likes / 4 preguntas // preguntas con mas de 1 voto"question2User3TopicOO2 addVote: (Vote user: User new likesPublication: question2User3TopicOO2).
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user1) first equals: question2User3TopicOO2.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 0.
  15 timesRepeat: [ questionUser1TopicOO1 addVote: (Vote user: User new likesPublication: questionUser1TopicOO1) ].
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 0.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user2) first equals: questionUser1TopicOO1.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user3) first equals: questionUser1TopicOO1
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayFourLikesFourQuestionsAtLeastOneVote [
	  "4 likes / 4 preguntas // preguntas con al menos 1 voto"question2User3TopicOO2 addVote: (Vote user: user1 likesPublication: question2User3TopicOO2).
  question2User3TopicOO2 addVote: (Vote user: User new likesPublication: question2User3TopicOO2).
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 2.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 1.
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayFourQuestionsAtLeastOneVote [
	  "1 likes / 4 preguntas // preguntas con al menos 1 voto"question2User3TopicOO2 := Question newWithTitle: 'Which refactoring should...' description: '' user: user3 topic: topicOO2.
  cuoora addQuestion: question2User3TopicOO2 forUser: user3.
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 0.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 1.
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayNoLikesThreeQuestions [
  "0 likes / 3 preguntas "
  questionUser2TopicOO2 := Question newWithTitle: 'Which bad smell...?' description: '' user: user2 topic: topicOO2.
  cuoora addQuestion: questionUser2TopicOO2 forUser: user2.
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 2.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 2.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 2
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayNoLikesTwoQuestions [
	self
		assert: (popularTodayRetriever retrieveQuestions: user1) size
		equals: 1.	"0 likes / 2 preguntas "
	self
		assert: (popularTodayRetriever retrieveQuestions: user1) last
		equals: questionUser3TopicOO2.
	self
		assert: (popularTodayRetriever retrieveQuestions: user2) size
		equals: 2.
	self
		assert: (popularTodayRetriever retrieveQuestions: user3) size
		equals: 1.
	self
		assert: (popularTodayRetriever retrieveQuestions: user3) last
		equals: questionUser1TopicOO1
]

{ #category : #testing }
QuestionRetrieverTest >> popularTodayTwoLikesFourQuestionsAtLeastOneVote [
	   "2 likes / 4 preguntas // preguntas con al menos 1 voto"question2User3TopicOO2 addVote: (Vote user: user2 likesPublication: question2User3TopicOO2).
  self assert: (popularTodayRetriever retrieveQuestions: user1) size equals: 2.
  self assert: (popularTodayRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (popularTodayRetriever retrieveQuestions: user3) size equals: 1.
]

{ #category : #'set up' }
QuestionRetrieverTest >> setUp [
	user1 := User new.
	user2 := User new.
	user3 := User new.
	user1 follow: user2; follow: user3.
	
	topicOO1 := Topic name: 'OO1' description: 'This topic is for discussing about OO1 issues'.
	topicOO2 := Topic name: 'OO2' description: 'This topic is for discussing about OO2 issues'.	

	user1 addTopic: topicOO1.
	user2 addTopic: topicOO2.
	user3 addTopic: topicOO2.

	cuoora := CuOOra new.
	cuoora addUser: user1; addUser: user2; addUser: user3.
	
	questionUser1TopicOO1 := Question newWithTitle: 'How to create a class in Pharo' description: '' user: user1 topic: topicOO1.
	questionUser3TopicOO2 := Question newWithTitle: 'How to create a WAComponent for...' description: '' user: user3 topic: topicOO2.

	cuoora addQuestion: questionUser1TopicOO1 forUser:user1.
	cuoora addQuestion: questionUser3TopicOO2 forUser:user3.
	
	socialRetriever := QuestionRetriever new: cuoora and: #social.
	topicsRetriever := QuestionRetriever new: cuoora and: #topics.
	newsRetriever := QuestionRetriever new: cuoora and: #news.
	popularTodayRetriever := QuestionRetriever new: cuoora and: #popularToday.
]

{ #category : #testing }
QuestionRetrieverTest >> testNewsRetrieveQuestions [
	| questionUser2TopicOO2 |
	self assert: (newsRetriever retrieveQuestions: user1) size equals: 1.
	self assert: (newsRetriever retrieveQuestions: user1) last equals: questionUser3TopicOO2.
	self assert: (newsRetriever retrieveQuestions: user2) size equals: 2.
	self assert: (newsRetriever retrieveQuestions: user3) size equals: 1.
	self assert: (newsRetriever retrieveQuestions: user3) last equals: questionUser1TopicOO1.
	
	questionUser2TopicOO2 := Question
		newWithTitle: 'Which bad smell...?'
		description: ''
		user: user2
		topic: topicOO2.
	cuoora addQuestion: questionUser2TopicOO2 forUser: user2.
	
	self assert: (newsRetriever retrieveQuestions: user1) size equals: 2.
	self assert: (newsRetriever retrieveQuestions: user2) size equals: 2.
	self assert: (newsRetriever retrieveQuestions: user3) size equals: 2.
]

{ #category : #testing }
QuestionRetrieverTest >> testPopularTodayRetrieveQuestions [
  self
     popularTodayNoLikesTwoQuestions;
     popularTodayNoLikesThreeQuestions;
     popularTodayAtLeastOneVote;
     popularTodayFourQuestionsAtLeastOneVote;
     popularTodayTwoLikesFourQuestionsAtLeastOneVote;
     popularTodayFourLikesFourQuestionsAtLeastOneVote;
     popularTodayFiveLikesFourQuestionsAtLeastOneVote
]

{ #category : #testing }
QuestionRetrieverTest >> testSocialRetrieveQuestions [
	| questionUser2TopicOO2 |
	
	self assert: (socialRetriever retrieveQuestions: user1) size equals: 1.
	self assert: (socialRetriever retrieveQuestions: user1) first equals: questionUser3TopicOO2.
	
	self assert: (socialRetriever retrieveQuestions: user2) size equals: 0.
	self assert: (socialRetriever retrieveQuestions: user3) size equals: 0.
	
	questionUser2TopicOO2 := Question newWithTitle: 'Which bad smell...?' description: '' user: user2 topic: topicOO2.
	questionUser2TopicOO2 addVote: (Vote user: user2 dislikesPublication: questionUser2TopicOO2).
	cuoora addQuestion: questionUser2TopicOO2 forUser:user2.
	
	self assert: (socialRetriever retrieveQuestions: user1) size equals: 2.
	self assert: (socialRetriever retrieveQuestions: user1) last equals: questionUser2TopicOO2.
	
	self assert: (socialRetriever retrieveQuestions: user3) size equals: 0.
	self assert: (socialRetriever retrieveQuestions: user2) size equals: 0.
	
	
	
	
]

{ #category : #testing }
QuestionRetrieverTest >> testTopicsRetrieveQuestions [
  | questionUser2TopicOO2 |
  self assert: (topicsRetriever retrieveQuestions: user1) size equals: 0.
  self assert: (topicsRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (topicsRetriever retrieveQuestions: user3) size equals: 0.
  questionUser2TopicOO2 := Question newWithTitle: 'Which bad smell...?' description: '' user: user2 topic: topicOO2.
  cuoora addQuestion: questionUser2TopicOO2 forUser: user2.
  self assert: (topicsRetriever retrieveQuestions: user2) size equals: 1.
  self assert: (topicsRetriever retrieveQuestions: user3) size equals: 1.
  self assert: (topicsRetriever retrieveQuestions: user3) first equals: questionUser2TopicOO2.
  self assert: (topicsRetriever retrieveQuestions: user1) size equals: 0
]
