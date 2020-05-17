Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'isLike',
		'timstamp',
		'publication',
		'user'
	],
	#category : #'OO2-Tp3-Model'
}

{ #category : #'instance creation' }
Vote class >> user: aUser dislikesPublication: aPublication [
	^ self new
		user: aUser;
		publication: aPublication;
		dislike;
		yourself
]

{ #category : #'instance creation' }
Vote class >> user: aUser likesPublication: aPublication [
	^ self new
		user: aUser;
		publication: aPublication;
		yourself
]

{ #category : #private }
Vote >> dislike [
	isLike := false.
]

{ #category : #initialize }
Vote >> initialize [
	isLike := true.
	timstamp := DateAndTime now.
	
]

{ #category : #accessing }
Vote >> isLike [
	^ isLike
]

{ #category : #unused }
Vote >> like [
	isLike := true.
]

{ #category : #unused }
Vote >> publication [
	^ publication
]

{ #category : #private }
Vote >> publication: anObject [
	publication := anObject
]

{ #category : #unused }
Vote >> user [
	^ user
]

{ #category : #private }
Vote >> user: anObject [
	user := anObject
]
