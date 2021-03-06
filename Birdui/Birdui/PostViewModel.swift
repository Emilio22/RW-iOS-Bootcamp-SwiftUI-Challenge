//
//  PostViewModel.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

class PostViewModel: ObservableObject {
  @Published var posts: [MediaPost] = []
  
  init() {
    let imagePost1 = MediaPost(textBody: "I love debugging software!", userName: "Jay", timestamp: Date(timeIntervalSinceNow: -123456), uiImage: UIImage(named: "chop"))
    let imagePost2 = MediaPost(textBody: "Went to the Aquarium today :]", userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876), uiImage: UIImage(named:  "octopus"))
    let imagePost3 = MediaPost(textBody: "So suit up, and get ready to get Swifty ;]", userName: "Ray", timestamp: Date(timeIntervalSinceNow: -1476), uiImage: UIImage(named:  "ray"))
    
    let textPost1 = MediaPost(textBody: "Hello World!", userName: "Bhagat", timestamp: Date(timeIntervalSinceNow: -67890), uiImage: nil)
    let textPost2 = MediaPost(textBody: "This is my favorite social media app! This is my favorite social media app! This is my favorite social media app!", userName: "Jeff", timestamp: Date(timeIntervalSinceNow: -2345), uiImage: nil)
    
    
    posts = [imagePost1, imagePost2, imagePost3, textPost1, textPost2].sorted(by: { $0.timestamp > $1.timestamp })
  }
  
  
  func addPost(post: MediaPost) {
    posts.append(post)
    posts = posts.sorted(by: { $0.timestamp > $1.timestamp })
  }
  
  func updateReaction(post: MediaPost, reaction: ReactionType) {
    
    if let index = self.posts.firstIndex(of: post){
      
      let newPost = post.updateReaction(reactionType: reaction)
      
      posts.remove(at: index)
      posts.insert(newPost, at: index)
      
    }
  }
    
  func removePost(post: MediaPost) {
    if let index = posts.firstIndex(where: {$0.id == post.id}) {
      posts.remove(at: index)
    }    
  }
  
  func editPost(post: MediaPost, newText: String) {
    if let index = posts.firstIndex(where: {$0.id == post.id}) {
      posts[index].textBody = newText
      posts[index].edited = true
    }
  }
}
