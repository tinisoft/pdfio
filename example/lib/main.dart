import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pdfio/pdfio.dart' as pdfio;

void main() {
  /*
  // Open the PDF file...
  ((file = pdfioFileOpen(argv[1], NULL, NULL, NULL, NULL))
    return (1);

  //  printf("%s: %u pages\n", argv[1], (unsigned)pdfioFileGetNumPages(file));

  // Try grabbing content from all of the pages...
  for (i = 0, num_pages = pdfioFileGetNumPages(file); i < num_pages; i ++)
  {

  */
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<int> numPdfPages;
  // late Future<int> sumAsyncResult;

  @override
  void initState() {
    super.initState();
    numPdfPages = pdfio.getPdfPages("test.pdf");
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                spacerSmall,
                FutureBuilder<int>(
                  future: numPdfPages,
                  builder: (BuildContext context, AsyncSnapshot<int> value) {
                    final displayValue =
                        (value.hasData) ? value.data : 'loading';
                    return Text(
                      'await sumAsync(3, 4) = $displayValue',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
