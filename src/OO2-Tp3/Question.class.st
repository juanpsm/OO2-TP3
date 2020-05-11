Class {
	#name : #Question,
	#superclass : #Object,
	#instVars : [
		'title',
		'answers',
		'topics',
		'timestamp',
		'user',
		'votes',
		'description'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser [
	^ self new
		title: title;
		description: aDescription;
		user: aUser;
		yourself.
]

{ #category : #'instance creation' }
Question class >> newWithTitle: title description: aDescription user: aUser topic: aTopic [
	^ self new
		title: title;
		description: aDescription;
		addTopic: aTopic;
		user: aUser;
		yourself.
]

{ #category : #adding }
Question >> addTopic: aTopic [
	topics add: aTopic.
	aTopic addQuestion: self.

]

{ #category : #adding }
Question >> addVote: aVote [
	votes add: aVote
]

{ #category : #accessing }
Question >> description [
	^ description
]

{ #category : #private }
Question >> description: anObject [
	description := anObject
]

{ #category : #'initalize-release' }
Question >> initialize [
	answers := OrderedCollection new.
	topics := OrderedCollection new.
	votes := OrderedCollection new.
	timestamp := DateAndTime now.
]

{ #category : #'as yet unclassified' }
Question >> negativeVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifFalse:[r add: vote]].
	^r
]

{ #category : #'as yet unclassified' }
Question >> positiveVotes [
	| r |
	r := OrderedCollection new.
	votes do:[:vote | vote isLike ifTrue:[r add: vote]].
	^r
]

{ #category : #accessing }
Question >> timestamp [
	^ timestamp
]

{ #category : #private }
Question >> timestamp: anObject [
	timestamp := anObject
]

{ #category : #accessing }
Question >> title [
	^title 
]

{ #category : #accessing }
Question >> title: aTitle [
	title := aTitle 
]

{ #category : #accessing }
Question >> topics [
	^topics 
]

{ #category : #accessing }
Question >> user [
	^ user
]

{ #category : #private }
Question >> user: anObject [
	user := anObject
]

{ #category : #accessing }
Question >> votes [
	^ votes
]
