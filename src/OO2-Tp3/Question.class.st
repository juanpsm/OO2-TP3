Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'answers',
		'topics'
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
	^ (self newWithTitle: title description: aDescription user: aUser) addTopic: aTopic
]

{ #category : #adding }
Question >> addTopic: aTopic [
	topics add: aTopic.
	aTopic addQuestion: self.

]

{ #category : #'initalize-release' }
Question >> initialize [
	super initialize.
	answers := OrderedCollection new.
	topics := OrderedCollection new
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
