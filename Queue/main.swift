import Foundation

class ListNode <T>{
    var value: T
    var next: ListNode?
    var previous: ListNode?
    init(value: T) {
        self.value = value
    }
}


struct LinkedList<T>: CustomStringConvertible {
    
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: ListNode<T>? {
        return head
    }
    
    var last: ListNode<T>? {
        return tail
    }
    
    mutating func append(value:T){
        let newNode = ListNode(value: value)
        
        if tail != nil {
            newNode.previous = tail
            tail?.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    mutating func remove(node: ListNode<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
}

struct Queue<T>: CustomStringConvertible {
    
    private var list = LinkedList<T>()
    func isEmpty()->Bool{
        return list.isEmpty
    }
    mutating func enqueue(element: T) {
        list.append(value: element)
    }
    
    mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        list.remove(node: element)
        return element.value
    }
    
    mutating func peek() -> T? {
        return list.first?.value
    }
    
    var description: String {
        return list.description
    }
    
    
}
