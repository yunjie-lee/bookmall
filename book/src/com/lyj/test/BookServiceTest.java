package com.lyj.test;

import com.lyj.pojo.Book;
import com.lyj.pojo.Page;
import com.lyj.service.BookService;
import com.lyj.service.impl.BookServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class BookServiceTest {
    private BookService bookService = new BookServiceImpl();

    @Test
    public void addBook() {
        bookService.addBook(new Book(null,"lyjuuu","12345",new BigDecimal(10000),100000,0,null));
    }

    @Test
    public void deleteBookById() {
        bookService.deleteBookById(28);
    }

    @Test
    public void updateBook() {
        bookService.updateBook(new Book(28,"lyj6666","12345",new BigDecimal(10000),100000,0,null));
    }

    @Test
    public void queryBookById() {
        System.out.println(bookService.queryBookById(28));
    }

    @Test
    public void queryBooks() {
        for (Book queryBook : bookService.queryBooks()) {
            System.out.println(queryBook);
        }
    }

    @Test
    public void page(){
        System.out.println(bookService.page(1, Page.PAGE_SIZE));
    }

    @Test
    public void pageByPrice(){
        System.out.println(bookService.pageByPrice(1, Page.PAGE_SIZE,10,50));
    }

}