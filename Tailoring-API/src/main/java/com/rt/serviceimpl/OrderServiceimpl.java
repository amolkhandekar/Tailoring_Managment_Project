package com.rt.serviceimpl;

import java.time.LocalDate;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.rt.dto.OrderSlipDTO;
import com.rt.dto.OrderReqDTO;
import com.rt.entity.Order;
import com.rt.mapper.OrderMapper;
import com.rt.repo.OrderRepository;
import com.rt.service.OrderService;

@Service
public class OrderServiceimpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public String saveOrder(OrderReqDTO reqDto) {
        if (reqDto == null) {
            return "Order data is missing";
        }

        Order orderEntity = OrderMapper.toEntity(reqDto);
        Order savedOrder = orderRepository.save(orderEntity);

        if (savedOrder.getId() != null) {
            return "Order saved successfully with Order ID: " + savedOrder.getId();
        } else {
            return "Failed to save order";
        }
    }	

    @Override
    public Page<Order> getAllOrders(String status, String customerName, Pageable pageable) {
        boolean isStatusEmpty = (status == null || status.isEmpty());
        boolean isNameEmpty = (customerName == null || customerName.isEmpty());

        if (isStatusEmpty && isNameEmpty) {
            return orderRepository.findAll(pageable);
        } else if (!isStatusEmpty && isNameEmpty) {
            return orderRepository.findByStatus(status, pageable);
        } else if (isStatusEmpty && !isNameEmpty) {
            return orderRepository.findByCustomerNameContainingIgnoreCase(customerName, pageable);
        } else {
            return orderRepository.filterOrders(status, customerName, pageable);
        }
    }





    @Override
    public OrderReqDTO getOrderById(Long id) {
        return orderRepository.findById(id)
                .map(OrderMapper::toDTO)
                .orElse(null);
    }

    @Override
    public String updateOrder(OrderReqDTO dto) {
        Order order = orderRepository.findById(dto.getId())
                .orElseThrow(() -> new RuntimeException("Order not found"));
        BeanUtils.copyProperties(dto, order);
        orderRepository.save(order);
        return "Order updated successfully";
    }

   

    
    @Override
    public void updateOrderStatus(Long id, String status) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));

        order.setStatus(status);

        if ("Delivered".equalsIgnoreCase(status)) {
            order.setDeliveryDate(LocalDate.now());
        }

        orderRepository.save(order);
    }


    
    





	
	

	

	
}
