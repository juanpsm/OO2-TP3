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

{ #category : #initializing }
QuestionRetriever >> initialize [
	option := #social
]

{ #category : #accesing }
QuestionRetriever >> option: anOption [
	option := anOption
]

{ #category : #retrieving }
QuestionRetriever >> orderQuestionsByPositiveVotes: questions [
	| temp |
	temp := questions
		asSortedCollection: [ :a :b | a positiveVotes size > b positiveVotes size ].
	^ temp
]

{ #category : #accessing }
QuestionRetriever >> retrieveQuestions: aUser [
	^ self subclassResponsibility
]
