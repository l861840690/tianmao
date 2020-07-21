package comparator;

import com.tianmao.pojo.Product;

import java.util.Comparator;


public class ProductAllComparator implements Comparator<Product>{
//比较用来排序的两个数，根据小于等于大于分别返回-1，0，1
	@Override
	public int compare(Product p1, Product p2) {
		return p2.getReviewCount()*p2.getSaleCount()-p1.getReviewCount()*p1.getSaleCount();
	}

}
