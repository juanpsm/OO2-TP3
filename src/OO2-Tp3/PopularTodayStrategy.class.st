Class {
	#name : #PopularTodayStrategy,
	#superclass : #RetrievingStrategy,
	#category : #'OO2-Tp3-Model'
}

{ #category : #'as yet unclassified' }
PopularTodayStrategy >> getOption [
	^ #popularToday
]

{ #category : #'as yet unclassified' }
PopularTodayStrategy >> getQuestionsFrom: aUser In: aCuooraInstance [
	^ aCuooraInstance retrieveTodayPopularQuestions
]
