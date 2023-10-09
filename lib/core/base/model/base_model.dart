abstract class BaseModel<Object> {
  Map<String, dynamic> toJson();
  Object fromJson(Map<String, dynamic> json);
}