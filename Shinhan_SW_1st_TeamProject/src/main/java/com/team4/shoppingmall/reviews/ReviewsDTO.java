package com.team4.shoppingmall.reviews;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewsDTO {
	Integer review_id;
	Double rate;
	Date review_date;
	String review_img;
	String review_content;
	Integer orderdetail_id;
}