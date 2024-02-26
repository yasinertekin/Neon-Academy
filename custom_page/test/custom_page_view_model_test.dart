import 'package:custom_page/feature/view_model/custom_page_view_model.dart';
import 'package:custom_page/product/enum/custom_page_view_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomPageViewModel Tests', () {
    test('Initial current page should be CustomPageViewType.one', () {
      // CustomPageViewModel oluştur
      final viewModel = CustomPageViewModel();

      // Başlangıçta, current page'in CustomPageViewType.one olup olmadığını kontrol et
      expect(viewModel.currentPage, equals(CustomPageViewType.one));
    });

    test('Updating current page should notify listeners', () {
      // CustomPageViewModel oluştur
      final viewModel = CustomPageViewModel();

      // Listener'ı oluştur ve view model'e bağla
      var listenerCalled = false;
      viewModel
        ..addListener(() {
          listenerCalled = true;
        })

        // Current page'i güncelle
        ..updateCurrentPage(CustomPageViewType.two);

      // Listener'ın çağrıldığını doğrula
      expect(listenerCalled, isTrue);

      // Current page'in doğru şekilde güncellendiğini doğrula
      expect(viewModel.currentPage, equals(CustomPageViewType.two));
    });

    // Diğer testler buraya eklenebilir...
  });
}
