import 'package:container_case/model/image.dart';
import 'package:flutter/material.dart';

final class ContainerCaseView extends StatelessWidget {
  const ContainerCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ContainerCaseAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              height: 200,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      )),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                  ),
                  InkWell(
                    onTap: () {
                      print('Container tapped');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gallery of Images:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: ImageList.imagelist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(
                            ImageList.imagelist[index].imagePath,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _ContainerCaseAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ContainerCaseAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Awesome Gallery',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
