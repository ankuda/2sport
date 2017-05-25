class Mailer < ActionMailer::Base

  def book_confirmation(book)
    mail(
        to: book.email,
        from: 'yur4ik93@mail.ru',
        subject: 'Бронирование площадки'
    )
  end
end
