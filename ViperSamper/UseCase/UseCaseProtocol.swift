//
//  UseCaseProtocol.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import Foundation

protocol UseCaseProtocol where Failure: Error {
    associatedtype Parameter
    associatedtype Success
    associatedtype Failure
    
    func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?)
}


class UseCase<Parameter, Success, Failure: Error> {
    
    private let instance: UseCaseInstanceBase<Parameter, Success, Failure>
    
    init<T: UseCaseProtocol>(_ useCase: T) where
        T.Parameter == Parameter,
        T.Success == Success,
        T.Failure == Failure
    {
        self.instance = UseCaseInstance<T>(useCase)
    }
    
    func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?) {
        self.instance.execute(parameter, completion: completion)
    }
}


private extension UseCase {
    
    class UseCaseInstanceBase<Parameter, Success, Failure: Error> {
        // UseCaseInstanceBaseのexecuteメソッドはUseCaseInstanceを踏襲して使用すると、overrideの方が使われるので通ることのないデッドコードになる
        func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?) {
            fatalError()
        }
    }
    
    class UseCaseInstance<T: UseCaseProtocol>: UseCaseInstanceBase<T.Parameter, T.Success, T.Failure> {
        
        private let useCase: T
        
        init(_ useCase: T) {
            self.useCase = useCase
        }
        
        override func execute(_ parameter: T.Parameter, completion: ((Result<T.Success, T.Failure>) -> ())?) {
            useCase.execute(parameter, completion: completion)
        }
    }
}
