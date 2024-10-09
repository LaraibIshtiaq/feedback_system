import 'package:flutter/material.dart';


///By extending [ChangeNotifier], [BaseViewModel] gains the ability to notify
///listeners when its state changes.
class BaseViewModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  ///The dispose() method is called when the object is being removed or disposed
  ///of, allowing for any necessary cleanup operations.
  ///In this case, the super.dispose() call ensures that any
  ///cleanup logic from the superclass is executed.
  @override
  void dispose() {
    super.dispose();
  }

  void setBusy(bool value) {
    _busy = value;

    ///The notifyListeners() method is inherited from ChangeNotifier and
    ///notifies any registered listeners that the state has changed,
    ///prompting them to update accordingly.
    notifyListeners();
  }
}
