import 'package:capp_mobile/shared/constants/assets.dart';

enum Rating { notSatisfied, satisfied, verySatisfied }

extension ExtensionsOnRating on Rating{
  String get stringValue {
    switch(this){
      case Rating.notSatisfied:
        return 'Not Satisfied';
      case Rating.satisfied:
        return 'Satisfied';
      case Rating.verySatisfied:
        return 'Very Satisfied';
    }
  }

  /// Represents the integer value of rating
  int get intValue {
    switch (this) {
      case Rating.notSatisfied:
        return 1;
      case Rating.satisfied:
        return 2;
      case Rating.verySatisfied:
        return 3;
    }
  }

  String get activeAssetImage{
    switch (this){
      case Rating.notSatisfied:
        return icNotSatisfiedActive;
      case Rating.satisfied:
        return icSatisfiedActive;
      case Rating.verySatisfied:
        return icVerySatisfiedActive;
    }
  }

  String get inActiveAssetImage{
    switch (this){
      case Rating.notSatisfied:
        return icNotSatisfiedInActive;
      case Rating.satisfied:
        return icSatisfiedInActive;
      case Rating.verySatisfied:
        return icVerySatisfiedInActive;
    }
  }
}