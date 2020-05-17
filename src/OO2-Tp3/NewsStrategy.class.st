Class {
	#name : #NewsStrategy,
	#superclass : #RetrievingStrategy,
	#category : #'OO2-Tp3-Model'
}

{ #category : #'as yet unclassified' }
NewsStrategy >> getOption [
	^ #news
]

{ #category : #'as yet unclassified' }
NewsStrategy >> getQuestionsFrom: aUser In: aCuooraInstance [
	^ aCuooraInstance retrieveTodayQuestions
]
