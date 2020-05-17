Class {
	#name : #RetrievingStrategy,
	#superclass : #Object,
	#category : #'OO2-Tp3-Model'
}

{ #category : #'as yet unclassified' }
RetrievingStrategy >> getOption [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
RetrievingStrategy >> getQuestionsFrom: aUser In: aCuooraInstance [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
RetrievingStrategy >> retrievingStrategyFactory: option [ 
	option = #social
		ifTrue: [ ^ SocialStrategy new. ].
	option = #topics
		ifTrue: [ ^ TopicsStrategy new.].
	option = #news
		ifTrue: [ ^ NewsStrategy new. ].
	option = #popularToday
		ifTrue: [ ^ PopularTodayStrategy new. ].
	
]
