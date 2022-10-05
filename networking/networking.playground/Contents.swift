import UIKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func call_get() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/")
    guard let url = url else { return }

    let request = URLRequest(url: url)

    var task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let data = data {
            if let posts = try? JSONDecoder().decode([Post].self, from: data) {
                print(posts.count)
                print(posts[0])
            } else {
                print("Invalid Response")
            }

        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
    }
    task.resume()
}

func call_post() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

    let post = Post(userId: 3, id: 242, title: "a post", body: "post body")

    guard let jsonUpload = try? JSONEncoder().encode(post) else {
        print("error data")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = jsonUpload

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        if let data = data {
            if let uploadedPost = try? JSONDecoder().decode(Post.self, from: data) {
                print("uploaded \(uploadedPost)")
            } else {
                print("upload failed!")
            }
        } else if let error = error {
            print("invalid \(error)")
        } else {
            print("error happened")
        }
    }
    task.resume()
}

func call_put() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.allHTTPHeaderFields = [
        "Content-type": "application/json; charset=UTF-8"
    ]

    let post = Post(userId: 4, id: 1, title: "foo", body: "bar")
    guard let json = try? JSONEncoder().encode(post) else { return }
    request.httpBody = json
    let task = URLSession.shared.dataTask(with: request) { data, _, _ in
        if let data = data {
            let updatedPost = try? JSONDecoder().decode(Post.self, from: data)
            print("updated: \(updatedPost)")
        } else {
            print("error")
        }
    }
    task.resume()
}

func call_delete() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { _, response, error in

        if let error = error {
            print("Error: \(error)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse,
           (200 ... 299).contains(httpResponse.statusCode)
        {
            print(httpResponse.statusCode)
        } else {
            print("Error with the response, unexpected status code: \(response)")
            return
        }
    }
    task.resume()
}

// call_get()
// call_post()
// call_put()
call_delete()
