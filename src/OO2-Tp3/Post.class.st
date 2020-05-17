Class {
	#name : #Post,
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
Post >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Post >> description [
	^ description
]

{ #category : #private }
Post >> description: anObject [
	description := anObject
]

{ #category : #initialize }
Post >> initialize [
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #counting }
Post >> negativeVotes [
	^ votes reject: [ :vote | vote isLike ]
]

{ #category : #counting }
Post >> positiveVotes [
	^ votes select: [ :vote | vote isLike ]
]

{ #category : #accessing }
Post >> timestamp [
	^ timestamp
]

{ #category : #private }
Post >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Post >> user [
	^ user
]

{ #category : #private }
Post >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Post >> votes [
	^ votes
]
