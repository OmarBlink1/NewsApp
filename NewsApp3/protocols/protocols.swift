//
//  MenuViewModelProtocol.swift
//  NewsApp3
//
//  Created by Blinnk22 User on 27/08/2023.
//

import Foundation

protocol ArticleService
{
    func fetchDetails()
}

protocol menu_viewModel_output : AnyObject
{
    func updateView(list_of_articles : [ArticleModel])
}
protocol Detail_viewModel_ouput : AnyObject
{
    func updateView(single_article : ArticleModel)
}

