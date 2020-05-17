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
	self addQuestion: aQuestion
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
	^ self sumPositiveVotes / someQuestions size
	"Este promedio está mal calculado porque suma los votos de todas las preguntas delsistema pero no divide por el número total de preguntas, sólo por el tamaño de la lista de preguntas que recibe"
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

{ #category : #accessing }
CuOOra >> retrieveTodayPopularQuestions [
	| todayQuestions averageVotes |
	todayQuestions := self retrieveTodayQuestions.
	averageVotes := self averageVotes: todayQuestions.
	^ todayQuestions select: [ :q | q positiveVotes size >= averageVotes ]
]

{ #category : #accessing }
CuOOra >> retrieveTodayQuestions [
	^ questions select: [ :q | q timestamp asDate = Date today ]
]

{ #category : #retrieving }
CuOOra >> sumPositiveVotes [
	^ questions sum: [ :q | q countPositiveVotes ]
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]
