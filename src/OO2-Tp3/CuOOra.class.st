Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics',
		'questions'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #adding }
CuOOra >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #adding }
CuOOra >> addQuestion: aQuestion forUser: aUser [
	aUser addQuestion: aQuestion.
	questions add: aQuestion.
]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	topics add: aTopic 

]

{ #category : #adding }
CuOOra >> addUser: aUser [
	users add: aUser 

]

{ #category : #retrieving }
CuOOra >> averageVotes: someQuestions [
	| averageVotes |
	averageVotes := (questions  sum: [ :q | q positiveVotes size ])
		/ someQuestions size.
	^ averageVotes
"Este promedio como estaba estaba mal calculado porque no divide por el total de las preguntas, solo por las que recibe"
]

{ #category : #initialize }
CuOOra >> initialize [
	users := OrderedCollection new.
	topics := OrderedCollection new.
	questions := OrderedCollection new
]

{ #category : #accessing }
CuOOra >> questions [
	^ questions
]

{ #category : #'as yet unclassified' }
CuOOra >> retrieveTodayPopularQuestions [
	| someQuestions averageVotes |
	someQuestions := self retrieveTodayQuestions.
	averageVotes := self averageVotes: someQuestions.
	^ someQuestions select: [ :q | q positiveVotes size >= averageVotes ]
]

{ #category : #'as yet unclassified' }
CuOOra >> retrieveTodayQuestions [
	^ questions select: [ :q | q timestamp asDate = Date today ]
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]
