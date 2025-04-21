
package com.bookflix.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.bookflix.model.Product;
import com.bookflix.repository.ProductRepository;
import com.bookflix.service.ProductService;
import com.bookflix.util.ImageUtil;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Page<Product> getAllProductsPagination(Integer pageNo, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
		return productRepository.findAll(pageable);
	}

	@Override
	public Product getProductById(Integer id) {
		Product product = productRepository.findById(id).orElse(null);
		return product;
	}

	// @Override
	// public Product saveProduct(Product product) {
	// product.applyDiscount();
	// return productRepository.save(product);
	// }

	@Override
	public Product saveProduct(Product product) {

		if (product.getPrice() != null && product.getDiscount() > 0) {
			Double discountAmount = product.getPrice() * (product.getDiscount() / 100.0);
			Double discountPrice = product.getPrice() - discountAmount;
			product.setDiscountPrice(discountPrice);
		}
		else {
			product.setDiscountPrice(product.getPrice());
		}

		return productRepository.save(product);
	}

	@Override
	public Boolean deleteProduct(Integer id) {
		Product product = productRepository.findById(id).orElse(null);

		if (!ObjectUtils.isEmpty(product)) {
			productRepository.delete(product);
			return true;
		}

		return false;
	}

	// @Override
	// public Product updateProduct(Product product, MultipartFile image) {
	//
	// Product dbProduct = getProductById(product.getId());
	//
	// String imageName = image.isEmpty() ? dbProduct.getImage()
	// : product.getTitle() + ImageUtil.getFileExtension(image);
	//
	// dbProduct.setTitle(product.getTitle());
	// dbProduct.setAuthor(product.getAuthor());
	// dbProduct.setCategory(product.getCategory());
	// dbProduct.setPrice(product.getPrice());
	// dbProduct.setStock(product.getStock());
	// dbProduct.setImage(imageName);
	// dbProduct.setIsActive(product.getIsActive());
	// dbProduct.setDiscount(product.getDiscount());
	// // 5=100*(5/100); 100-5=95
	// Double disocunt = product.getPrice() * (product.getDiscount() / 100.0);
	// Double discountPrice = product.getPrice() - disocunt;
	// dbProduct.setDiscountPrice(discountPrice);
	//
	// Product updateProduct = productRepository.save(dbProduct);
	//
	// if (!ObjectUtils.isEmpty(updateProduct)) {
	//
	// if (!image.isEmpty()) {
	// File saveFile = new File("images/");
	//
	// if (!saveFile.exists()) {
	// saveFile.mkdirs();
	// }
	//
	// Path path = Paths
	// .get(saveFile.getAbsolutePath() + File.separator + "books_img" +
	// File.separator + imageName);
	//
	// try {
	// Files.copy(image.getInputStream(), path,
	// StandardCopyOption.REPLACE_EXISTING);
	// }
	// catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// }
	//
	// return product;
	// }
	//
	// return null;
	// }

	@Override
	public Product updateProduct(Product product, MultipartFile image) {

		Product dbProduct = getProductById(product.getId());

		String imageName = image.isEmpty() ? dbProduct.getImage()
				: product.getTitle() + ImageUtil.getFileExtension(image);

		dbProduct.setTitle(product.getTitle());
		dbProduct.setAuthor(product.getAuthor());
		dbProduct.setCategory(product.getCategory());
		dbProduct.setPrice(product.getPrice());
		dbProduct.setStock(product.getStock());
		dbProduct.setImage(imageName);
		dbProduct.setIsActive(product.getIsActive());
		dbProduct.setDiscount(product.getDiscount());

		// Correct calculation of discount price
		Double discountAmount = product.getPrice() * (product.getDiscount() / 100.0); // Calculate the discount amount
		Double discountPrice = product.getPrice() - discountAmount; // Subtract the discount from the original price

		dbProduct.setDiscountPrice(discountPrice);

		Product updateProduct = productRepository.save(dbProduct);

		if (!ObjectUtils.isEmpty(updateProduct)) {

			if (!image.isEmpty()) {
				File saveFile = new File("images/");

				if (!saveFile.exists()) {
					saveFile.mkdirs();
				}

				Path path = Paths
						.get(saveFile.getAbsolutePath() + File.separator + "books_img" + File.separator + imageName);

				try {
					Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				}
				catch (IOException e) {
					e.printStackTrace();
				}

			}

			return updateProduct; // Return the updated product, not the original product.
		}

		return null;
	}

	@Override
	public List<Product> getAllActiveProducts(String category) {
		List<Product> products = null;

		if (ObjectUtils.isEmpty(category)) {
			products = productRepository.findByIsActiveTrue();
		}
		else {
			products = productRepository.findByCategory(category);
		}

		return products;
	}

	@Override
	public List<Product> searchProduct(String ch) {
		return productRepository.findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(ch, ch);
	}

	@Override
	public Page<Product> searchProductPagination(Integer pageNo, Integer pageSize, String ch) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
		return productRepository.findByTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(ch, ch, pageable);
	}

	@Override
	public Page<Product> getAllActiveProductPagination(Integer pageNo, Integer pageSize, String category) {

		Pageable pageable = PageRequest.of(pageNo, pageSize);
		Page<Product> pageProduct = null;

		if (ObjectUtils.isEmpty(category)) {
			pageProduct = productRepository.findByIsActiveTrue(pageable);
		}
		else {
			pageProduct = productRepository.findByCategory(pageable, category);
		}

		return pageProduct;
	}

	@Override
	public Page<Product> searchActiveProductPagination(Integer pageNo, Integer pageSize, String category, String ch) {

		Page<Product> pageProduct = null;
		Pageable pageable = PageRequest.of(pageNo, pageSize);

		pageProduct = productRepository.findByisActiveTrueAndTitleContainingIgnoreCaseOrCategoryContainingIgnoreCase(ch,
				ch, pageable);

		return pageProduct;
	}

}
