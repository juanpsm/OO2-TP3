Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #'instance creation' }
Answer class >> new: anAnswer user: aUser question: aQuestion [
	^ self new
		description: anAnswer;
		user: aUser;
		question: aQuestion;
		yourself
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]
