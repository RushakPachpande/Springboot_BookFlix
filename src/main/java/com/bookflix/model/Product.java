
package com.bookflix.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 100)
	private String title;

	@Column(length = 100)
	private String author;

	@Column(length = 30)
	private String category;

	private Double price;

	private int stock;

	private String image;

	private int discount;

	private Double discountPrice;

	@Column(columnDefinition = "TINYINT(1)")
	private Boolean isActive;

}
