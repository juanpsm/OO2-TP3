Class {
	#name : #Answer,
	#superclass : #Object,
	#instVars : [
		'question',
		'timestamp',
		'user',
		'votes',
		'description'
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

{ #category : #adding }
Answer >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Answer >> description [
	^ description
]

{ #category : #private }
Answer >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Answer >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #counting }
Answer >> negativeVotes [
	^ votes reject: [ :vote | vote isLike ]
]

{ #category : #counting }
Answer >> positiveVotes [
	^ votes select: [ :vote | vote isLike ]
]

{ #category : #private }
Answer >> question: aQuestion [
	question := aQuestion 
]

{ #category : #accessing }
Answer >> timestamp [
	^ timestamp
]

{ #category : #private }
Answer >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Answer >> user [
	^ user
]

{ #category : #private }
Answer >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Answer >> votes [
	^ votes
]
