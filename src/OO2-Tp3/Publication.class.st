Class {
	#name : #Publication,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'votes',
		'user',
		'description'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #adding }
Publication >> addVote: aVote [
	votes add: aVote
]

{ #category : #retrieving }
Publication >> countPositiveVotes [
	^ self positiveVotes size
]

{ #category : #unused }
Publication >> description [
	^ description
]

{ #category : #private }
Publication >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Publication >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #counting }
Publication >> negativeVotes [
	^ votes reject: [ :vote | vote isLike ]
]

{ #category : #counting }
Publication >> positiveVotes [
	^ votes select: [ :vote | vote isLike ]
]

{ #category : #accessing }
Publication >> timestamp [
	^ timestamp
]

{ #category : #unused }
Publication >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Publication >> user [
	^ user
]

{ #category : #private }
Publication >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Publication >> votes [
	^ votes
]
