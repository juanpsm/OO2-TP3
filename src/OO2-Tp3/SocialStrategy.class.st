Class {
	#name : #SocialStrategy,
	#superclass : #RetrievingStrategy,
	#category : #'OO2-Tp3-Model'
}

{ #category : #'as yet unclassified' }
SocialStrategy >> getOption [
	^ #social
]

{ #category : #'as yet unclassified' }
SocialStrategy >> getQuestionsFrom: aUser In: aCuooraInstance [
	^ aUser retrieveFollowingQuestions
]
