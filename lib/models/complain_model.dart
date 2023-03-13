class ComplainModel {
  var id;
  var name;
  var desc;
  var status;
  var address;
  var userid;
  var assignedTech;

  ComplainModel(
      {this.status,
      this.id,
      this.name,
      this.address,
      this.desc,
      this.userid,
      this.assignedTech});
}
