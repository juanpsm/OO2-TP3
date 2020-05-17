Class {
	#name : #QuestionRetriever,
	#superclass : #Object,
	#instVars : [
		'option',
		'cuoora'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #'instance creation' }
QuestionRetriever class >> new: cuoora and: aSymbol [
	^ self new cuoora: cuoora; option:aSymbol; yourself.
]

{ #category : #accesing }
QuestionRetriever >> cuoora: aCuooraInstance [
	cuoora := aCuooraInstance 
]

{ #category : #utility }
QuestionRetriever >> filterLastHundredQuestions: questions [
	^ questions last: (100 min: questions size)
]

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := RetrievingStrategy new.
]

{ #category : #accesing }
QuestionRetriever >> option [
	^ option.
]

{ #category : #accesing }
QuestionRetriever >> option: anOption [
	option := (option retrievingStrategyFactory: anOption).
]

{ #category : #utility }
QuestionRetriever >> orderQuestionsByPositiveVotes: questions [
	^ questions
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ]
]

{ #category : #accessing }
QuestionRetriever >> retrieveQuestions: aUser [
	| qRet temp questions |
	qRet := OrderedCollection new.
	questions := option getQuestionsFrom: aUser In: cuoora.
	temp := self orderQuestionsByPositiveVotes: questions.
	qRet := self filterLastHundredQuestions: temp.
	^ qRet reject: [ :q | q user = aUser ]
]
