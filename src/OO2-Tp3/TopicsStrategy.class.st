Class {
	#name : #TopicsStrategy,
	#superclass : #RetrievingStrategy,
	#category : #'OO2-Tp3-Model'
}

{ #category : #'as yet unclassified' }
TopicsStrategy >> getOption [
	^ #topics
]

{ #category : #'as yet unclassified' }
TopicsStrategy >> getQuestionsFrom: aUser In: aCuooraInstance [
	^ aUser retrieveTopicQuestions
]
