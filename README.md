# Expandable example

Demonstrates how to use the expandable widget.

## How to Use

```
 ExpandableWidget(
               title: 'This is title',
               child: Text('This is body'),
             );

```

| Property        | Description                  | Default                              |
|-----------------|------------------------------|--------------------------------------|
| expand          | set default expanded content | false                                |
| title           | title text                   | required                             |
| child           | expanded content             | required                             |
| prefix          | prefix widget                | null                                 |
| suffix          | suffix widget                | null                                 |
| margin          | widget margin                | EdgeInsets.all(10)                   |
| padding         | widget padding               | EdgeInsets.all(10)                   |
| headerPadding   | header padding               | EdgeInsets.all(10)                   |
| decoration      | widget decoration            | null                                 |
| titlePadding    | title padding                | EdgeInsets.symmetric(horizontal: 10) |
| titleStyle      | title text style             | Theme.of(context).textTheme.title    |
| suffixIconColor | suffix icon color            | Colors.black54                       |


## Preview

<img src="https://raw.githubusercontent.com/kzjn10/flutter_expandable_widget/master/screenshot/flutter_01.png" width="320px" />
<img src="https://raw.githubusercontent.com/kzjn10/flutter_expandable_widget/master/screenshot/flutter_02.png" width="320px" />
<img src="https://raw.githubusercontent.com/kzjn10/flutter_expandable_widget/master/screenshot/flutter_03.png" width="320px" />

