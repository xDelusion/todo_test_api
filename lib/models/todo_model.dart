class TodoModel {
  TodoModel({
    required this.code,
    required this.data,
  });
  late final int code;
  late final List<Todo> data;
  
  TodoModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = List.from(json['data']).map((e)=>Todo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Todo {
  Todo({
    required this.id,
    required this.todoName,
    required this.isComplete,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String todoName;
  late final bool isComplete;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Todo.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    todoName = json['todoName'];
    isComplete = json['isComplete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['todoName'] = todoName;
    _data['isComplete'] = isComplete;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}