import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advance List View"),
      ),
      body: getListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMessage(context);
        },
        child: Icon(Icons.add),
        tooltip: "Add One More Item",
      ),
    );
  }


  List<String> getListItems() {
    var items = List<String>.generate(200, (counter) => "Item Number $counter");
    return items;
    }

  Widget getListView(BuildContext context) {
    var listItems = getListItems();
    var listView = ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Icon(Icons.last_page),
            title: Text(
              listItems[index],
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple
              ),
            ),
            onTap: () {
              showSnackBar(context, index);
            },
          );
        }
    );
    return listView;
  }

  void showMessage(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("ALERT!!"),
      content: Text("FAB Clicked.")
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

  void showSnackBar(BuildContext context, var index) {
    var snackBar = SnackBar(
      content: Text("Item ${index} Clicked!"),
      action: SnackBarAction(
          label: "Alert",
          onPressed: () {
            showMessage(context);
          }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

}