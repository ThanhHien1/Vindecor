//
//  KeyBoardExt.swift
//  Vindecor
//
//  Created by Vo Duc Phong on 03/12/2023.
//

import SwiftUI
import Combine

let standardWidth: CGFloat = 375.0 // Chiều rộng màn hình chuẩn
let standardHeight: CGFloat = 667.0 // Chiều cao màn hình chuẩn

let widthRatio = UIScreen.main.bounds.width / standardWidth
let heightRatio = UIScreen.main.bounds.height / standardHeight

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.top, 0)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    print(self.bottomPadding)
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    let h = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                    self.bottomPadding = (h == 0 ? h : h + heightRatio*22.0) * -1
                    print(self.bottomPadding)
            }
        }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
    
    func noAutoSuggestions(_ keyBd: UIKeyboardType) -> some View {
      self.keyboardType((keyBd == .default) ? .alphabet : keyBd)
          .disableAutocorrection(true)
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

// https://stackoverflow.com/a/14135456/6870041
extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    private static weak var _currentFirstResponder: UIResponder?

    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}
