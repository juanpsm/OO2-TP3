Class {
	#name : #PopularTodayQuestionRetriever,
	#superclass : #QuestionRetriever,
	#category : #'OO2-Tp3-Model'
}

{ #category : #retrieving }
PopularTodayQuestionRetriever >> retrieveQuestions: aUser [
	| qRet temp questions |
	qRet := OrderedCollection new.
	questions := cuoora retrieveTodayPopularQuestions.
	temp := self orderQuestionsByPositiveVotes: questions.
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = aUser ]
]
