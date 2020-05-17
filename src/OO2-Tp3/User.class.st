Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'questionRetriever',
		'questions',
		'answers',
		'username',
		'password',
		'topics',
		'following',
		'votes'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #'instance-creation' }
User class >> username: aUsername password: aPassword questionRetriever: aQuestionRetriever [
	^ self new
		username: aUsername;
		password: aPassword;
		questionRetriever: aQuestionRetriever;
		yourself
]

{ #category : #accessing }
User >> addAnswer: anAnswer [
	answers add: anAnswer 

]

{ #category : #accessing }
User >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #accessing }
User >> addTopic: aTopic [
	topics add: aTopic 

]

{ #category : #accessing }
User >> addVote: aVote [
	votes add: aVote
]

{ #category : #unused }
User >> answers [
	^ answers
]

{ #category : #accessing }
User >> follow: aUser [
	following add: aUser 
]

{ #category : #unused }
User >> following [
	^ following
]

{ #category : #initialize }
User >> initialize [

	questions := OrderedCollection new.  
	answers := OrderedCollection new. 
	topics := OrderedCollection new. 
	following := OrderedCollection new. 
	votes := OrderedCollection new.
]

{ #category : #unused }
User >> password [
	^ password
]

{ #category : #private }
User >> password: anObject [
	password := anObject
]

{ #category : #unused }
User >> questionRetriever [
	^ questionRetriever
]

{ #category : #private }
User >> questionRetriever: aQuestionRetriever [
	questionRetriever := aQuestionRetriever.
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #unused }
User >> questionsOfInterest [
	^ questionRetriever retrieveQuestions: self.
]

{ #category : #'as yet unclassified' }
User >> retrieveFollowingQuestions [
	^ following flatCollect: [ :followedUser | followedUser questions ].
]

{ #category : #'as yet unclassified' }
User >> retrieveTopicQuestions [
	^ topics flatCollect: [ :topic | topic questions ]
]

{ #category : #accessing }
User >> topics [
	^ topics
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #private }
User >> username: anObject [
	username := anObject
]

{ #category : #accessing }
User >> votes [
	^ votes
]
